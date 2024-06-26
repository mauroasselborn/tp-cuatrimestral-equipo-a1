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
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Compra> lstCompras = new List<Compra>();
            CompraNegocio compraNegocio = new CompraNegocio();

            if (!IsPostBack)
            {
                //lstCompras = compraNegocio.Listar();

                //rptCompras.DataSource = lstCompras;
                //rptCompras.DataBind();

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(btnEliminar.ToolTip);
            CompraNegocio compraNegocio = new CompraNegocio();

            //CompraNegocio.Eliminar(id);

            Response.Redirect("ListarCompras.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarCompra.aspx?id=" + id, false);
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            btnEliminar.ToolTip = ((Button)sender).CommandArgument.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }
    }
}