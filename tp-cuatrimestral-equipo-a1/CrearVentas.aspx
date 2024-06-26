<%@ Page Title="Ventas" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearVentas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row" style="min-height: 100vh">
        <div class="col-6">
            <div class="row">
                <% if (Venta.Items != null)
                    {%>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Articulo</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptVenta">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("articulo.Codigo")%></td>
                                    <td><%#Eval("articulo.Nombre")%></td>
                                    <td><%#Eval("Cantidad")%></td>
                                    <td><%#Eval("Subtotal")%></td>
                                    <tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <%}%>

                <% else
                    {%>

                <h3 class="text-center">No hay articulos </h3>

                <% } %>
            </div>
            <div class="row">
                <asp:Button ID="BtnPago" CssClass="btn btn-primary" Text="Pago >" runat="server" />
            </div>
        </div>
        <div class="col-6 mt-3">
            <table id="datatablesSimple" class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th scope="col">Codigo</th>
                        <th scope="col">Articulo</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Agregar</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="rptArticulo">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Codigo")%></td>
                                <td><%#Eval("Nombre")%></td>
                                <td><%#Eval("Precio")%></td>
                                <td>
                                    <asp:Button ID="BtnAgregar" CssClass="btn btn-success" runat="server" Text="+" CommandArgument='<%#Eval("ID")%>' OnClick="BtnAgregar_Click" />
                                </td>
                            </tr>
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
            document.getElementById('addVentas').className += ' active'
        </script>




</asp:Content>
