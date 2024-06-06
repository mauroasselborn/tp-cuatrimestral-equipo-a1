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

        public void Agregar(Proveedor proveedor)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_proveedor");

                accesoDatos.setearParametro("@Nombre", proveedor.Nombre);
                accesoDatos.setearParametro("@Empresa", proveedor.Empresa);
                accesoDatos.setearParametro("@Cuit", proveedor.Cuit);
                accesoDatos.setearParametro("@Telefono", proveedor.Telefono);
                accesoDatos.setearParametro("@Direccion", proveedor.Direccion);
                accesoDatos.setearParametro("@Email", proveedor.Email);

                accesoDatos.ejecutarAccion();
                accesoDatos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public void Update(Proveedor proveedor)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_proveedor");

                accesoDatos.setearParametro("@id", proveedor.ID);
                accesoDatos.setearParametro("@Nombre", proveedor.Nombre);
                accesoDatos.setearParametro("@Empresa", proveedor.Empresa);
                accesoDatos.setearParametro("@Cuit", proveedor.Cuit);
                accesoDatos.setearParametro("@Telefono", proveedor.Telefono);
                accesoDatos.setearParametro("@Direccion", proveedor.Direccion);
                accesoDatos.setearParametro("@Email", proveedor.Email);

                accesoDatos.ejecutarAccion();
                accesoDatos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public void Eliminar(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_del_proveedor");

                accesoDatos.setearParametro("@id", id);

                accesoDatos.ejecutarAccion();
                accesoDatos.cerrarConexion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
