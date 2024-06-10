using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class EditarProveedor : System.Web.UI.Page
    {
        Proveedor proveedor = new Proveedor();
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");
            int id = int.Parse(Request.QueryString["id"].ToString());

            proveedor = proveedorNegocio.ListarXID(id);

            if (proveedor == null) Response.Redirect("Dashboard.aspx");

            if (!IsPostBack)
            {
                txtNombre.Text = proveedor.Nombre;
                txtEmpresa.Text = proveedor.Empresa;
                txtCuit.Text = proveedor.Cuit;
                txtTelefono.Text = proveedor.Telefono;
                txtDireccion.Text = proveedor.Direccion;
                txtEmail.Text = proveedor.Email;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (true)
            {

                ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
                Proveedor proveedor = new Proveedor();

                int id = int.Parse(Request.QueryString["id"].ToString());

                proveedor.ID = id;
                proveedor.Nombre = txtNombre.Text;
                proveedor.Empresa = txtEmpresa.Text;
                proveedor.Cuit = txtCuit.Text;
                proveedor.Telefono = txtTelefono.Text;
                proveedor.Direccion = txtDireccion.Text;
                proveedor.Email = txtEmail.Text;

                
                proveedorNegocio.Update(proveedor);
                Response.Redirect("ListarProveedores.aspx");
            }
            else
            {
                btnAceptar.Enabled = false;
            }
        }
    }
}