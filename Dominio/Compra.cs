using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Compra
    {
        public int ID { get; set; }
        public Proveedor Proveedor { get; set; }
        public List<DetalleCompra> Detalle { get; set; }
        public DateTime Fecha { get; set; }
        

        public Compra()
        {
            Detalle = new List<DetalleCompra>();
        }

        //public void AgregarDetalle(DetalleCompra detalle)
        //{
        //    var detalleExistente = Detalle.FirstOrDefault(d => d.Articulo.ID == detalle.Articulo.ID);
        //    if (detalleExistente != null)
        //    {
        //        detalleExistente.Cantidad += detalle.Cantidad;
        //    }
        //    else
        //    {
        //        Detalle.Add(detalle);
        //    }
        //}

        public decimal ValorTotal
        {
            get { return Detalle.Sum(d => d.Subtotal); }
        }
    }
}
