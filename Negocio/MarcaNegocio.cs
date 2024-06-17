using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Marca> lista = new List<Marca>();

            try
            {
                accesoDatos.setearSP("sp_listar_Marca");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    lista.Add(new Marca((int)accesoDatos.Lector["id"], (string)accesoDatos.Lector["Descripcion"]));
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


        //Listar Marca por ID
        public Marca ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();


            try
            {
                accesoDatos.setearSP("sp_listarID_Marca");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    Marca marca = new Marca((int)accesoDatos.Lector["id"], (string)accesoDatos.Lector["Descripcion"]);

                    return marca;

                }
                else return null;

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

        //Agregar una Marca
        public void Agregar(string descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_marca");
                accesoDatos.setearParametro("@Descripcion", descripcion);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar la marca", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }


        //Actualizar una Marca 
        public void Update(int id, string descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_marca");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.setearParametro("@Descripcion", descripcion);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar la marca", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Eliminar una Categoria por ID
        public void Eliminar(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_del_marca");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar la marca", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
