using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class CategoriaNegocio
    {
        //Listar Todas las Categorias
        public List<Categoria> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Categoria> lista = new List<Categoria>();

            try
            {
                accesoDatos.setearSP("sp_listar_categorias");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    lista.Add(new Categoria((int)accesoDatos.Lector["id"], accesoDatos.Lector["Descripcion"].ToString()));
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar las categorías", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Listar Categoria por ID
        public Categoria ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Categoria categoria = null;

            try
            {
                accesoDatos.setearSP("sp_listarID_categoria");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    categoria = new Categoria((int)accesoDatos.Lector["id"], accesoDatos.Lector["Descripcion"].ToString());
                    return categoria;
                }
                else return null;

            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar la categoría por ID", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }


        //Agregar una Categoria
        public void Agregar(string descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_categoria");
                accesoDatos.setearParametro("@Descripcion", descripcion);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar la categoría", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }


        //Actualizar una Categoria 
        public void Update(int id, string descripcion)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_categoria");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.setearParametro("@Descripcion", descripcion);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar la categoría", ex);
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
                accesoDatos.setearSP("sp_del_categoria");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar la categoría", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
