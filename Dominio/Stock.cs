using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Stock
    {
        public int ID { get; set; }
        //public Articulo Articulo { get; set; }
        public Proveedor Proveedor { get; set; }
        public int Cantidad { get; set; }
    }
}
