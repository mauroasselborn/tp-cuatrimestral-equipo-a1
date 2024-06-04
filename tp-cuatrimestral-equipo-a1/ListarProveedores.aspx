<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarProveedores.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarProveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Proveedores</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Proveedores</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Proveedores</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Proveedores de Artículos</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Empresa</th>
                            <th>Cuit</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Nombre</th>
                            <th>Empresa</th>
                            <th>Cuit</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>

                        <%-- Acá Tengo que repetir esta sección con los datos de la base --%>
                        <asp:Repeater runat="server" ID="rptProveedor">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Proveedor.Nombre")%></td>
                                    <td><%#Eval("Proveedor.Empresa")%></td>
                                    <td><%#Eval("Proveedor.Cuit")%></td>
                                    <td><%#Eval("Proveedor.Telefono")%></td>
                                    <td><%#Eval("Proveedor.Email")%></td>
                                    <td>
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-link" CommandName='<%#Eval("idProveedor") %>' CommandArgument='<%#Eval("Proveedor.ID") %>' />
                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-link" CommandName='<%#Eval("idProveedor") %>' CommandArgument='<%#Eval("Proveedor.ID") %>' />
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
