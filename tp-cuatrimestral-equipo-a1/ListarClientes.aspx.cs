using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarClientes : System.Web.UI.Page
    {
        public List<Cliente> lstCliente = new List<Cliente>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            try
            {
                lstCliente = clienteNegocio.Listar();
                rptClientes.DataSource = lstCliente;
                rptClientes.DataBind();
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            string id = ((Button)sender).CommandArgument;

            Response.Redirect("ABMCliente.aspx?id=" + id);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(btnEliminar.ToolTip.ToString());
            try
            {
                ClienteNegocio clienteNegocio = new ClienteNegocio();
                clienteNegocio.Eliminar(id);
            }
            catch (Exception)
            {

                throw;
            }

            Response.Redirect("ListarClientes.aspx");
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            btnEliminar.ToolTip = ((Button)sender).CommandArgument.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }
    }
}