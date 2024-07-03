using Dominio;
using Negocio;
using System;
using System.Collections.Generic;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class CrearCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
            List<Proveedor> lstProveedor = new List<Proveedor>();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> lstArticulos = new List<Articulo>();

            lstProveedor = proveedorNegocio.Listar();
            lstArticulos = articuloNegocio.Listar();



            if (!IsPostBack)
            {
                ddlProveedor.DataSource = lstProveedor;
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "ID";
                ddlProveedor.SelectedValue = lstProveedor[0].ID.ToString();
                ddlProveedor.DataBind();

                //rptArticulo.DataSource = lstArticulos;
                ddlArticulo.DataBind();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}