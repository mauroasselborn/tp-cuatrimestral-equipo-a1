using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarCategorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Categoria> lstCategoria = new List<Categoria>();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            if (!IsPostBack)
            {
                lstCategoria = categoriaNegocio.Listar();

                rptCategoria.DataSource = lstCategoria;
                rptCategoria.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarCategoria.aspx?id=" + id, false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        
            categoriaNegocio.Eliminar(id);

            Response.Redirect("ListarCategorias.aspx");
            
        }
    }
}