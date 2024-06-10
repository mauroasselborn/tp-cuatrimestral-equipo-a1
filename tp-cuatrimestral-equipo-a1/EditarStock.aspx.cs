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
    public partial class EditarStock : System.Web.UI.Page
    {
        Stock stock = new Stock();
        List<Proveedor> listaProveedores = new List<Proveedor>();
        StockNegocio stockNegocio = new StockNegocio();
        ProveedorNegocio proveedorNegocio = new ProveedorNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");
            int id = int.Parse(Request.QueryString["id"].ToString());

            stock = stockNegocio.ListarXID(id);
            listaProveedores = proveedorNegocio.Listar();

            if (!IsPostBack)
            {
                ddlProveedor.DataSource = listaProveedores;
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "ID";
                ddlProveedor.SelectedValue = stock.Proveedor.ID.ToString();
                ddlProveedor.DataBind();

                txtCantidad.Text = stock.Cantidad.ToString();
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Stock stock = new Stock();
            StockNegocio stockNegocio = new StockNegocio();

            stock.ID = int.Parse(Request.QueryString["id"].ToString());
            stock.Proveedor = new Proveedor();
            stock.Proveedor.ID = int.Parse(ddlProveedor.SelectedValue);
            stock.Cantidad = int.Parse(txtCantidad.Text);

            stockNegocio.Update(stock);
            Response.Redirect("ListarStock.aspx");
        }
    }
}