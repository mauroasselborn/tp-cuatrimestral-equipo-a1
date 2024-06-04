using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class CrearVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Articulo> lstProductos = new List<Articulo>();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            if (!IsPostBack)
            {
                lstProductos = articuloNegocio.Listar();

                lstArticulos.DataSource = lstProductos;
                lstArticulos.DataBind();
            }
        }
    }
}