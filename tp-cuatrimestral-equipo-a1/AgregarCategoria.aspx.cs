using Negocio;
using System;
using System.Threading;
using System.Web.UI;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class AgregarCategoria : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            if (!ValidacionesDB.validarCategoria(txtDescripcion.Text))
            {
                lblMismaCategoria.Text = "Ya existe una Categoria con la misma descripcion";
                return;
            }

            categoriaNegocio.Agregar(txtDescripcion.Text);
            string script = "document.getElementById('ModalConfirmar').style.display = 'block';";
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);

        }

        protected void BtnAceptarModal_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            Response.Redirect("ListarCategorias.aspx");
        }
    }
}