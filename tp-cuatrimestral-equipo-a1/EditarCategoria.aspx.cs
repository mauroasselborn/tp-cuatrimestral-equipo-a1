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
    public partial class EditarCategoria : System.Web.UI.Page
    {
        List<Categoria> categorias = new List<Categoria>();
        Categoria categoria = new Categoria();
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"].ToString();
            categorias = categoriaNegocio.Listar();
            categoria = categorias.Find(x => x.Id == int.Parse(id));


            inputDescripcion.Text = categoria.Descripcion;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

        }
    }
}