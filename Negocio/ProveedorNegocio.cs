using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class ProveedorNegocio
    {
        //Listar todos los proveedores
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
                throw new Exception("Error al listar el Proveedor", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Listar proveedor por ID
        public Proveedor ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();


            try
            {
                accesoDatos.setearSP("sp_listarID_proveedor");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();


                if (accesoDatos.Lector.Read())
                {
                    Proveedor proveedor = new Proveedor();

                    proveedor.ID = (int)accesoDatos.Lector["Id"];
                    proveedor.Nombre = accesoDatos.Lector["Nombre"].ToString();
                    proveedor.Empresa = accesoDatos.Lector["Empresa"].ToString();
                    proveedor.Cuit = accesoDatos.Lector["Cuit"].ToString();
                    proveedor.Telefono = accesoDatos.Lector["Telefono"].ToString();
                    proveedor.Direccion = accesoDatos.Lector["Direccion"].ToString();
                    proveedor.Email = accesoDatos.Lector["Email"].ToString();

                    return proveedor;
                }
                else return null;
            }
            catch (Exception ex)
            {

                throw new Exception("Error al listar el proveedor por ID", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Agregar un Proveedor 
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
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar el Proveedor", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Actualizar un proveedor
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
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el proveedor con ID: " + proveedor.ID, ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }


        //Eliminar un proveedor por ID
        public void Eliminar(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_del_proveedor");

                accesoDatos.setearParametro("@id", id);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar el stock con ID: " + id, ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
