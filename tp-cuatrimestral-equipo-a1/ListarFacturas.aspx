<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarFacturas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarFacturas" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listar Facturas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-5">
        <div class="row g-0 text-center">
            <div class="col-12">
                <div class="container">
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
                                        <td>
                                            <asp:ImageButton ID="BtnVer" ClientIDMode="Static" ImageUrl="https://static.vecteezy.com/system/resources/previews/015/337/697/non_2x/eye-icon-transparent-eye-icon-free-png.png" ToolTip="Ver Factura" runat="server" CommandArgument='<%#Eval("ID")%>' Text="" OnClick="BtnVer_Click"  />
                                        </td>
                                        <tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('lstFacturaCompra').className += ' active'
    </script>
</asp:Content>
