<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarCompras.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.Compras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado de Compras</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="px-4 col-6">
            <h1 class="mt-4">Compras</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Compras</li>
            </ol>

            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    <b>Listado de Compras</b>
                </div>
                <div class="card-body">
                    <table id="datatablesSimple" class="table table-striped table-bordered text-center text-center">
                        <thead>
                            <tr>
                                <th>N° Compra</th>
                                <th>Proveedor</th>
                                <th>Fecha</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>N° Compra</th>
                                <th>Proveedor</th>
                                <th>Fecha</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                        <tbody>


                            <asp:Repeater runat="server" ID="rptCompras">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="numeroCompra" runat="server" CommandName="idCompra" CommandArgument='<%#Eval("ID") %>' OnClick="numeroCompra_Click" CssClass="btn btn-link">#<%#Eval("ID")%></asp:LinkButton></td>
                                        <td><%#Eval("Proveedor.Nombre")%></td>
                                        <td><%#Eval("FechaFormateada")%></td>
                                        <td><%#Eval("ValorTotal")%>$</td>
                                        <td>
                                            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idCompra" CommandArgument='<%#Eval("ID") %>' OnClick="btnEditar_Click" />
                                            <asp:Button ID="btnModalEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="idCompra" CommandArgument='<%#Eval("ID") %>' OnClick="btnModalEliminar_Click" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-6 mt-4">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="DetalleCompra" runat="server" style="min-height: 50vh; max-height: 80vh; overflow-x: hidden;">
                <ContentTemplate>

                    <h1 class="mx-4">Detalles de Compra</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active mx-4">Detalles de la Compra</li>
                    </ol>
                    <div class="card m-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            <b>Detalle de Compras</b>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">Nombre Articulo</th>
                                        <th scope="col">Codigo</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Precio Unitario</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater runat="server" ID="rptDetalle">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("Articulo.Nombre") %></td>
                                                <td><%# Eval("Articulo.Codigo") %></td>
                                                <td><%# Eval("Cantidad") %></td>
                                                <td><%# Eval("PrecioUnitario") %>$</td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>


            <asp:UpdatePanel ID="DetalleProveedor" runat="server" style="min-height: 10vh;">
                <ContentTemplate>
                    <h1 class="mx-4">Detalle de Proveedor</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active mx-4">Detalles de Proveedor</li>
                    </ol>
                    <div class="card m-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            <b>Detalle de Proveedor</b>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered text-center">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Empresa</th>
                                    <th>Cuit</th>
                                </tr>
                                <tbody>

                                    <tr>
                                        <% if (p != null) %>
                                        <%{%>
                                        <td><a href="DetalleProveedor.aspx?id=<%:p.ID%>&return=lstCom" class="btn btn-link"><%:p.Nombre%></a></td>
                                        <td><%:p.Empresa%></td>
                                        <td><%:p.Cuit%></td>
                                        <%} %>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal show" id="ModalEliminar" style="display: none" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar Compra</h1>
                        <asp:Button runat="server" class="btn-close" OnClientClick="CerrarModal()" />
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="lblMensaje" CssClass="text-center" Text="Desea Eliminar Compra?" runat="server"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <asp:Button runat="server" Text="Cancelar" class="btn btn-secondary" OnClientClick="CerrarModal()" />
                        <asp:Button ID="btnEliminar" runat="server" Text="Confirmar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

</script>
    <script>
        function CerrarModal(event) {
            event.preventDefault()
            document.getElementById('ModalEliminar').style.display = 'none'
        }

        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('lstCompra').className += ' active'
    </script>
</asp:Content>

