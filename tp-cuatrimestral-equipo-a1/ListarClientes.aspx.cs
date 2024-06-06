using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

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
    }
}