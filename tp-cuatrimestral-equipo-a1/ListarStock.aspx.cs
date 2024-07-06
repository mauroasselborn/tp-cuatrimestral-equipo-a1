using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class ListarStock : System.Web.UI.Page
    {
        public Proveedor proveedorModal = null;
        public bool existeStock;
        protected void Page_Load(object sender, EventArgs e)
        {
            StockNegocio stockNegocio = new StockNegocio();
            List<Stock> lststock = new List<Stock>();

            lststock = stockNegocio.Listar();

            if (lststock.Count > 0)
            {
                existeStock = true;
            }
            else
            {
                existeStock = false;
                return;
            }


            if (!IsPostBack)
            {

                rptStock.DataSource = lststock;
                rptStock.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            StockNegocio stockNegocio = new StockNegocio();
            Stock stock = new Stock();

            stock = stockNegocio.ListarXID(int.Parse(((Button)sender).CommandArgument));

            Response.Redirect($"EditarStock.aspx?id={stock.ID}&art={stock.Articulo.ID}", false);
        }
    }
}