using Dominio;
using Negocio;
using System;
using System.Threading;
using System.Web.UI;

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
                lblErrorProveedor.Text = "Proveedor Existente, Intente de nuevo";
                return;
            }

            try
            {
                proveedorNegocio.Agregar(proveedor);
                string script = "document.getElementById('ModalConfirmar').style.display = 'block';";
                ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
            }
            catch (Exception ex)
            {
                lblErrorProveedor.Text = "Error al agregar el proveedor. Intente nuevamente más tarde.";
            }
        }

        protected void BtnAceptarModal_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            Response.Redirect("ListarProveedores.aspx");
        }
    }
}
