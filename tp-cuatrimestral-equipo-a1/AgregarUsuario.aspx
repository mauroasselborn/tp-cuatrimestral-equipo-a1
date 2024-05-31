<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.AgregarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Agregar Usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Agregar usuario</h3>
                            </div>
                            <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="inputUsuario" TextMode="SingleLine" placeholder="Usuario" />
                                            <label for="inputUsuario">Usuario</label>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="inputPassword" TextMode="SingleLine" placeholder="Contraseña" />
                                            <label for="inputPassword">Contraseña</label>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">                                            
                                            <asp:DropDownList CssClass="form-select" ID="dropTipoUsuario" runat="server">
                                                <asp:ListItem Text="Administrador" />
                                                <asp:ListItem Text="Usuario" />
                                            </asp:DropDownList>
                                            <label for="dropTipoUsuario">Tipo de usuario</label>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <asp:Button Text="Crear Usuario" runat="server" class="btn btn-primary btn-block p-2" ID="btnAgregar" OnClick="btnAgregar_Click" />
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
