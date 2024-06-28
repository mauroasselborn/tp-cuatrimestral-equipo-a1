<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarFacturas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarFacturas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listar Facturas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <p>Facturas</p>
    <script>
        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('lstFacturaCompra').className += ' active'
    </script>
</asp:Content>
