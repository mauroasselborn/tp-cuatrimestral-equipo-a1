using Dominio;
using Negocio;
using System;
using System.Web.UI;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        Usuario usuario = new Usuario();
        UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
        Encriptacion encriptacion = new Encriptacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");

            int id = int.Parse(Request.QueryString["id"].ToString());

            usuario = usuarioNegocio.ListarXID(id);


            if (!IsPostBack)
            {
                inputUsuario.Text = usuario.NombreUsuario;
                dropTipoUsuario.SelectedValue = usuario.TipoUsuario;
                inputPassword.Text = encriptacion.Desencripta(usuario.Pass);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            usuario.NombreUsuario = inputUsuario.Text;
            usuario.Pass = inputPassword.Text;
            usuario.TipoUsuario = dropTipoUsuario.SelectedValue;

            if (ValidacionesDB.validarUsuario(usuario.ID, usuario.NombreUsuario))
            {
                lblErrorUsuario.Text = "Usuario ya existe";
                return;
            }

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            usuarioNegocio.Modificar(usuario);
            Response.Redirect("ListarUsuarios.aspx");
        }
    }
}