using Dominio;
using Negocio;
using System;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class DetalleProveedor : System.Web.UI.Page
    {
        public Proveedor proveedor = null;
        public string returnUrl;
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");
            int id = int.Parse(Request.QueryString["id"].ToString());

            string Url = Request.QueryString["return"].ToString();

            if (Url == "lstStk") returnUrl = "ListarStock.aspx";
            else returnUrl = "ListarCompras.aspx";

            if (!IsPostBack)
            {
                proveedor = proveedorNegocio.ListarXID(id);
            }
        }
    }
}