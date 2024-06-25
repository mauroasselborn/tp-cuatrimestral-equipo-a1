using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Compra
    {
        public Compra() { }

        public int ID { get; set; }
        public List<Articulo> Articulo { get; set; }
        public Proveedor Proveedor { get; set; }
        public int Cantidad { get; set; }
        public float ValorCompra { get; set; }
    }
}
