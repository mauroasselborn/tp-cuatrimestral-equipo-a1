using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

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

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            string id = ((Button)sender).CommandArgument;

            Response.Redirect("ABMArticulos.aspx?id=" + id);
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            btnEliminar.ToolTip = ((Button)sender).CommandArgument.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(btnEliminar.ToolTip.ToString());
            try
            {
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                articuloNegocio.Eliminar(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            Response.Redirect("ListarArticulos.aspx");
        }
    }
}