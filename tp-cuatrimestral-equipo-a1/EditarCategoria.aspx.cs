using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Esa Categoria Ya se encuentra");
                Session.Add("redirect", "EditarCategoria.aspx?id=" + id);
                Response.Redirect("Error.aspx");
            }

            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            categoriaNegocio.Update(id, txtDescripcion.Text);
            Response.Redirect("ListarCategorias.aspx");

        }
    }
}