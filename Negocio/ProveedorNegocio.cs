using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProveedorNegocio
    {
        public List<Proveedor> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Proveedor> lista = new List<Proveedor>();

            try
            {
                accesoDatos.setearSP("sp_listar_proveedores");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Proveedor proveedor = new Proveedor();
                    proveedor.ID = (int)accesoDatos.Lector["Id"];
                    proveedor.Nombre = accesoDatos.Lector["Nombre"].ToString();
                    proveedor.Empresa = accesoDatos.Lector["Empresa"].ToString();
                    proveedor.Cuit = accesoDatos.Lector["Cuit"].ToString();
                    proveedor.Telefono = accesoDatos.Lector["Telefono"].ToString();
                    proveedor.Direccion = accesoDatos.Lector["Direccion"].ToString();
                    proveedor.Email = accesoDatos.Lector["Email"].ToString();

                    lista.Add(proveedor);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
