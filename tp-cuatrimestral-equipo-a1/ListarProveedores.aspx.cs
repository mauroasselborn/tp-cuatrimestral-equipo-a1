using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarProveedores : System.Web.UI.Page
    {
        private ProveedorNegocio proveedorNegocio;

        protected void Page_Load(object sender, EventArgs e)
        {
            proveedorNegocio = new ProveedorNegocio();

            if (!IsPostBack)
            {
                CargarProveedores();
            }
        }

        private void CargarProveedores()
        {
            List<Proveedor> lstProveedores = proveedorNegocio.Listar();
            rptProveedor.DataSource = lstProveedores;
            rptProveedor.DataBind();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect($"EditarProveedor.aspx?id={id}", false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            proveedorNegocio.Eliminar(id);
            Response.Redirect("ListarProveedores.aspx");
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            string id = ((Button)sender).CommandArgument;
            btnEliminar.CommandArgument = id;
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }
    }
}
