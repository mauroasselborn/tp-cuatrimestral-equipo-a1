using Dominio;
using System.Collections.Generic;
using System.Linq;

namespace Negocio
{
    public static class ValidacionesDB
    {
        public static bool validarCategoria(string descripcion)
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            List<Categoria> lstCategoria = new List<Categoria>();


            lstCategoria = categoriaNegocio.Listar();

            bool existe = lstCategoria.Any(cat => cat.Descripcion.ToUpper() == descripcion.ToUpper());

            return !existe;

        }
        public static bool validarProveedor(Proveedor pro)
        {
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            List<Proveedor> lstProveedor = new List<Proveedor>();


            lstProveedor = proveedorNegocio.Listar();

            bool existe = lstProveedor.Any(prov =>
                prov.Empresa.ToUpper() == pro.Empresa.ToUpper() ||
                prov.Cuit.ToUpper() == pro.Cuit.ToUpper() ||
                prov.Telefono.ToUpper() == pro.Telefono.ToUpper() ||
                prov.Email.ToUpper() == pro.Email.ToUpper()
            );

            return !existe;
        }
        public static bool validarMarca(Marca marca)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            List<Marca> lstMarca = new List<Marca>();


            lstMarca = marcaNegocio.Listar();

            bool existe = lstMarca.Any(m => m.Descripcion.ToUpper() == marca.Descripcion.ToUpper() && m.id != marca.id);

            return !existe;

        }

        public static bool validarUsuario(Usuario usuario)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            List<Usuario> lstUsuarios = new List<Usuario>();


            lstUsuarios = usuarioNegocio.Listar();

            bool existe = lstUsuarios.Exists(u => u.NombreUsuario.ToUpper() == usuario.NombreUsuario.ToUpper());

            return existe;
        }
    }
}
