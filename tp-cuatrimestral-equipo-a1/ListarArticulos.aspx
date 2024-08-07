﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarArticulos.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Articulos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Stock</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Stock</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Artículos</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Codigo</th>
                            <th>Marca</th>
                            <th>Categoria</th>
                            <th>Stock Minimo</th>
                            <th>Porcentaje Ganancia</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptArticulo">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Nombre")%></td>
                                    <td><%#Eval("Codigo")%></td>
                                    <td><%#Eval("Marca.Descripcion")%></td>
                                    <td><%#Eval("Categoria.Descripcion")%></td>
                                    <td><%#Eval("StockMinimo")%></td>
                                    <td><%#Eval("ProcentajeGanancia")%> %</td>
                                    <td>
                                        <asp:Button ID="BtnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idArticulo" OnClick="btnEditar_Click" CommandArgument='<%#Eval("Id")%>' />
                                        <asp:Button ID="btnModalEliminar" Text="Eliminar" CssClass="btn btn-danger" runat="server" CommandName="idArticulo" CommandArgument='<%#Eval("Id") %>' OnClick="btnModalEliminar_Click" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>

            <%-- Modal --%>
            <div class="modal show" id="ModalEliminar" style="display: none" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Eliminar Articulo</h1>
                                <asp:Button runat="server" class="btn-close" OnClientClick="CerrarModal()" />
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="lblMensaje" CssClass="text-center" Text="Desea hacerlo?" runat="server"></asp:Label>
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
    </div>
    <script>
        document.getElementById("listArt").className += ' active'

        function CerrarModal(event) {
            event.preventDefault()
            document.getElementById('ModalEliminar').style.display = 'none'
        }
    </script>
</asp:Content>
