using Dominio;
using Negocio;
using System;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ViewFactura : System.Web.UI.Page
    {
        public Venta venta = new Venta();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("ListarFacturas.aspx");

            VentaNegocio ventaNegocio = new VentaNegocio();
            int id = int.Parse(Request.QueryString["id"].ToString());

            venta = ventaNegocio.ListarVentas().Find(x => x.Id == id);
            venta.Items = ventaNegocio.ListarItems(id);

            rptFactura.DataSource = venta.Items;
            rptFactura.DataBind();
        }
    }
}