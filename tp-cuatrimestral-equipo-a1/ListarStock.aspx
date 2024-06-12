<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarStock.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Stock</title>
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
                <b>Listado de Stock de Artículos</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Articulo</th>
                            <th>Proveedor</th>
                            <th>Cantidad</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Articulo</th>
                            <th>Proveedor</th>
                            <th>Cantidad</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptStock">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Articulo.Nombre")%></td>
                                    <td>
                                        <a href="DetalleProveedor.aspx?id=<%#Eval("Proveedor.ID")%>" class="btn btn-link"><%#Eval("Proveedor.Nombre")%></a>
                                    </td>
                                    <td><%#Eval("Cantidad")%></td>
                                    <td>
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar Datos" CssClass="btn btn-warning" CommandName="idStock" CommandArgument='<%#Eval("ID")%>' OnClick="btnEditar_Click" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
