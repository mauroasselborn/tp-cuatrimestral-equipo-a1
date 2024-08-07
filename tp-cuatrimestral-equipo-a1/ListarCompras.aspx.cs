﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class Compras : System.Web.UI.Page
    {
        public Proveedor proveedor;
        public bool existenCompras;

        private CompraNegocio compraNegocio;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Compra> lstCompras = new List<Compra>();
            compraNegocio = new CompraNegocio();

            lstCompras = compraNegocio.Listar();

            if (lstCompras.Count > 0)
            {
                existenCompras = true;
            }
            else
            {
                existenCompras = false;
                return;
            }

            if (!IsPostBack)
            {
                proveedor = new Proveedor();
                proveedor = lstCompras[0].Proveedor;

                rptCompras.DataSource = lstCompras;
                rptCompras.DataBind();

                rptDetalle.DataSource = lstCompras[0].Detalle;
                rptDetalle.DataBind();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(btnEliminar.ToolTip);
            CompraNegocio compraNegocio = new CompraNegocio();

            compraNegocio.Eliminar(id);

            Response.Redirect("ListarCompras.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("EditarCompra.aspx?id=" + id, false);
        }

        protected void btnModalEliminar_Click(object sender, EventArgs e)
        {
            string script = "document.getElementById('ModalEliminar').style.display = 'block'";
            btnEliminar.ToolTip = ((Button)sender).CommandArgument.ToString();
            ClientScript.RegisterStartupScript(this.GetType(), "Modal", script, true);
        }

        protected void numeroCompra_Click(object sender, EventArgs e)
        {
            int numeroCompra = int.Parse(((LinkButton)sender).CommandArgument.ToString());

            Compra compraSeleccionada = compraNegocio.Listar().FirstOrDefault(c => c.ID == numeroCompra);

            rptDetalle.DataSource = compraSeleccionada.Detalle;
            rptDetalle.DataBind();

            proveedor = compraSeleccionada.Proveedor;
        }
    }
}