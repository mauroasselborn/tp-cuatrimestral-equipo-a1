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

                    articulo.marca = new Marca();
                    articulo.marca.id = Convert.ToInt32(accesoDatos.Lector["IdMarca"]);
                    articulo.marca.Descripcion = accesoDatos.Lector["Marca"].ToString();

                    articulo.categoria = new Categoria();
                    articulo.categoria.Id = Convert.ToInt32(accesoDatos.Lector["IdCategoria"]);
                    articulo.categoria.Descripcion = accesoDatos.Lector["Categoria"].ToString();

                    articulo.ProcentajeGanancia = (decimal)accesoDatos.Lector["PorcentajeGanancia"];
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

        public void Agregar(Articulo articulo)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_articulo");

                accesoDatos.setearParametro("@Nombre", articulo.Nombre);
                accesoDatos.setearParametro("@IdMarca", articulo.marca.id);
                accesoDatos.setearParametro("@IdCategoria", articulo.categoria.Id);
                accesoDatos.setearParametro("@ProcentajeGanancia", articulo.ProcentajeGanancia);
                accesoDatos.setearParametro("@StockMinimo", articulo.StockMinimo);

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
