using Dominio;
using Negocio;
using System;
using System.Web.UI;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class EditarCategoria : System.Web.UI.Page
    {

        Categoria categoria = new Categoria();
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");

            int id = int.Parse(Request.QueryString["id"].ToString());

            categoria = categoriaNegocio.ListarXID(id);


            if (!IsPostBack)
            {
                txtDescripcion.Text = categoria.Descripcion;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["id"].ToString());

            Page.Validate();
            if (!Page.IsValid) return;

            if (!ValidacionesDB.validarCategoria(txtDescripcion.Text))
            {
                lblMismaCategoria.Text = "Ya existe una Categoria con la misma descripcion";
                return;
            }

            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            categoriaNegocio.Update(id, txtDescripcion.Text);
            Response.Redirect("ListarCategorias.aspx");

        }
    }
}