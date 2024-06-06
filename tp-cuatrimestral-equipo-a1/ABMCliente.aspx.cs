using Dominio;
using Negocio;
using System;
using System.Windows;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ABMCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();
            Cliente cliente = new Cliente();
            try
            {
                cliente.Nombre = txtNombre.Text;
                cliente.Apellido = txtApellido.Text;
                cliente.Documento = txtDocumento.Text;
                cliente.Telefono = txtTelefono.Text;
                cliente.Direccion = txtDireccion.Text + ' ' + txtAltura.Text;
                cliente.Mail = txtEmail.Text;

                clienteNegocio.Agregar(cliente);
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la subida");
            }
        }
    }
}