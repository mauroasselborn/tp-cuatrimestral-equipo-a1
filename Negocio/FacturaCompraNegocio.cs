using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class FacturaCompraNegocio
    {
        public List<FacturaCompra> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            accesoDatos.setearSP("sp_listar_facturas_compras");
        }
    }
}
