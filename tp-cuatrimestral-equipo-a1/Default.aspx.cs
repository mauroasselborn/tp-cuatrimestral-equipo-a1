using Dominio;
using Negocio;
using System;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            Usuario usuario = new Usuario();

            usuario = usuarioNegocio.Login(inputUsuario.Text, inputPassword.Text);


            if (usuario != null)
            {
                Session.Add("Logueado", usuario);
                Response.Redirect("Dashboard.aspx");
            }
            else
                return;
        }
    }
}