using Dominio;
using Negocio;
using System;
using System.Linq;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class DetalleVenta : System.Web.UI.Page
    {
        public Venta venta = new Venta();
        public int ContadorItem = 1;
        public float Total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("ListarVentas.aspx");

            VentaNegocio ventaNegocio = new VentaNegocio();
            int id = int.Parse(Request.QueryString["id"].ToString());

            venta = ventaNegocio.ListarVentas().Find(x => x.Id == id);
            venta.Items = ventaNegocio.ListarItems(id);

            Total = venta.Items.Sum(x => x.subtotal);
            lblTotal.Text = Total.ToString();

            rptVenta.DataSource = venta.Items;
            rptVenta.DataBind();
        }
    }
}