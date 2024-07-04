using Dominio;
using System;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class Master : System.Web.UI.MasterPage
    {
        public Usuario usuario = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Logueado"] == null) Response.Redirect("/");

            //usuario = (Usuario)Session["Logueado"];

            //imgUsuarioLog.ImageUrl = usuario.ImgUrl;
        }

        protected void cerrarSession_Click(object sender, EventArgs e)
        {
            Session.Remove("Logueado");

            Response.Redirect("/");
        }
    }
}
