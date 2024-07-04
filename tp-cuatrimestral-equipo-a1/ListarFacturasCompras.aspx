<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarFacturasCompras.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListaFacturas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="container mt-5">
        <div class="row g-0 text-center">
            <div class="col-12">
                <div class="container">
                    <table id="datatablesSimple" class="table table-hover" style="height: 100%;">
                        <thead>
                            <tr>
                                <th scope="col">Nro Factura</th>
                                <th scope="col">Proveedor</th>
                                <th scope="col">Metodo Pago</th>
                                <th scope="col">Total</th>
                                <th scope="col">Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
