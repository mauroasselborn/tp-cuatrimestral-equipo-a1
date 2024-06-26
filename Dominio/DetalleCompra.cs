using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetalleCompra
    {
        public int ID { get; set; }
        public Articulo Articulo { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }

        public DetalleCompra(Articulo articulo, int cantidad, decimal precioUnitario)
        {
            Articulo = articulo;
            Cantidad = cantidad;
            PrecioUnitario = precioUnitario;
        }

        public decimal Subtotal
        {
            get { return Cantidad * PrecioUnitario; }
        }
    }
}
