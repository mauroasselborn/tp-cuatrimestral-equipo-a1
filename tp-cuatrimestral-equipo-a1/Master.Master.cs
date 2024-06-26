using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class Master : System.Web.UI.MasterPage
    {
        public Usuario usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Logueado"] == null) Response.Redirect("/");

            usuario = (Usuario)Session["Logueado"];
        }

        protected void cerrarSession_Click(object sender, EventArgs e)
        {
            Session.Remove("Logueado");

            Response.Redirect("/");
        }
    }
}
