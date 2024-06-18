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
    public partial class ListarUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Usuario> lstUsuario = new List<Usuario>();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            if (!IsPostBack)
            {
                lstUsuario = usuarioNegocio.Listar();

                rptUsuario.DataSource = lstUsuario;
                rptUsuario.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarUsuario.aspx?id=" + id, false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarioNegocio.Eliminar(id);

            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}