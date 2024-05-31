using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Proveedor
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Empresa { get; set; }
        public string Cuit { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Email { get; set; }
    }
}
