using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Categoria> lista = new List<Categoria>();

            try
            {
                accesoDatos.setearSP("sp_listar_categoria");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    lista.Add(new Categoria((int)accesoDatos.Lector["id"], (string)accesoDatos.Lector["Descripcion"]));
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

        public Categoria ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Categoria categoria = new Categoria();

            try
            {
                accesoDatos.setearSP("sp_listarID_categoria");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();


                categoria.Id = (int)accesoDatos.Lector["id"];
                categoria.Descripcion = (string)accesoDatos.Lector["Descripcion"].ToString();


                return categoria;

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

        public void Agregar(string Descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_categoria");

                accesoDatos.setearParametro("@Descripcion", Descripcion);

                accesoDatos.ejecutarAccion();

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

        public void Update(int id, string Descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_categoria");

                accesoDatos.setearParametro("@id", id);
                accesoDatos.setearParametro("@Descripcion", Descripcion);

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
                accesoDatos.setearSP("sp_del_categoria");

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
