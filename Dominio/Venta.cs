using System;
using System.Collections.Generic;

namespace Dominio
{
    public class Venta
    {
        public int Id { get; set; }
        public string nroFactura { get; set; }
        public List<ItemVenta> Items { get; set; }
        public Cliente cliente { get; set; }
        public DateTime FechaVenta { get; set; }

        public float totalVenta(Venta venta)
        {
            float total = 0;
            foreach (ItemVenta item in venta.Items)
            {

                total += item.Precio * item.Cantidad;
            }
            return total;
        }
    }
}
