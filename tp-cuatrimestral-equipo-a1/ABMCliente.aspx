<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMCliente.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMCliente" %>
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
                <label for="txtDocumento" class="form-label">Documento</label>
                <asp:TextBox ID="txtDocumento" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3 col-12">
                <label for="txtTelefono" class="form-label">Telefono</label>
                <asp:TextBox ID="txtTelefono" class="form-control" runat="server"></asp:TextBox>
            </div>
                        <div class="mb-3 col-12">
                <label for="txtDireccion" class="form-label">Direccion</label>
                <asp:TextBox ID="txtDireccion" type="number" min="0" class="form-control" runat="server"></asp:TextBox>
            </div>
                                    <div class="mb-3 col-12">
                <label for="txtMail" class="form-label">Email</label>
                <asp:TextBox ID="txtMail" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3 col-12 ">
                    <asp:button iD="btnCancelar" Text="Cancelar" class="btn btn-danger" runat="server" />
                    <asp:button iD="btnAceptar" Text="Confirmar" class="btn btn-success" runat="server" />
            </div>
            </div>
    </div>
</asp:Content>
