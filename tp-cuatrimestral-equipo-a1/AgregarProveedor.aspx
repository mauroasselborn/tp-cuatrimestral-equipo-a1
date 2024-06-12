<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarProveedor.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.AgregarProveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Agregar Proveedor</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Agregar Proveedor</h3>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="txtNombre" placeholder="Nombre" />
                                                <label for="txtNombre">Nombre</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmpresa" TextMode="SingleLine" placeholder="Empresa" />
                                                <label for="txtEmpresa">Empresa</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtCuit" TextMode="SingleLine" placeholder="Cuit" />
                                                <label for="txtCuit">Cuit</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" TextMode="Phone" placeholder="011-15-123456" />
                                                <label for="txtTelefono">Teléfono</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" TextMode="SingleLine" placeholder="Direccion" />
                                                <label for="txtDireccion">Dirección</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="nombre@ejemplo.com" />
                                                <label for="txtEmail">Email</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid gap-5 d-flex justify-content-evenly">
                                        <asp:Button Text="Agregar" runat="server" class="btn btn-primary w-25 p-2" ID="btnAgregar" OnClick="btnAgregar_Click" />
                                        <a href="Dashboard.aspx" class="btn btn-danger me-md-2 w-25 p-2">Cancelar</a>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
