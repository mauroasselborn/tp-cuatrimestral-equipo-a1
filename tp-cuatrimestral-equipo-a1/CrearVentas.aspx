<%@ Page Title="Ventas" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearVentas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row" style="max-height: 86vh;">
        <div class="col-12">
            <div class="row d-flex mb-3 mt-1">
                <div class="col-8">
                    <asp:DropDownList ID="ddlClientes" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="col-3">
                    <a href="ABMCliente.aspx" id="btnAgregarCliente" class="btn btn-primary">Agregar cliente</a>
                </div>
            </div>

        </div>
        <div class="col-6">
            <div class="row row-venta">
                <% if (Venta.Items != null)
                    {%>
                <table class="table table-hover" style="height: 100%;">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Articulo</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptVenta">
                            <ItemTemplate>
                                <tr>
                                    <td><%#numero++%></td>
                                    <td><%#Eval("articulo.Nombre")%></td>
                                    <td style="padding-left: 20px">
                                        <asp:TextBox ID="txtCantidad" Text='<%#Eval("Cantidad")%>' ToolTip='<%#Eval("articulo.ID")%>' TextMode="Number" min="0" CssClass="form-control input-cantidad" runat="server" OnTextChanged="txtCantidad_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </td>
                                    <td><%#Eval("Subtotal")%></td>
                                    <td>
                                        <asp:Button ID="BtnEliminar" OnClick="BtnEliminar_Click" CommandArgument='<%#Eval("articulo.ID")%>' runat="server" Text="X" CssClass="btn btn-danger" />
                                    </td>
                                    <tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <div class="row ">
                <div class="col-4 d-flex">
                    <h5>TOTAL: $ </h5>
                    <asp:Label ID="lblTotal" Font-Size="Large" Font-Bold="true" Text="0" runat="server"></asp:Label>
                </div>
                <div class="col-4"></div>
                <div class="col-4 mr-0">
                    <asp:Button ID="BtnPago" CssClass="btn btn-primary" Text="Pago >" runat="server" OnClick="BtnPago_Click" />
                </div>
            </div>
            <%}
                else
                {%>

            <h3 class="text-center">No hay articulos </h3>

            <% } %>
        </div>
        <div class="col-6 mt-3 row-venta">
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
