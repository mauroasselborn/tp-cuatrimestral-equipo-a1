<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearCompra.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nueva Compra</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="px-4 col-6">
            <h1 class="mt-4">Compra</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Compra</li>
            </ol>

            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between">
                    <div>
                        <i class="fas fa-table me-1"></i>
                        <b>Listado de Artículos</b>
                    </div>
                    
                    <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="form-control w-50 p-1" ></asp:DropDownList>
                </div>
                <div class="card-body">
                    <table id="datatablesSimple." class="table table-striped table-bordered text-center text-center">
                        <thead>
                            <tr>
                                <th>Articulo</th>
                                <th>Cantidad</th>
                                <th>Precio</th>
                                <th>Agregar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="rptArticulo">
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-start"><%#Eval("Nombre")%></td>

                                        <td>
                                            <asp:TextBox runat="server" ID="txtCantidadARTCompra" TextMode="Number" min="0" max="1000" Text="0" CssClass="m-auto form-control w-50 text-center" />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="txtPrecioUnitario" TextMode="Number" min="0" max="10000" Text="0" CssClass="m-auto form-control w-50 text-center" />
                                        </td>

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
        </div>
        <div class="px-4 col-6">
            <h1 class="mt-5">Detalle De La Compra</h1>
            <ol class="breadcrumb mb-4">
            </ol>

            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    <b>Listado  de Artículos</b>
                </div>
                <div class="card-body">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="table table-striped table-bordered text-center text-center">
                                <thead>
                                    <tr>
                                        <th>Articulo</th>
                                        <th>Cantidad</th>
                                        <th>Precio Unitario</th>
                                        <th>Sub Total</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="rptDetalleCompra">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="text-start"><%#Eval("Articulo.Nombre")%></td>
                                                <asp:HiddenField ID="IdArticulo" runat="server" Value='<%#Eval("Articulo.ID")%>' />
                                                <td>
                                                    <asp:TextBox runat="server" Text='<%#Eval("Cantidad")%>' TextMode="Number" min="1" max="1000" ID="txtCantidadDetalle" OnTextChanged="txtCantidadDetalle_TextChanged" AutoPostBack="true" />
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblPrecioUnitario" runat="server" Text='<%# Eval("PrecioUnitario")%>'></asp:Label>
                                                    <span>$</span>
                                                </td>
                                                <td><%#Eval("Subtotal")%>$</td>
                                                <td>
                                                    <asp:Button ID="BtnEliminar" CssClass="btn btn-danger" runat="server" Text="X" CommandArgument='<%#Eval("Articulo.ID")%>' OnClick="BtnEliminar_Click" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                            <div class="text-center fw-bold display-6">
                                <span>Total de Compra: </span>
                                <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label><span>$</span>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>

    <asp:Button Text="Confirmar Compra" ID="BtnConfirmarCompra" OnClick="BtnConfirmarCompra_Click" CssClass="btn btn-primary position-fixed" runat="server" style="top:10px; right:200px; z-index:10000;"/>

    <div class="toast-container  position-fixed bottom-0 end-0 p-3 ">
        <div id="errorToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-danger text-black">

                <asp:Label ID="lblTipoMensaje" Text="" class="me-auto fw-bold" runat="server" />

                <button type="button" class="btn-close text-black" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                <asp:Label CssClass="fw-bold" ID="lblError" runat="server" />
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('addCompra').className += ' active'

        function mostrarToast() {
            var toastEl = document.getElementById('errorToast');
            var toast = new bootstrap.Toast(toastEl, {
                delay: 3000
            });
            toast.show();
        }
    </script>
</asp:Content>
