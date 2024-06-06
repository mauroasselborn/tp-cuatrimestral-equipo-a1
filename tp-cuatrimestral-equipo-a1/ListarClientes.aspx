<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid px-4">
        <h1 class="mt-4">Clientes</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Clientes</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                <b>Listado de Clientes</b>
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Documento</th>
                            <th>Teléfono</th>
                            <th>Direccion</th>
                            <th>Email</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptClientes" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Nombre") %>  <%# Eval("Apellido")  %></td>
                                    <td><%#Eval("Documento") %></td>
                                    <td><%#Eval("Telefono") %></td>
                                    <td><%#Eval("Direccion") %></td>
                                    <td><%#Eval("Mail") %></td>
                                    <td>
                                        <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning" CommandName="idCategoria" CommandArgument='<%#Eval("ID") %>'  />
                                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="idCategoria" CommandArgument='<%#Eval("ID") %>' />
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
