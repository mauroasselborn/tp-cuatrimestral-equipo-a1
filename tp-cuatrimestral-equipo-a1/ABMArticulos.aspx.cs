using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Threading;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ABMArticulos : System.Web.UI.Page
    {
        private List<Articulo> lstArticulos;
        private string idArticulo;
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio negocioMarca = new MarcaNegocio();
            CategoriaNegocio negocioCategoria = new CategoriaNegocio();
            idArticulo = Request.QueryString["id"];
            ArticuloNegocio ArticuloNegocio = new ArticuloNegocio();
            lstArticulos = ArticuloNegocio.Listar();

            if (!IsPostBack)
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

                if (idArticulo != null)
                {
                    Articulo articulo = lstArticulos.Find(x => x.ID == Convert.ToInt32(idArticulo));
                    txtNombre.Text = articulo.Nombre;
                    txtCodigo.Text = articulo.Codigo;
                    txtPorcentajeGanancia.Text = articulo.ProcentajeGanancia.ToString();
                    txtStockMinimo.Text = articulo.StockMinimo.ToString();

                    ddlCategoria.SelectedValue = articulo.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = articulo.Marca.id.ToString();
                }
            }


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
                articulo.Categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
                articulo.ProcentajeGanancia = float.Parse(txtPorcentajeGanancia.Text);
                articulo.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);

                if (idArticulo == null)
                {
                    if (!lstArticulos.Exists(x => x.Codigo == articulo.Codigo))
                    {

                        articuloNegocio.Agregar(articulo);
                    }
                    else
                    {
                        lblMismoCodigo.Text = "Ya existe un articulo con el mismo codigo";
                        return;
                    }
                }
                else
                {
                    articulo.ID = Convert.ToInt32(idArticulo);
                    articuloNegocio.Modificar(articulo);
                }
                ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
                VaciarCampos();
            }
            catch (Exception ex)
            {
                Response.Redirect("error.aspx");
                throw ex;

            }
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
            if (Convert.ToInt32(txtStockMinimo.Text) < 0 || txtStockMinimo.Text.Contains("."))
            {
                txtStockMinimo.Text = "0";
            }

        }

        protected void txtPorcentajeGanancia_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToDecimal(txtPorcentajeGanancia.Text) < 0)
            {
                txtStockMinimo.Text = "0";
            }

        }

        protected void BtnAceptarModal_Click(object sender, EventArgs e)
        {
            Thread.Sleep(1000);
            Response.Redirect("ListarArticulos.aspx");
        }
    }
}