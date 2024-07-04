using System;
using System.Collections.Generic;
using System.Linq;

namespace Dominio
{
    public class Compra
    {
        public int ID { get; set; }
        public Proveedor Proveedor { get; set; }
        public List<DetalleCompra> Detalle { get; set; }
        public DateTime Fecha { get; set; }
        public string FechaFormateada => Fecha.ToString("dd/MM/yyyy");


        public Compra()
        {
            Detalle = new List<DetalleCompra>();
        }

        public decimal ValorTotal => Detalle.Sum(d => d.Subtotal);

    }
}
