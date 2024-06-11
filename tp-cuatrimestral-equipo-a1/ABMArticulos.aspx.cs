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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            List<Marca> marcas = (List<Marca>)Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];

            try
            {
                string script = "document.getElementById('ModalConfirmar').style.display = 'block';";

                articulo.Nombre = txtNombre.Text;
                articulo.Codigo = txtCodigo.Text;
                articulo.Marca = marcas.Find(x => x.id == int.Parse(ddlMarca.SelectedValue));
                articulo.Categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value)); ;
                articulo.ProcentajeGanancia = Convert.ToDecimal(txtPorcentajeGanancia.Text);
                articulo.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);

                articuloNegocio.Agregar(articulo);
                ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
                VaciarCampos();
            }
            catch (Exception ex)
            {
                Response.Redirect("error.aspx");
                throw ex;

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        private void VaciarCampos()
        {
            txtNombre.Text = "";
            txtCodigo.Text = "";
            txtStockMinimo.Text = "";
            txtPorcentajeGanancia.Text = "";
        }

        protected void txtStockMinimo_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtStockMinimo.Text) < 0)
            {
                txtStockMinimo.Text = "0";
            }

        }

        protected void txtPorcentajeGanancia_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtPorcentajeGanancia.Text) < 0)
            {
                txtStockMinimo.Text = "0";
            }
        }


    }
}