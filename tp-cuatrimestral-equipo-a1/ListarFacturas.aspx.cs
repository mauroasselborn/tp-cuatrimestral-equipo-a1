using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarFacturas : System.Web.UI.Page
    {
        List<Venta> lstVenta = new List<Venta>();
        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();

            lstVenta = ventaNegocio.ListarVentas();

            rptVenta.DataSource = lstVenta;
            rptVenta.DataBind();
        }

        protected void BtnVer_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            int IdFactura = Convert.ToInt32(((ImageButton)sender).CommandArgument);

            Response.Redirect("ViewFactura.aspx?id=" + IdFactura.ToString());
        }
    }
}