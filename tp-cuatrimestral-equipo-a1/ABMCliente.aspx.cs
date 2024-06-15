using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Windows;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ABMCliente : System.Web.UI.Page
    {
        public List<Cliente> lstCliente;
        private string idCliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();
            lstCliente = clienteNegocio.Listar();

            idCliente = Request.QueryString["id"];

            if (idCliente != null && !IsPostBack)
            {
                lblTitulo.Text = "Editar Cliente";

                try
                {
                    Cliente Seleccionado = lstCliente.Find(x => x.Id == Convert.ToInt32(idCliente));

                    txtNombre.Text = Seleccionado.Nombre;
                    txtApellido.Text = Seleccionado.Apellido;
                    txtDocumento.Text = Seleccionado.Documento;
                    txtDocumento.Enabled = false;
                    txtTelefono.Text = Seleccionado.Telefono;
                    txtDireccion.Text = Seleccionado.Direccion;
                    txtEmail.Text = Seleccionado.Mail;

                    btnAgregar.Text = "Confirmar";
                }
                catch (Exception)
                {
                    Response.Redirect("ListarCliente.aspx");
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalConfirmar').style.display = 'block'";

            try
            {
                ClienteNegocio clienteNegocio = new ClienteNegocio();
                Cliente cliente = new Cliente();

                cliente.Nombre = txtNombre.Text;
                cliente.Apellido = txtApellido.Text;
                cliente.Documento = txtDocumento.Text;
                cliente.Telefono = txtTelefono.Text;
                cliente.Direccion = txtDireccion.Text;
                cliente.Mail = txtEmail.Text;
                if (idCliente == null)
                {
                    if (!lstCliente.Exists(x => x.Documento == cliente.Documento))
                    {
                        clienteNegocio.Agregar(cliente);
                    }
                    else
                    {
                        lblMismoCliente.Text = "Ya existe un cliente con el mismo documento";
                        return;
                    }
                }
                else
                {
                    cliente.Id = Convert.ToInt32(idCliente);
                    clienteNegocio.Editar(cliente);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error en la subida");
            }
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
            VaciarCampos();

        }
        private void VaciarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDocumento.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            Response.Redirect("listarClientes.aspx");
        }
    }
}