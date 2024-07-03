using System;

namespace Dominio
{
    public class FacturaCompra
    {
        public DateTime Fecha { get; set; }
        public string Numero { get; set; }
        public Proveedor Proveedor { get; set; }
        public Compra Compra { get; set; }  
        public MetodoPago MetodoPago { get; set; }
        public decimal Total { get; set; }

        public string FechaFormateada => Fecha.ToString("dd-MM-yyyy");

    }
}
