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
                                        <asp:TextBox ID="txtCantidad" Text='<%#Eval("Cantidad")%>' ToolTip='<%#Eval("articulo.ID")%>' TextMode="Number" min="0" CssClass="form-control input-cantidad" runat="server" OnTextChanged="txtCantidad_TextChanged" AutoPostBack="false"></asp:TextBox>
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
                    <asp:Button ID="BtnMetodoPago" Text="Pagar" CssClass="btn btn-primary" Visible="false" OnClick="BtnMetodoPago_Click" runat="server" />

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

    <%--MODAL--%>
    <div class="modal show" id="ModalMetodoPago" style="display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <asp:DropDownList ID="ddlMetodoPago" runat="server" CssClass="form-control mb-3" OnSelectedIndexChanged="ddlMetodoPago_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1" Text="Efectivo" />
                        <asp:ListItem Value="2" Text="Tarjeta de debito" />
                        <asp:ListItem Value="3" Text="Tarjeta de Credito" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlCuotas" Visible="false" CssClass="form-control mb-3" runat="server" OnSelectedIndexChanged="ddlCuotas_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="3 Cuotas (Inteseres 7.88%)" Value="3" Selected="True" />
                        <asp:ListItem Text="6 Cuotas (Inteseres 16.08%)" Value="6" />
                        <asp:ListItem Text="9 Cuotas (Inteseres 24.85%)" Value="9" />
                        <asp:ListItem Text="12 Cuotas (Inteseres 34.22%)" Value="12" />
                    </asp:DropDownList>
                    <div>
                        <asp:Label ID="lblTextTotal" Text="Total por Mes:" Visible="false" runat="server" />  
                        <asp:Label ID="lblTotalMes" Text="" CssClass="mb-3" runat="server" Visible="false" />
                    </div>
                    <div>
                        TOTAL : $
                        <asp:Label ID="MetodoTotal" CssClass="mb-3" Text="" runat="server" />
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="BtnCancelar" CssClass="btn btn-danger" Text="Cancelar" runat="server" OnClick="BtnCancelar_Click" />
                    <asp:Button ID="BtnPago" CssClass="btn btn-primary" Text="Pago >" runat="server" OnClick="BtnPago_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal show" id="ModalConfirmar" style="display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <svg fill="#269a1d" height="100px" width="100px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" stroke="#269a1d">

                        <g id="SVGRepo_bgCarrier" stroke-width="0" />

                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" />

                        <g id="SVGRepo_iconCarrier">
                            <g>
                                <path d="M474.045,173.813c-4.201,1.371-6.494,5.888-5.123,10.088c7.571,23.199,11.411,47.457,11.411,72.1 c0,62.014-24.149,120.315-68,164.166s-102.153,68-164.167,68s-120.316-24.149-164.167-68S16,318.014,16,256 S40.149,135.684,84,91.833s102.153-68,164.167-68c32.889,0,64.668,6.734,94.455,20.017c28.781,12.834,54.287,31.108,75.81,54.315 c3.004,3.239,8.066,3.431,11.306,0.425c3.24-3.004,3.43-8.065,0.426-11.306c-23-24.799-50.26-44.328-81.024-58.047 C317.287,15.035,283.316,7.833,248.167,7.833c-66.288,0-128.608,25.813-175.48,72.687C25.814,127.392,0,189.712,0,256 c0,66.287,25.814,128.607,72.687,175.479c46.872,46.873,109.192,72.687,175.48,72.687s128.608-25.813,175.48-72.687 c46.873-46.872,72.687-109.192,72.687-175.479c0-26.332-4.105-52.26-12.201-77.064 C482.762,174.736,478.245,172.445,474.045,173.813z" />
                                <path d="M504.969,83.262c-4.532-4.538-10.563-7.037-16.98-7.037s-12.448,2.499-16.978,7.034l-7.161,7.161 c-3.124,3.124-3.124,8.189,0,11.313c3.124,3.123,8.19,3.124,11.314-0.001l7.164-7.164c1.51-1.512,3.52-2.344,5.66-2.344 s4.15,0.832,5.664,2.348c1.514,1.514,2.348,3.524,2.348,5.663s-0.834,4.149-2.348,5.663L217.802,381.75 c-1.51,1.512-3.52,2.344-5.66,2.344s-4.15-0.832-5.664-2.348L98.747,274.015c-1.514-1.514-2.348-3.524-2.348-5.663 c0-2.138,0.834-4.149,2.351-5.667c1.51-1.512,3.52-2.344,5.66-2.344s4.15,0.832,5.664,2.348l96.411,96.411 c1.5,1.5,3.535,2.343,5.657,2.343s4.157-0.843,5.657-2.343l234.849-234.849c3.125-3.125,3.125-8.189,0-11.314 c-3.124-3.123-8.189-3.123-11.313,0L212.142,342.129l-90.75-90.751c-4.533-4.538-10.563-7.037-16.98-7.037 s-12.448,2.499-16.978,7.034c-4.536,4.536-7.034,10.565-7.034,16.977c0,6.412,2.498,12.441,7.034,16.978l107.728,107.728 c4.532,4.538,10.563,7.037,16.98,7.037c6.417,0,12.448-2.499,16.977-7.033l275.847-275.848c4.536-4.536,7.034-10.565,7.034-16.978 S509.502,87.794,504.969,83.262z" />
                            </g>
                        </g>

                    </svg>
                    Guardado exitoso!
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" Text="Pago >" runat="server" OnClick="BtnPago_Click" />
                </div>
            </div>
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
