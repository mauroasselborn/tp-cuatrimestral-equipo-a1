﻿using Dominio;
using Negocio;
using System;
using System.Web.UI;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class EditarMarca : System.Web.UI.Page
    {
        Marca marca = new Marca();
        MarcaNegocio marcaNegocio = new MarcaNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null) Response.Redirect("Dashboard.aspx");

            int id = int.Parse(Request.QueryString["id"].ToString());

            marca = marcaNegocio.ListarXID(id);


            if (!IsPostBack)
            {
                txtDescripcion.Text = marca.Descripcion;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;

            marca.Descripcion = txtDescripcion.Text;
            if (!ValidacionesDB.validarMarca(marca))
            {
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Esa Marca Ya se encuentra");
                Response.Redirect("Error.aspx");
            }

            MarcaNegocio marcaNegocio = new MarcaNegocio();
            int id = int.Parse(Request.QueryString["id"].ToString());
            marcaNegocio.Update(id, txtDescripcion.Text);
            Response.Redirect("ListarMarcas.aspx");
        }
    }
}