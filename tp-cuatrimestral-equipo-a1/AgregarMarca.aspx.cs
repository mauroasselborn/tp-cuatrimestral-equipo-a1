using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class AgregarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            if (txtDescripcion.Text.Length > 0)
            {
                marcaNegocio.Agregar(txtDescripcion.Text);
                Response.Redirect("ListarMarcas.aspx");
            }
        }
    }
}