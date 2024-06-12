<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="DetalleProveedor.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.DetalleProveedor" %>

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

                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Nombre</th>
                            <th>Empresa</th>
                            <th>Cuit</th>
                            <th>Teléfono</th>
                            <th>Email</th>

                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td><%:proveedor.Nombre%></td>
                            <td><%:proveedor.Empresa%></td>
                            <td><%:proveedor.Cuit%></td>
                            <td><%:proveedor.Telefono%></td>
                            <td><%:proveedor.Email%></td>
                        </tr>
                    </tbody>
                </table>
                <div class="d-grid gap-3 d-flex justify-content-around">
                    <a href="ListarStock.aspx" class="btn btn-warning me-md-2 w-25 p-2">Volver</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
