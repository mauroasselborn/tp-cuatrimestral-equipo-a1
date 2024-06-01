using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ABMArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio negocioMarca = new MarcaNegocio();
            CategoriaNegocio negocioCategoria = new CategoriaNegocio();
            try
            {
                #region DLLs
                List<Marca> ListaMarcas = negocioMarca.Listar();
                Session.Add("listaMarcas", ListaMarcas);
                ddlMarca.DataSource = ListaMarcas;
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

                List<Categoria> ListaCategoria = negocioCategoria.Listar();

                Session.Add("listaCat", ListaCategoria);
                ddlCategoria.DataSource = ListaCategoria;
                ddlCategoria.DataTextField = "Descripcion";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
                #endregion
            }
            catch (Exception ex)
            {
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            List<Marca> marcas = (List<Marca>)Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];

            articulo.Nombre = txtNombre.Text;
            articulo.marca = marcas.Find(x => x.id == int.Parse(ddlMarca.SelectedValue));
            articulo.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value)); ;
            articulo.ProcentajeGanancia = Convert.ToDecimal(txtProcentajeGanancia.Text);
            articulo.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);
            articuloNegocio.Agregar(articulo);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}