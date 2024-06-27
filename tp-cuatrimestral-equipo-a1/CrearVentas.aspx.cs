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

                Total = Venta.Items.Sum(x => x.subtotal);
                lblTotal.Text = Total.ToString();
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ItemVenta itemVenta;
            int idArticulo = Convert.ToInt32(((Button)sender).CommandArgument);

            List<Articulo> lstArt = (List<Articulo>)Session["lstArticulos"];

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
            Total = Venta.Items.Sum(x => x.subtotal);
            lblTotal.Text = Total.ToString();

            rptVenta.DataSource = Venta.Items;
            rptVenta.DataBind();
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

                Total = Venta.Items.Sum(x => x.subtotal);
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

            Total = Venta.Items.Sum(x => x.subtotal);
            lblTotal.Text = Total.ToString();

            rptVenta.DataSource = Venta.Items;
            rptVenta.DataBind();
        }

        protected void BtnPago_Click(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();
            List<Cliente> clientes = (List<Cliente>)Session["lstClientes"];

            try
            {
                if (Venta.Id == 0)
                {
                    Venta.nroFactura = "0001-000001";
                }
                else
                {
                    Venta.nroFactura = "0001-00000" + Venta.Id;
                }

                Venta.cliente = clientes.Find(x => x.ID == int.Parse(ddlClientes.SelectedValue));
                Venta.FechaVenta = DateTime.Now;

                ventaNegocio.AgregarVenta(Venta);
                ventaNegocio.AgregarItems(Venta);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}