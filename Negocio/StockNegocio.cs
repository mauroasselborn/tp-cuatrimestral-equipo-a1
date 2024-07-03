using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class StockNegocio
    {

        //Listar Todos los registros de Stock
        public List<Stock> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Stock> listaStock = new List<Stock>();

            try
            {
                accesoDatos.setearSP("sp_listar_stocks");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Stock stock = new Stock();
                    stock.ID = (int)accesoDatos.Lector["Id"];

                    stock.Articulo = articuloNegocio.ListarXID((int)accesoDatos.Lector["IdProducto"]);

                    stock.Cantidad = (int)accesoDatos.Lector["Cantidad"];

                    listaStock.Add(stock);
                }

                return listaStock;

            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar el stock", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Lisatr un registro de Stock por ID
        public Stock ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();


            try
            {
                accesoDatos.setearSP("sp_listarID_stock");
                accesoDatos.setearParametro("@id", id);

                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {

                    Stock stock = new Stock();
                    stock.ID = (int)accesoDatos.Lector["Id"];

                    stock.Articulo = articuloNegocio.ListarXID((int)accesoDatos.Lector["IdProducto"]);

                    stock.Cantidad = (int)accesoDatos.Lector["Cantidad"];

                    return stock;
                }
                else return null;

            }
            catch (Exception ex)
            {

                throw new Exception("Error al listar el stock por ID", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Agregar un registro de Stock
        public void Agregar(Stock stock)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_stock");

                accesoDatos.setearParametro("@idProducto", stock.Articulo.ID);
                accesoDatos.setearParametro("@Cantidad", stock.Cantidad);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar el stock", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        //Actualizar un registro de Stock
        public void Update(Stock stock)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_stock");

                accesoDatos.setearParametro("@id", stock.ID);
                accesoDatos.setearParametro("@Cantidad", stock.Cantidad);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el stock con ID: " + stock.ID, ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
