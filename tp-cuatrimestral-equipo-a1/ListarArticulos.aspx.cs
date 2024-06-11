using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio ArticuloNegocio = new ArticuloNegocio();
            List<Articulo> lstArticulo = new List<Articulo>();

            if (!IsPostBack)
            {
                lstArticulo = ArticuloNegocio.Listar();

                rptArticulo.DataSource = lstArticulo;
                rptArticulo.DataBind();

            }
        }
    }
}