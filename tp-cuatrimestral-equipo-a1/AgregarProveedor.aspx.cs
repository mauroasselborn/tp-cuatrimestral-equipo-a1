using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

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

            string script = "document.getElementById('ModalConfirmar').style.display = 'block';";

            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            Proveedor proveedor = new Proveedor();

            proveedor.Nombre = txtNombre.Text;
            proveedor.Empresa = txtEmpresa.Text;
            proveedor.Cuit = txtCuit.Text;
            proveedor.Telefono = txtTelefono.Text;
            proveedor.Direccion = txtDireccion.Text;
            proveedor.Email = txtEmail.Text;
            proveedor.Estado = true;

            if (!ValidacionesDB.validarProveedor(proveedor))

            {
                lblErrorProveedor.Text = "Proveedor Existente, Intente de nuevo";
                return;
            }

            proveedorNegocio.Agregar(proveedor);

            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);

        }

        protected void BtnAceptarModal_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            Response.Redirect("ListarProveedores.aspx");
        }
    }
}