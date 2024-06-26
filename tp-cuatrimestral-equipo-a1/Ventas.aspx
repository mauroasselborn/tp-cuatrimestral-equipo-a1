<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-5">
        <div class="row g-0 text-center">
            <div class="col-sm-6 col-md-6">
                <div class="container">
                </div>
            </div>
        </div>
    </div>
    <script>
        ddlVenta = document.getElementById('ddlVenta')
        ddlVenta.classList.remove('collapsed');
        ddlVenta.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsVentas').className += " show"
        document.getElementById('lstVentas').className += ' active'
    </script>
</asp:Content>
