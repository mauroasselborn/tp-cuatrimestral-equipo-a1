using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class CrearVentas : System.Web.UI.Page
    {
        List<Venta> lstVenta = new List<Venta>();
        public int Contador = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();

            lstVenta = ventaNegocio.ListarVentas();

            rptVenta.DataSource = lstVenta;
            rptVenta.DataBind();
        }
    }
}