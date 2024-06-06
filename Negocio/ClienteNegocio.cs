using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class ClienteNegocio
    {
        public List<Cliente> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Cliente> lstClientes = new List<Cliente>();
            try
            {
                accesoDatos.setearSP("sp_listar_clientes");
                accesoDatos.ejecutarLectura();


                while (accesoDatos.Lector.Read())
                {
                    Cliente cliente = new Cliente();

                    cliente.Id = (int)accesoDatos.Lector["id"];
                    cliente.Nombre = (string)accesoDatos.Lector["Nombre"];
                    cliente.Apellido = (string)accesoDatos.Lector["Apellido"];
                    cliente.Documento = (string)accesoDatos.Lector["Documento"];
                    cliente.Direccion = (string)accesoDatos.Lector["Direccion"];
                    cliente.Telefono = (string)accesoDatos.Lector["Telefono"];
                    cliente.Mail = (string)accesoDatos.Lector["Mail"];

                    lstClientes.Add(cliente);
                }
                return lstClientes;
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
        public void Agregar(Cliente cliente)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_cliente");

                accesoDatos.setearParametro("@Nombre", cliente.Nombre);
                accesoDatos.setearParametro("@Apellido", cliente.Apellido);
                accesoDatos.setearParametro("@Documento", cliente.Documento);
                accesoDatos.setearParametro("@Direccion", cliente.Direccion);
                accesoDatos.setearParametro("@Telefono", cliente.Telefono);
                accesoDatos.setearParametro("@Mail", cliente.Mail);

                accesoDatos.ejecutarAccion();
                accesoDatos.cerrarConexion();
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
