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
    public partial class DetalleProveedor : System.Web.UI.Page
    {
        public Proveedor proveedor = null;
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");
            int id = int.Parse(Request.QueryString["id"].ToString());

            if (!IsPostBack)
            {
                proveedor = proveedorNegocio.ListarXID(id);
            }
        }
    }
}