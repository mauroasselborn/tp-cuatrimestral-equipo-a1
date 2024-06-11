<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarArticulos.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarArticulos" %>

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

                        <%-- Acá Tengo que repetir esta sección con los datos de la base --%>
                        <asp:Repeater runat="server" ID="rptArticulo">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Nombre")%></td>
                                    <td>0</td>
                                    <td><%#Eval("Marca.Descripcion")%></td>
                                    <td><%#Eval("Categoria.Descripcion")%></td>
                                    <td><%#Eval("StockMinimo")%></td>
                                    <td>% <%#Eval("ProcentajeGanancia")%></td>
                                    <td>
                                        <%--                                      <asp:Button ID="btnEditar" runat="server" Text="Editar Datos" CssClass="btn btn-warning" CommandName="idStock" CommandArgument='<%#Eval("ID")%>' OnClick="btnEditar_Click" />--%>
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
