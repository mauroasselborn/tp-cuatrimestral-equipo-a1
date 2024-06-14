using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class AgregarProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (!Page.IsValid) return;

            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            Proveedor proveedor = new Proveedor();

            proveedor.Nombre = txtNombre.Text;
            proveedor.Empresa = txtEmpresa.Text;
            proveedor.Cuit = txtCuit.Text;
            proveedor.Telefono = txtTelefono.Text;
            proveedor.Direccion = txtDireccion.Text;
            proveedor.Email = txtEmail.Text;

            if (!ValidacionesDB.validarProveedor(proveedor))
            {
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Revise los Datos ingresados de Empresa, Cuit, Telefono, Email Se encuentren repetidos");
                Response.Redirect("Error.aspx");
            }

            proveedorNegocio.Agregar(proveedor);

            Response.Redirect("ListarProveedores.aspx");

        }
    }
}