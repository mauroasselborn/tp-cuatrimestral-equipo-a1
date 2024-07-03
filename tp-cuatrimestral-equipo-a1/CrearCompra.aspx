﻿<%@ Page Title="Nueva Compra" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearCompra.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nueva Compra</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="px-4 col-6">
            <h1 class="mt-4">Compra</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Compra</li>
            </ol>

            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    <b>Listado  de Artículos</b>
                </div>
                <div class="card-body">
                    <table id="datatablesSimple." class="table table-striped table-bordered text-center text-center">
                        <thead>
                            <tr>
                                <th>Articulo</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="rptArticulo">
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-start"><%#Eval("Nombre")%></td>
                                        <td>
                                            <asp:TextBox runat="server" TextMode="Number" min="0" max="1000" Text="0" CssClass="m-auto form-control w-50 text-center" /></td>
                                        <td>
                                            <asp:Button ID="BtnAgregar" CssClass="btn btn-success" runat="server" Text="+" CommandArgument='<%#Eval("ID")%>' OnClick="btnAgregar_Click" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('addCompra').className += ' active'
    </script>
</asp:Content>
