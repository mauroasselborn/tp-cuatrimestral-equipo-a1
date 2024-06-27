using Dominio;
using System;

namespace Negocio
{
    public class VentaNegocio
    {
        public void AgregarVenta(Venta venta)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_factura");

                accesoDatos.setearParametro("@Id", venta.Id);
                accesoDatos.setearParametro("@Fecha", venta.FechaVenta);
                accesoDatos.setearParametro("@IdCliente", venta.cliente.ID);
                accesoDatos.setearParametro("@Total", venta.totalVenta(venta));
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

        public void AgregarItems(Venta venta)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                foreach (var item in venta.Items)
                {
                    accesoDatos.setearSP("sp_ins_item_factura");

                    accesoDatos.setearParametro("@IdFactura", venta.Id);
                    accesoDatos.setearParametro("@IdArticulo", item.articulo.ID);
                    accesoDatos.setearParametro("@Cantidad", item.Cantidad);
                    accesoDatos.setearParametro("@Precio", item.Precio);
                    accesoDatos.setearParametro("@Subtotal", item.subtotal);

                }

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
