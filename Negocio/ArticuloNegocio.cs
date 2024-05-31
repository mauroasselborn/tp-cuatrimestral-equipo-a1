using Dominio;
using System;

namespace Negocio
{
    public class ArticuloNegocio
    {
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
