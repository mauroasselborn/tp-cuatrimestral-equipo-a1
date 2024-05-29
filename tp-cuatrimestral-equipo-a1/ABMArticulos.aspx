<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMArticulos.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="mb-3 col-12">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3 col-12">
                <label for="cmbMarca" class="form-label">Marca</label>
                <asp:DropDownList id="cmbMarca" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="cmbTipo" class="form-label">Tipo</label>
                <asp:DropDownList id="cmbTipo" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3 col-12">
                <label for="txtStockMinimo" class="form-label">Stock minimo</label>
                <asp:TextBox ID="txtStockMinimo" type="number" min="0" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3 col-12">
                <label for="txtProcentajeGanancia" class="form-label">Procentaje ganancia</label>
                <asp:TextBox ID="txtProcentajeGanancia" type="number" min="0" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3 col-12 ">
                    <asp:button iD="btnCancelar" Text="Cancelar" class="btn btn-danger" runat="server" />
                    <asp:button iD="btnAceptar" Text="Confirmar" class="btn btn-success" runat="server" />
            </div>
            </div>
    </div>
</asp:Content>
