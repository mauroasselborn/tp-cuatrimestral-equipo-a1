using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarProveedores : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Proveedor> lstPrveedores = new List<Proveedor>();
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();

            if (!IsPostBack)
            {
                lstPrveedores = proveedorNegocio.Listar();

                rptProveedor.DataSource = lstPrveedores;
                rptProveedor.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarProveedor.aspx?id=" + id, false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(btnEliminar.ToolTip);
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();

            proveedorNegocio.Eliminar(id);

            Response.Redirect("ListarProveedores.aspx");
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            btnEliminar.ToolTip = ((Button)sender).CommandArgument.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }
    }
}