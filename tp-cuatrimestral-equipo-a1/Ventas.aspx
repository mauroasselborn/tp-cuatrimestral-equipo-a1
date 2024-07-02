<%@ Page Title="Ventas" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-5">
        <div class="row g-0 text-center">

            <table id="datatablesSimple" class="table table-hover" style="height: 100%;">
                <thead>
                    <tr>
                        <th scope="col">Fecha</th>
                        <th scope="col">Nro Factura</th>
                        <th scope="col">Cliente</th>
                        <th scope="col">Metodo Pago</th>
                        <th scope="col">Total</th>
                        <th scope="col">Accion</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="rptVenta">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("FechaVenta.Date")%></td>
                                <td><%#Eval("NroFactura")%></td>
                                <td><%#Eval("cliente.Nombre")+ " "+ Eval(" cliente.Apellido")%> </td>
                                <td><%#Eval("MetodoPago.Descripcion")%></td>
                                <td><%#Eval("Total")%></td>
                                <td></td>
                                <tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
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
