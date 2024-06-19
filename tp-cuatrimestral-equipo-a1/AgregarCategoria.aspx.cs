using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Esa Categoria Ya se encuentra");
                Session.Add("redirect", "AgregarCategoria.aspx");
                Response.Redirect("Error.aspx");
            }

            categoriaNegocio.Agregar(txtDescripcion.Text);
            Response.Redirect("ListarCategorias.aspx");

        }
    }
}