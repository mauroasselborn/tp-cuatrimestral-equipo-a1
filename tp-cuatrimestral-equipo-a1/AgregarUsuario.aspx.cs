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
            usuario.TipoUsuario = inputConfirmPassword.Text;

            if (!ValidacionesDB.validarUsuario(usuario.NombreUsuario))
            {
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Ese Usuario Ya se encuentra");
                Session.Add("redirect", "AgregarUsuario.aspx");
                Response.Redirect("Error.aspx");
            }

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarioNegocio.Agregar(usuario);
            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}