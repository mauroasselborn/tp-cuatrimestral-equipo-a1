using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Negocio
{
    public class CompraNegocio
    {

        // Listar todas las compras
        public List<Compra> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            List<Compra> lstCompras = new List<Compra>();

            try
            {
                accesoDatos.setearSP("sp_listar_compras");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Compra compra = new Compra();

                    compra.ID = (int)accesoDatos.Lector["ID"];
                    compra.Fecha = (DateTime)accesoDatos.Lector["Fecha"];

                    compra.Proveedor = proveedorNegocio.ListarXID((int)accesoDatos.Lector["IdProveedor"]);

                    compra.Detalle = ListarDetalleCompra(compra.ID);

                    lstCompras.Add(compra);
                }

                return lstCompras;

            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar las Compras", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        // Listar compra por ID
        public Compra ListarXID(int IdCompra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();

            try
            {
                accesoDatos.setearSP("sp_listarID_compra");
                accesoDatos.setearParametro("@ID", IdCompra);
                accesoDatos.ejecutarLectura();

                if (accesoDatos.Lector.Read())
                {
                    Compra compra = new Compra();
                    compra.ID = (int)accesoDatos.Lector["ID"];
                    compra.Fecha = (DateTime)accesoDatos.Lector["Fecha"];

                    compra.Proveedor = proveedorNegocio.ListarXID((int)accesoDatos.Lector["IdProveedor"]);

                    compra.Detalle = ListarDetalleCompra(compra.ID);

                    return compra;
                }
                else return null;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar la compra por ID", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        // Agregar una compra
        public void Agregar(Compra compra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_compra");

                accesoDatos.setearParametro("@IdProveedor", compra.Proveedor.ID);
                accesoDatos.setearParametro("@Fecha", compra.FechaFormateada);
                accesoDatos.setearParametro("@ValorTotal", compra.ValorTotal);

                // Guardo el ID del registro insertado en la DB
                int idCompra = accesoDatos.idRegistroInsertado();

                // Agregar detalles de compra
                foreach (var detalle in compra.Detalle)
                {
                    AgregarDetalleCompra(idCompra, detalle);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar la Compra", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        // Actualizar una compra
        public void Update(Compra compra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_compra");

                accesoDatos.setearParametro("@ID", compra.ID);
                accesoDatos.setearParametro("@IdProveedor", compra.Proveedor.ID);
                accesoDatos.setearParametro("@Fecha", compra.FechaFormateada);
                accesoDatos.setearParametro("@ValorTotal", compra.ValorTotal);

                accesoDatos.ejecutarAccion();

                // Actualizar detalles de compra
                foreach (DetalleCompra detalle in compra.Detalle)
                {
                    UpdateDetalleCompra(compra.ID, detalle);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar la compra con ID: " + compra.ID, ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        // Eliminar una compra por ID
        public void Eliminar(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_del_compra");

                accesoDatos.setearParametro("@ID", id);

                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al eliminar la compra con ID: " + id, ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }


        //Listar Detalles de Compra para cada Compra
        private List<DetalleCompra> ListarDetalleCompra(int IdCompra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<DetalleCompra> detalles = new List<DetalleCompra>();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            try
            {
                accesoDatos.setearSP("sp_listar_detalle_compra");
                accesoDatos.setearParametro("@IdCompra", IdCompra);
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    DetalleCompra detalle = new DetalleCompra();
                    detalle.Articulo = articuloNegocio.ListarXID((int)accesoDatos.Lector["IdArticulo"]);
                    detalle.Cantidad = (int)accesoDatos.Lector["Cantidad"];
                    detalle.PrecioUnitario = (decimal)accesoDatos.Lector["PrecioUnitario"];

                    detalles.Add(detalle);
                }

                return detalles;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar los detalles de la compra", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        private void AgregarDetalleCompra(int IdCompra, DetalleCompra detalle)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_detalle_compra");

                accesoDatos.setearParametro("@IdCompra", IdCompra);
                accesoDatos.setearParametro("@IdArticulo", detalle.Articulo.ID);
                accesoDatos.setearParametro("@Cantidad", detalle.Cantidad);
                accesoDatos.setearParametro("@PrecioUnitario", detalle.PrecioUnitario);


                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al agregar el detalle de compra", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        private void UpdateDetalleCompra(int IdCompra, DetalleCompra detalle)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_upd_detalle_compra");

                accesoDatos.setearParametro("@IdCompra", IdCompra);
                accesoDatos.setearParametro("@ArticuloId", detalle.Articulo.ID);
                accesoDatos.setearParametro("@Cantidad", detalle.Cantidad);
                accesoDatos.setearParametro("@PrecioUnitario", detalle.PrecioUnitario);

                accesoDatos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al actualizar el detalle de compra", ex);
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }
    }
}
