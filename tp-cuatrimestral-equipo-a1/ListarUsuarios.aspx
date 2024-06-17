<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Usuarios</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Usuarios</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Usuarios</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Tipo</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Nombre</th>
                            <th>Tipo</th>
                        </tr>
                    </tfoot>
                    <tbody>

                        <%-- Acá Tengo que repetir esta sección con los datos de la base --%>
                        <asp:Repeater runat="server" ID="rptUsuario">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("NombreUsuario")%></td>
                                    <td><%#Eval("TipoUsuario")%></td>
                                    <td>
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idMarca" CommandArgument='<%#Eval("ID") %>' OnClick="btnEditar_Click" />
                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="idMarca" CommandArgument='<%#Eval("ID") %>' OnClick="btnEliminar_Click" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%-- -------------- --%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>