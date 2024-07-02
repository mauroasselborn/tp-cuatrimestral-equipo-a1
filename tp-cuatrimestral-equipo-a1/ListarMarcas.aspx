<%@ Page Title="Marcas" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarMarcas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarMarcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Marcas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4 col-7">
        <h1 class="mt-4">Categrías</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Marcas</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Marcas de Artículos</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple" class="text-center" >
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
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idMarca" CommandArgument='<%#Eval("ID") %>' OnClick="btnEditar_Click" />
                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="idMarca" CommandArgument='<%#Eval("ID") %>' OnClick="btnEliminar_Click" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                       
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        ddlMarcas = document.getElementById('ddlMarcas')
        ddlMarcas.classList.remove('collapsed');
        ddlMarcas.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsMarcas').className += " show"
        document.getElementById('lstMarcas').className += ' active'
    </script>
</asp:Content>
