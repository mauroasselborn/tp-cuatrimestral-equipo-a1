<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarCategorias.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarCategorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Categorías</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Categrías</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Categorías</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Categorías de Artículos</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Descripcion</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Descripcion</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>


                        <asp:Repeater runat="server" ID="rptCategoria">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Descripcion")%></td>
                                    <td>
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idCategoria" CommandArgument='<%#Eval("ID") %>' OnClick="btnEditar_Click" />
                                        <asp:Button ID="btnModalEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="idCategoria" CommandArgument='<%#Eval("ID") %>' OnClick="btnModalEliminar_Click" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal show" id="ModalEliminar" style="display: none" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar Categoría</h1>
                            <asp:Button runat="server" class="btn-close" OnClientClick="CerrarModal()" />
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblMensaje" CssClass="text-center" Text="Desea Eliminar Categoría?" runat="server"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" Text="Cancelar" class="btn btn-secondary" OnClientClick="CerrarModal()" />
                            <asp:Button ID="btnEliminar" runat="server" Text="Confirmar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>

        function CerrarModal(event) {
            event.preventDefault()
            document.getElementById('ModalEliminar').style.display = 'none'
        }
    </script>
</asp:Content>
