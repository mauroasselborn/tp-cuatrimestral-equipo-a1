using Dominio;
using System;
using System.Collections.Generic;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> Listar()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            List<Marca> lista = new List<Marca>();

            try
            {
                accesoDatos.setearSP("sp_listar_Marca");
                accesoDatos.ejecutarLectura();

                while (accesoDatos.Lector.Read())
                {
                    lista.Add(new Marca((int)accesoDatos.Lector["id"], (string)accesoDatos.Lector["Descripcion"]));
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
    }
}
