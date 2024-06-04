<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearVentas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearVentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container mt-5">
        <div class="row g-0 text-center">
            <div class="col-sm-6 col-md-6">
    <div class="container">
        <%if (Carrito != null || Total > 0)
            { %>
        <%if (Carrito.Items.Count > 0)
            { %>
        <div class="row">
            <div class="col-12">

                <table class="table table-striped table-secondary text-center">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">Producto</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Subtotal</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptVenta">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <p class="p-2 text-center"><%#Eval("Articulo.Nombre")%></p>
                                    </td>
                                    <td>
                                        <p class="p-2">$<%# Eval("Articulo.Precio")%></p>
                                    </td>
                                    <td class="txtCantidad">
                                        <asp:TextBox CssClass="form-control " ID="txtCantidad" TextMode="Number" Text='<%#Eval("Cantidad")%>' AutoPostBack="true" runat="server"  OnTextChanged="txtCantidad_TextChanged" tooltip='<%# Eval("Articulo.Id")%>' min="0" />
                                    </td>
                                    <td>
                                        <p class="p-2">$<%# Eval("Subtotal")%></p>
                                    </td>
                                    <td>
                                        <asp:Button ID="BtnQuitar" Text="X" CssClass="btn btn-danger" runat="server" OnClick="BtnQuitar_Click" CommandArgument='<%#Eval("Articulo.Codigo")%>' CommandName="IdArticulo" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <asp:Label ID="lblCantidad" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-6"></div>
            <div class="col-6 d-flex align-items-end flex-column mb-3">
                <div class="d-flex flex-row mb-3">
                </div>
                <div class="d-flex flex-row mb-3 justify-content-between">
                    <h4 class="p-2 g-col-6">Total</h4>
                    <h5 class="p-2 g-col-6 fs-4">$<%: Total.ToString()%></h5>
                </div>
            </div>
        </div>
        <% }
            else
            {%><div class="row h-100">
                <div class="col-12 text-center position-absolute top-50 start-50 translate-middle">
                    <h1>No hay Articulos en el carrito</h1>
                </div>
            </div>
        <% } %>
        <% }
            else
            {%>
        <div class="row h-100">
            <div class="col-12 text-center position-absolute top-50 start-50 translate-middle">
                <h1>No hay Articulos en el carrito</h1>
            </div>
        </div>
        <% } %>
    </div>
            </div>

            <div class="col-6 col-md-6">
                <div class="container text-center">
                    <div class="row">
                        <div class="col-4">
                            <asp:TextBox placeholder="Nombre" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <asp:DropDownList ID="ddlMarca" runat="server"></asp:DropDownList>
                        </div>
                        <div class="col-4">
                            <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater ID="lstArticulos" runat="server">
                            <ItemTemplate>
                                <div class="col-4">
                                    <div class="card ">
                                        <div class="card-body">
                                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                            <p class="card-text"><%#Eval("Marca.Descripcion")%></p>
                                            <asp:Button Text="Agregar" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
