using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class CrearCompra : System.Web.UI.Page
    {
        private List<DetalleCompra> lstdetalleCompras;
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> lstArticulos = new List<Articulo>();

            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            List<Proveedor> lstProveedor = new List<Proveedor>();

            lstArticulos = articuloNegocio.Listar();
            lstProveedor = proveedorNegocio.Listar();


            if (!IsPostBack)
            {
                lstdetalleCompras = new List<DetalleCompra>();
                Session["DetalleCompras"] = lstdetalleCompras;

                rptArticulo.DataSource = lstArticulos;
                rptArticulo.DataBind();

                ddlProveedor.DataSource = lstProveedor;
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "ID";
                ddlProveedor.SelectedValue = lstProveedor[0].ID.ToString();
                ddlProveedor.DataBind();
            }
            else
            {
                lstdetalleCompras = (List<DetalleCompra>)Session["DetalleCompras"];
            }
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            Button btnEliminar = (Button)sender;
            int idArticulo = int.Parse(btnEliminar.CommandArgument);

            RepeaterItem item = (RepeaterItem)btnEliminar.NamingContainer;

            TextBox txtCantidadDetalle = (TextBox)item.FindControl("txtCantidadDetalle");
            Label lblPrecioUnitario = (Label)item.FindControl("lblPrecioUnitario");


            Articulo articulo = articuloNegocio.ListarXID(idArticulo);


            DetalleCompra detalleCompra = lstdetalleCompras.FirstOrDefault(dc => dc.Articulo.ID == idArticulo);
            lstdetalleCompras.Remove(detalleCompra);

            Mensaje("Artículo eliminado correctamente", "Éxito");

            Session["DetalleCompras"] = lstdetalleCompras;

            rptDetalleCompra.DataSource = lstdetalleCompras;
            rptDetalleCompra.DataBind();

            decimal total = lstdetalleCompras.Sum(d => d.Subtotal);
            lblTotal.Text = total.ToString("F2");


        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            Button btnAgregar = (Button)sender;

            int idArticulo = int.Parse(btnAgregar.CommandArgument);

            RepeaterItem item = (RepeaterItem)btnAgregar.NamingContainer;

            TextBox txtCantidadARTCompra = (TextBox)item.FindControl("txtCantidadARTCompra");
            TextBox txtPrecioUnitario = (TextBox)item.FindControl("txtPrecioUnitario");

            if (txtCantidadARTCompra == null || string.IsNullOrWhiteSpace(txtCantidadARTCompra.Text) || int.Parse(txtCantidadARTCompra.Text) <= 0)
            {
                Mensaje("Por favor, ingrese una cantidad válida mayor a 0.", "Error En Cantidades");
                return;
            }

            if (txtPrecioUnitario == null || string.IsNullOrWhiteSpace(txtPrecioUnitario.Text) || int.Parse(txtPrecioUnitario.Text) <= 0)
            {
                Mensaje("Por favor, ingrese un precio válido mayor a 0.", "Error En Precio Unitario");
                return;
            }

            int cantidad = int.Parse(txtCantidadARTCompra.Text);
            decimal precioUnitario = decimal.Parse(txtPrecioUnitario.Text);


            List<DetalleCompra> detalles = (List<DetalleCompra>)Session["DetalleCompras"];


            DetalleCompra detalleExistente = detalles.FirstOrDefault(d => d.Articulo.ID == idArticulo);

            if (detalleExistente != null)
            {
                detalleExistente.Cantidad += cantidad;

                if (detalleExistente.PrecioUnitario != precioUnitario)
                {
                    detalleExistente.PrecioUnitario = precioUnitario;
                }
            }
            else
            {

                DetalleCompra detalleCompra = new DetalleCompra()
                {
                    Articulo = articuloNegocio.ListarXID(idArticulo),
                    Cantidad = cantidad,
                    PrecioUnitario = precioUnitario
                };

                detalles.Add(detalleCompra);
            }


            Session["DetalleCompras"] = detalles;


            rptDetalleCompra.DataSource = detalles;
            rptDetalleCompra.DataBind();


            decimal total = detalles.Sum(d => d.Subtotal);
            lblTotal.Text = total.ToString("F2");
        }


        private void Mensaje(string mensaje, string tipoMensaje)
        {
            lblError.Text = mensaje;
            lblTipoMensaje.Text = tipoMensaje;
            ScriptManager.RegisterStartupScript(this, GetType(), "showToast", "mostrarToast();", true);
        }

        protected void txtCantidadDetalle_TextChanged(object sender, EventArgs e)
        {
            TextBox txtCantidadDetalle = (TextBox)sender;
            RepeaterItem item = (RepeaterItem)txtCantidadDetalle.NamingContainer;

            int idArticulo = int.Parse(((HiddenField)item.FindControl("IdArticulo")).Value);

            int nuevaCantidad = int.Parse(txtCantidadDetalle.Text);


            List<DetalleCompra> detalles = (List<DetalleCompra>)Session["DetalleCompras"];

            DetalleCompra detalle = detalles.FirstOrDefault(d => d.Articulo.ID == idArticulo);

            detalle.Cantidad = nuevaCantidad;

            Session["DetalleCompras"] = detalles;

            rptDetalleCompra.DataSource = detalles;
            rptDetalleCompra.DataBind();

            decimal total = detalles.Sum(d => d.Subtotal);
            lblTotal.Text = total.ToString("F2");
        }

        protected void BtnConfirmarCompra_Click(object sender, EventArgs e)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            CompraNegocio compraNegocio = new CompraNegocio();
            StockNegocio stockNegocio = new StockNegocio();

            try
            {

                List<DetalleCompra> detalles = (List<DetalleCompra>)Session["DetalleCompras"];

                if (detalles == null || detalles.Count == 0)
                {
                    Mensaje("No hay detalles de compra para confirmar.", "Sin Detalle de Compra");
                    return;
                }

                Compra compra = new Compra()
                {
                    Proveedor = proveedorNegocio.ListarXID(int.Parse(ddlProveedor.SelectedValue)),
                    Fecha = DateTime.Now,
                    Detalle = detalles,
                };


                compraNegocio.Agregar(compra);


                foreach (DetalleCompra detalle in compra.Detalle)
                {
                    Stock stock = stockNegocio.Listar().FirstOrDefault(s => s.Articulo.ID == detalle.Articulo.ID);

                    if (stock == null)
                    {
                        stock = new Stock()
                        {
                            Articulo = detalle.Articulo,
                            Cantidad = detalle.Cantidad
                        };

                        stockNegocio.Agregar(stock);
                    }
                    else
                    {
                        stock.Cantidad += detalle.Cantidad;
                        stockNegocio.Update(stock);
                    }
                }


                Session["DetalleCompras"] = new List<DetalleCompra>();
                rptDetalleCompra.DataSource = null;
                rptDetalleCompra.DataBind();
                lblTotal.Text = "0.00";


                Mensaje("Compra confirmada con éxito.", "Éxito");
            }
            catch (Exception ex)
            {
                Mensaje("Error al confirmar la compra: " + ex.Message, "Error");
            }
        }
    }
}