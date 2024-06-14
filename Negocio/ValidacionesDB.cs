using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public static class ValidacionesDB
    {
        public static bool validarCategoria(string descripcion)
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            List<Categoria> lstCategoria = new List<Categoria>();
            Categoria categoria = new Categoria();

            lstCategoria = categoriaNegocio.Listar();

            categoria = lstCategoria.Find(cat => cat.Descripcion.ToUpper() == descripcion.ToUpper());

            if (categoria == null) return true;
            return false;
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

            if (!existe) return true;
            return false;
        }
    }
}
