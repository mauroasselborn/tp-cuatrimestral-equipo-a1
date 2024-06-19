using Dominio;
using Negocio;
using System;
using System.Web.UI;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;


            Usuario usuario = new Usuario();
            usuario.NombreUsuario = inputUsuario.Text;
            usuario.Pass = inputPassword.Text;
            usuario.TipoUsuario = dropTipoUsuario.SelectedValue;

            if (ValidacionesDB.validarUsuario(inputUsuario.Text))
            {
                lblErrorUsuario.Text = "Usuario ya existe";
                return;
            }

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarioNegocio.Agregar(usuario);
            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}