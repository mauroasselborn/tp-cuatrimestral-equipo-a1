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
    public partial class ListarMarcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Marca> lstMarca = new List<Marca>();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            if (!IsPostBack)
            {
                lstMarca = marcaNegocio.Listar();

                rptCategoria.DataSource = lstMarca;
                rptCategoria.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarMarca.aspx?id=" + id, false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(((Button)sender).CommandArgument);
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            marcaNegocio.Eliminar(id);

            Response.Redirect("ListarMarcas.aspx");
        }
    }
}