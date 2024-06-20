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

            usuario = usuarioNegocio.Login(inputEmail.Text, inputPassword.Text);

            //El momento de desarrollar el login es sacar el 1==2 y en el else pasar un return y un mensaje de contrasenia invalida
            if (usuario != null && 1 == 2)
            {
                Session.Add("Loguedo", new Usuario());
                Response.Redirect("Dashboard.aspx");
            }
            else
                Response.Redirect("Default.aspx");
        }
    }
}