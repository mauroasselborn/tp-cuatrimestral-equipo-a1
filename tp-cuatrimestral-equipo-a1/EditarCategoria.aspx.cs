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
           
            int id = int.Parse(Request.QueryString["id"].ToString());
           
            categoria = categoriaNegocio.ListarXID(id);


            if (!IsPostBack)
            {
                txtDescripcion.Text = categoria.Descripcion;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (comprobarCampo())
            {
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                int id = int.Parse(Request.QueryString["id"].ToString());
                categoriaNegocio.Update(id, txtDescripcion.Text);
                Response.Redirect("ListarCategorias.aspx");
            }
            else
            {
                btnAceptar.Enabled = false;
            }
        }

        public bool comprobarCampo()
        {
            if (txtDescripcion.Text.Length > 0) return true;
            return false;
        }
    }
}