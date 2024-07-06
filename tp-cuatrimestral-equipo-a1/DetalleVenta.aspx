<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.DetalleVenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 d-flex">
                <h5>Cliente: <%: venta.cliente.Nombre +' '+ venta.cliente.Apellido %></h5>
                <asp:Label ID="Label2" Font-Size="Large" Font-Bold="true" Text="" runat="server"></asp:Label>
            </div>

        </div>
        <div class="row g-0 text-center">
            <div class="col-12">
                <div class="container">
                    <table class="table table-hover" style="height: 100%;">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Articulo</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Precio</th>
                                <th scope="col">subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="rptVenta">
                                <ItemTemplate>
                                    <tr>
                                        <td><%: ContadorItem++%></td>
                                        <td><%#Eval("articulo.Nombre")%></td>
                                        <td><%#Eval("articulo.Marca.Descripcion")%></td>
                                        <td><%#Eval("Cantidad")%></td>
                                        <td><%#Eval("Precio")%></td>
                                        <td><%#Eval("subtotal")%></td>
                                        <tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 d-flex">
                <h5>Metodo de pago: <%: venta.MetodoPago.Descripcion %></h5>
                <asp:Label ID="Label1" Font-Size="Large" Font-Bold="true" Text="" runat="server"></asp:Label>
            </div>
            <div class="col-12 d-flex justify-content-end mr-5">
                <h5>TOTAL: $ </h5>
                <asp:Label ID="lblTotal" Font-Size="Large" Font-Bold="true" Text="" runat="server"></asp:Label>
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
