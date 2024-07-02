using Dominio;
using System;
using System.Collections.Generic;


namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Articulo> lstArticulo = new List<Articulo>();
            try
            {
                accesoDatos.setearSP("sp_listar_Articulo");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.ID = Convert.ToInt32(accesoDatos.Lector["Id"]);
                    articulo.Nombre = accesoDatos.Lector["Nombre"].ToString();
                    articulo.Codigo = accesoDatos.Lector["Codigo"].ToString();

                    articulo.Marca = new Marca();
                    articulo.Marca.ID = Convert.ToInt32(accesoDatos.Lector["IdMarca"]);
                    articulo.Marca.Descripcion = accesoDatos.Lector["Marca"].ToString();

                    articulo.Categoria = new Categoria();
                    articulo.Categoria.ID = Convert.ToInt32(accesoDatos.Lector["IdCategoria"]);
                    articulo.Categoria.Descripcion = accesoDatos.Lector["Categoria"].ToString();

                    articulo.ProcentajeGanancia = float.Parse(accesoDatos.Lector["PorcentajeGanancia"].ToString());
                    articulo.StockMinimo = (int)accesoDatos.Lector["StockMinimo"];

                    lstArticulo.Add(articulo);
                }

                return lstArticulo;

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


        //Listar un articulo por ID
        public Articulo ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Articulo articulo = new Articulo();
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();


            try
            {
                accesoDatos.setearSP("sp_listarID_Articulo");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                accesoDatos.Lector.Read();

                articulo.ID = (int)(accesoDatos.Lector["Id"]);
                articulo.Nombre = accesoDatos.Lector["Nombre"].ToString();
                articulo.Codigo = accesoDatos.Lector["Codigo"].ToString();

                articulo.Marca = marcaNegocio.ListarXID((int)(accesoDatos.Lector["IdMarca"]));
                articulo.Categoria = categoriaNegocio.ListarXID((int)(accesoDatos.Lector["IdCategoria"]));

                articulo.ProcentajeGanancia = float.Parse(accesoDatos.Lector["PorcentajeGanancia"].ToString());
                articulo.StockMinimo = (int)accesoDatos.Lector["StockMinimo"];

                return articulo;
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

        public void Agregar(Articulo articulo)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_articulo");

                accesoDatos.setearParametro("@Nombre", articulo.Nombre);
                accesoDatos.setearParametro("@Codigo", articulo.Codigo);
                accesoDatos.setearParametro("@IdMarca", articulo.Marca.ID);
                accesoDatos.setearParametro("@IdCategoria", articulo.Categoria.ID);
                accesoDatos.setearParametro("@ProcentajeGanancia", articulo.ProcentajeGanancia);
                accesoDatos.setearParametro("@StockMinimo", articulo.StockMinimo);

                accesoDatos.ejecutarAccion();

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

        public void Eliminar(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearSP("sp_del_articulo");

                accesoDatos.setearParametro("@Id", id);
                accesoDatos.ejecutarAccion();
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

        public void Modificar(Articulo articulo)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearSP("sp_upd_articulo");

                accesoDatos.setearParametro("@Id", articulo.ID);
                accesoDatos.setearParametro("@Nombre", articulo.Nombre);
                accesoDatos.setearParametro("@Codigo", articulo.Codigo);
                accesoDatos.setearParametro("@IdMarca", articulo.Marca.ID);
                accesoDatos.setearParametro("@IdCategoria", articulo.Categoria.ID);
                accesoDatos.setearParametro("@ProcentajeGanancia", articulo.ProcentajeGanancia);
                accesoDatos.setearParametro("@StockMinimo", articulo.StockMinimo);

                accesoDatos.ejecutarAccion();

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
