using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class CrearCompras : System.Web.UI.Page
    {
        private List<DetalleCompra> lstdetalleCompras;
        protected void Page_Load(object sender, EventArgs e)
        {

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> lstArticulos = new List<Articulo>();


            lstArticulos = articuloNegocio.Listar();


            if (!IsPostBack)
            {
                lstdetalleCompras = new List<DetalleCompra>();
                Session["DetalleCompras"] = lstdetalleCompras;

                rptArticulo.DataSource = lstArticulos;
                rptArticulo.DataBind();


            }
            else
            {
                lstdetalleCompras = (List<DetalleCompra>)Session["DetalleCompras"];
            }
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            int idArtriculo = int.Parse(((Button)sender).CommandArgument.ToString());

            DetalleCompra detalleCompra = new DetalleCompra();

            detalleCompra.Articulo = articuloNegocio.ListarXID(idArtriculo);
            detalleCompra.Cantidad = 12;
            detalleCompra.PrecioUnitario = 1500;


            lstdetalleCompras.Add(detalleCompra);

            Session["DetalleCompras"] = lstdetalleCompras;

            rptDetalleCompra.DataSource = lstdetalleCompras;
            rptDetalleCompra.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}