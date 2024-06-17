﻿using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public List<Usuario> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Usuario> lstUsuario = new List<Usuario>();
            try
            {
                accesoDatos.setearSP("sp_listar_Usuario");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    Usuario usuario = new Usuario();
                    usuario.Id = Convert.ToInt32(accesoDatos.Lector["Id"]);
                    usuario.NombreUsuario = accesoDatos.Lector["Nombreusuario"].ToString();
                    usuario.Pass = accesoDatos.Lector["Pass"].ToString();
                    usuario.TipoUsuario = accesoDatos.Lector["TipoUsuario"].ToString();

                    lstUsuario.Add(usuario);
                }

                return lstUsuario;

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
        public Usuario ListarXID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            Usuario usuario = new Usuario();

            try
            {
                accesoDatos.setearSP("sp_listarID_Usuario");
                accesoDatos.setearParametro("@id", id);
                accesoDatos.ejecutarLectura();

                accesoDatos.Lector.Read();

                usuario.Id = (int)(accesoDatos.Lector["Id"]);
                usuario.NombreUsuario = accesoDatos.Lector["NombreUsuario"].ToString();
                usuario.Pass = accesoDatos.Lector["Pass"].ToString();
                usuario.TipoUsuario = accesoDatos.Lector["TipoUsuario"].ToString();

                return usuario;
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

        public void Agregar(Usuario usuario)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearSP("sp_ins_usuario");

                accesoDatos.setearParametro("@Nombre", usuario.NombreUsuario);
                accesoDatos.setearParametro("@Pass", usuario.Pass);
                accesoDatos.setearParametro("@Tipo", usuario.TipoUsuario);

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
                accesoDatos.setearSP("sp_del_usuario");

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

        public void Modificar(Usuario usuario)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearSP("sp_upd_usuario");

                accesoDatos.setearParametro("@Id", usuario.Id);
                accesoDatos.setearParametro("@Nombre", usuario.NombreUsuario);
                accesoDatos.setearParametro("@Pass", usuario.Pass);
                accesoDatos.setearParametro("@Tipo", usuario.TipoUsuario);

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