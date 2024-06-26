﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_cuatrimestral_equipo_a1
{
    public partial class AgregarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;


            Marca marca = new Marca();
            marca.Descripcion = txtDescripcion.Text;
            if (!ValidacionesDB.validarMarca(marca))
            {
                Session.Add("Error", "Error en la Validacion con la Base de Datos, Esa Marca Ya se encuentra");
                Response.Redirect("Error.aspx");
            }

            MarcaNegocio marcaNegocio = new MarcaNegocio();

            marcaNegocio.Agregar(txtDescripcion.Text);
            Response.Redirect("ListarMarcas.aspx");
        }
    }
}