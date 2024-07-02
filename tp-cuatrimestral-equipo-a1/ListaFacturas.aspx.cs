using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListaFacturas : System.Web.UI.Page
    {
        public List<Venta> lstVentas { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio ventaNegocio = new VentaNegocio();

            lstVentas = ventaNegocio.ListarVentas();
        }
    }
}