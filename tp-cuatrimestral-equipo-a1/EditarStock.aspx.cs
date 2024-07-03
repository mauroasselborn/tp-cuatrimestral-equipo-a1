using Dominio;
using Negocio;
using System;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class EditarStock : System.Web.UI.Page
    {
        Stock stock = new Stock();
        StockNegocio stockNegocio = new StockNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");
            int id = int.Parse(Request.QueryString["id"].ToString());

            stock = stockNegocio.ListarXID(id);


            if (!IsPostBack)
            {
                txtCantidad.Text = stock.Cantidad.ToString();
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Stock stock = new Stock();
            StockNegocio stockNegocio = new StockNegocio();

            stock.ID = int.Parse(Request.QueryString["id"].ToString());
            stock.Cantidad = int.Parse(txtCantidad.Text);

            stockNegocio.Update(stock);
            Response.Redirect("ListarStock.aspx");
        }
    }
}