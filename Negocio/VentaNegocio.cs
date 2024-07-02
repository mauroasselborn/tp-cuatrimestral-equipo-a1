﻿using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class VentaNegocio
    {
        public List<Venta> ListarVentas()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Venta> lstVenta = new List<Venta>();
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            try
            {
                accesoDatos.setearSP("sp_List_factura");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Venta venta = new Venta();

                    venta.Id = Convert.ToInt32(accesoDatos.Lector["Id"]);
                    venta.nroFactura = accesoDatos.Lector["NroFactura"].ToString();
                    venta.FechaVenta = Convert.ToDateTime(accesoDatos.Lector["Fecha"]).Date;
                    venta.cliente = new Cliente();
                    venta.cliente = clienteNegocio.Listar().Find(x => x.ID == (int)accesoDatos.Lector["IdCliente"]);
                    venta.MetodoPago = new MetodoPago();
                    venta.MetodoPago.ID = (int)accesoDatos.Lector["IdMetodoPago"];
                    venta.MetodoPago.Descripcion = accesoDatos.Lector["DescMetodo"].ToString();
                    venta.Total = float.Parse(accesoDatos.Lector["Total"].ToString());

                    lstVenta.Add(venta);
                }
                return lstVenta;
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
        public int AgregarVenta(Venta venta)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            int id;
            try
            {
                accesoDatos.setearSP("sp_ins_factura");

                accesoDatos.setearParametro("@nroFactura", venta.nroFactura);
                accesoDatos.setearParametro("@Fecha", venta.FechaVenta);
                accesoDatos.setearParametro("@IdCliente", venta.cliente.ID);
                accesoDatos.setearParametro("@IdMetodoPago", venta.MetodoPago.ID);
                accesoDatos.setearParametro("@Total", venta.Total);

                id = accesoDatos.ejecutarAccionReturn();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

            return id;
        }

        public void AgregarItems(ItemVenta item, int Id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_item_factura");

                accesoDatos.setearParametro("@IdFactura", Id);
                accesoDatos.setearParametro("@IdArticulo", item.articulo.ID);
                accesoDatos.setearParametro("@Cantidad", item.Cantidad);
                accesoDatos.setearParametro("@Precio", item.Precio);
                accesoDatos.setearParametro("@Subtotal", item.subtotal);
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
        public void AgregarPagoCuotas(Venta venta, int Id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_cuotas");

                accesoDatos.setearParametro("@IdFactura", Id);
                accesoDatos.setearParametro("@Cantidad", venta.CantidadCuotas);
                accesoDatos.setearParametro("@Precio", venta.Total / venta.CantidadCuotas);
                accesoDatos.setearParametro("@Total", venta.Total);
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
