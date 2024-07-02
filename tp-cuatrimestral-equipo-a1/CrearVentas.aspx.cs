using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class Ventas : System.Web.UI.Page
    {
        public Venta Venta;
        float Total;
        public int numero = 1;
        public List<Articulo> lstArticulo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio ArticuloNegocio = new ArticuloNegocio();
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            Venta = (Venta)Session["Venta"];

            if (Venta == null)
            {
                Venta = new Venta();

                if (Venta.Items == null) Venta.Items = new List<ItemVenta>();
            }



            if (!IsPostBack)
            {
                lstArticulo = ArticuloNegocio.Listar();

                foreach (var item in lstArticulo)
                {
                    float porcentaje = (item.ProcentajeGanancia / 100);
                    item.Precio = 2 + (porcentaje * 2);

                }
                Session.Add("lstArticulos", lstArticulo);

                rptArticulo.DataSource = lstArticulo;
                rptArticulo.DataBind();

                if (Venta != null)
                {
                    rptVenta.DataSource = Venta.Items;
                    rptVenta.DataBind();
                }
                #region DLLs
                List<Cliente> LstClientes = clienteNegocio.Listar();
                Session.Add("lstClientes", LstClientes);

                ddlClientes.DataSource = LstClientes;
                ddlClientes.DataTextField = "Nombre";
                ddlClientes.DataValueField = "Id";
                ddlClientes.DataBind();

                #endregion

                if (Venta.Items != null)
                {
                    Total = Venta.Items.Sum(x => x.subtotal);
                    lblTotal.Text = Total.ToString();
                }

            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ItemVenta itemVenta;
            int idArticulo = Convert.ToInt32(((Button)sender).CommandArgument);

            List<Articulo> lstArt = (List<Articulo>)Session["lstArticulos"];

            BtnMetodoPago.Visible = true;

            if (Venta.Items.Exists(x => x.articulo.ID == idArticulo))
            {
                int indexItem = Venta.Items.FindIndex(x => x.articulo.ID == Convert.ToInt32(idArticulo));
                itemVenta = Venta.Items.Find(x => x.articulo.ID == idArticulo);
                itemVenta.Cantidad += 1;
                itemVenta.subtotal = itemVenta.Cantidad * itemVenta.Precio;

                Venta.Items[indexItem] = itemVenta;

                Session.Add("Venta", Venta);
            }
            else
            {
                Articulo auxArt = new Articulo();
                auxArt = lstArt.Find(x => x.ID == idArticulo);

                itemVenta = new ItemVenta();
                itemVenta.articulo = auxArt;
                itemVenta.Cantidad = 1;
                itemVenta.Precio = auxArt.Precio;
                itemVenta.subtotal = auxArt.Precio;

                Venta.Items.Add(itemVenta);

                Session.Add("Venta", Venta);
            }
            Total = CalcularTotal();
            lblTotal.Text = Total.ToString();

            rptVenta.DataSource = Venta.Items;
            rptVenta.DataBind();
        }

        private float CalcularTotal()
        {
            return Venta.Items.Sum(x => x.subtotal);
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(((TextBox)sender).Text) > 0)
            {
                int cantidad = Convert.ToInt32(((TextBox)sender).Text);
                var Item = Venta.Items.Find(x => x.articulo.ID == Convert.ToInt32(((TextBox)sender).ToolTip));

                Item.Cantidad = cantidad;
                Item.subtotal = Item.articulo.Precio * cantidad;

                Session.Add("Venta", Venta);

                Total = CalcularTotal();
                lblTotal.Text = Total.ToString();

                rptVenta.DataSource = Venta.Items;
                rptVenta.DataBind();
            }
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            int idItem = Convert.ToInt32(((Button)sender).CommandArgument);
            ItemVenta itemSelec = Venta.Items.Find(x => x.articulo.ID == idItem);

            Venta.Items.Remove(itemSelec);

            Session.Add("Venta", Venta);

            Total = CalcularTotal();
            lblTotal.Text = Total.ToString();

            rptVenta.DataSource = Venta.Items;
            rptVenta.DataBind();
        }

        protected void BtnPago_Click(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            List<Cliente> clientes = (List<Cliente>)Session["lstClientes"];
            int IdFact;

            int id = ventaNegocio.ListarVentas().Count() == 0 ? 0 : ventaNegocio.ListarVentas().Last().Id;
            try
            {
                NumerarFactura(id);
                Venta.cliente = clientes.Find(x => x.ID == int.Parse(ddlClientes.SelectedValue));
                Venta.FechaVenta = DateTime.Now.Date;

                Venta.MetodoPago = new MetodoPago();
                Venta.MetodoPago.ID = Convert.ToInt32(ddlCuotas.SelectedValue);

                if (Venta.MetodoPago.ID == 3)
                {
                    Venta.Total = float.Parse(MetodoTotal.Text);
                    Venta.CantidadCuotas = Convert.ToInt32(ddlCuotas.SelectedValue);
                }
                else
                {
                    Venta.Total = CalcularTotal();
                }

                IdFact = ventaNegocio.AgregarVenta(Venta);

                if (Venta.MetodoPago.ID == 3)
                {
                    ventaNegocio.AgregarPagoCuotas(Venta, IdFact);
                }

                foreach (var item in Venta.Items)
                {
                    ventaNegocio.AgregarItems(item, IdFact);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            string script = "document.getElementById('ModalConfirmar').style.display = 'block';";
            ClientScript.RegisterStartupScript(this.GetType(), "ModalConfirmar", script, true);

            Session["Venta"] = null;

            Response.Redirect("ListaFacturas.aspx");
        }

        private void NumerarFactura(int id)
        {
            if (id == 0)
            {
                Venta.nroFactura = "0001-000001";
            }
            else
            {
                if (id < 10)
                {
                    Venta.nroFactura = "0001-00000" + id.ToString();
                }
                else
                if (id >= 10 && id < 100)
                {
                    Venta.nroFactura = "0001-0000" + id.ToString();
                }
                else
                if (id >= 100 && id < 1000)
                {
                    Venta.nroFactura = "0001-000" + id.ToString();
                }
                else
                if (id >= 100 && id < 1000)
                {
                    Venta.nroFactura = "0001-00" + id.ToString();
                }
                else
                if (id >= 1000 && id < 10000)
                {
                    Venta.nroFactura = "0001-0" + id.ToString();
                }
                else
                if (id >= 10000 && id < 100000)
                {
                    Venta.nroFactura = "0001-" + id.ToString();
                }
            }

        }

        protected void BtnMetodoPago_Click(object sender, EventArgs e)
        {
            MetodoTotal.Text = CalcularTotal().ToString();
            string script = "document.getElementById('ModalMetodoPago').style.display = 'block';";
            ClientScript.RegisterStartupScript(this.GetType(), "ModalMetodo", script, true);
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void ddlMetodoPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            float Total = CalcularTotal();
            MetodoTotal.Text = Total.ToString();

            if (Convert.ToInt32(ddlMetodoPago.SelectedValue) == 3)
            {
                ddlCuotas.Visible = true;
                lblTotalMes.Visible = true;
                lblTextTotal.Visible = true;

                float TotalInteres = Total + (Total * ((float)7.88 / 100));
                lblTotalMes.Text = (TotalInteres / 3).ToString();
                MetodoTotal.Text = TotalInteres.ToString();
            }
            else
            {
                MetodoTotal.Text = Total.ToString();

                lblTextTotal.Visible = false;
                ddlCuotas.Visible = false;
                lblTotalMes.Text = "";
            }
            string script = "document.getElementById('ModalMetodoPago').style.display = 'block';";
            ClientScript.RegisterStartupScript(this.GetType(), "ModalMetodo", script, true);
        }

        protected void ddlCuotas_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CantCuotas = Convert.ToInt32(ddlCuotas.SelectedValue);
            float TotalInteres;
            float Total = CalcularTotal();


            switch (CantCuotas)
            {
                case 3:
                    TotalInteres = Total + (Total * ((float)7.88 / 100));
                    lblTotalMes.Text = (TotalInteres / 3).ToString();
                    MetodoTotal.Text = TotalInteres.ToString();
                    break;
                case 6:
                    TotalInteres = Total + (Total * ((float)16.08 / 100));
                    lblTotalMes.Text = (TotalInteres / 6).ToString();
                    MetodoTotal.Text = TotalInteres.ToString();
                    break;
                case 9:
                    TotalInteres = Total + (Total * ((float)24.85 / 100));
                    lblTotalMes.Text = (TotalInteres / 9).ToString();
                    MetodoTotal.Text = TotalInteres.ToString();
                    break;
                case 12:
                    TotalInteres = Total + (Total * ((float)34.22 / 100));
                    lblTotalMes.Text = (TotalInteres / 12).ToString();
                    MetodoTotal.Text = TotalInteres.ToString();
                    break;
                default:

                    break;
            }


            string script = "document.getElementById('ModalMetodoPago').style.display = 'block';";
            ClientScript.RegisterStartupScript(this.GetType(), "ModalMetodo", script, true);
        }
    }
}