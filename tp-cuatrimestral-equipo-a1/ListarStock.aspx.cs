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
    public partial class ListarStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StockNegocio stockNegocio = new StockNegocio();
            List<Stock> lststock = new List<Stock>();
            
            if (!IsPostBack)
            {
                lststock = stockNegocio.Listar();

                rptStock.DataSource = lststock;
                rptStock.DataBind();

            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarStock.aspx?id=" + id, false);
        }
    }
}