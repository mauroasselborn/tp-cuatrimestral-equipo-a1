<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.EditarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Editar Usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Editar usuario</h3>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="inputUsuario" TextMode="SingleLine" placeholder="Usuario" />
                                        <label for="inputUsuario">Usuario</label>
                                        <asp:RequiredFieldValidator
                                            ID="rfvUsuario"
                                            runat="server"
                                            ControlToValidate="inputUsuario"
                                            ErrorMessage="El nombre de usuario es obligatorio."
                                            CssClass="text-danger"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <asp:Label ID="lblErrorUsuario" CssClass="text-danger" Text="" runat="server"></asp:Label>
                                        <asp:RegularExpressionValidator
                                            ID="revUsuario"
                                            runat="server"
                                            ControlToValidate="inputUsuario"
                                            ErrorMessage="Debe tener entre 4 y 50 caracteres y solo puede contener letras, números, espacios, comas y puntos."
                                            ValidationExpression="^[a-zA-Z0-9 ,.'-]{4,50}$"
                                            CssClass="text-danger"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="inputPassword" TextMode="SingleLine" placeholder="Contraseña" />
                                        <label for="inputPassword">Contraseña</label>
                                        <asp:RequiredFieldValidator
                                            ID="rfvPass"
                                            runat="server"
                                            ControlToValidate="inputPassword"
                                            ErrorMessage="La contraseña es obligatoria."
                                            CssClass="text-danger"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator
                                            ID="revPass"
                                            runat="server"
                                            ControlToValidate="inputPassword"
                                            ErrorMessage="Debe tener entre 4 y 50 caracteres y solo puede contener letras, números, espacios, comas y puntos."
                                            ValidationExpression="^[a-zA-Z0-9 ,.'-]{4,50}$"
                                            CssClass="text-danger"
                                            Display="Dynamic">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="inputConfirmPassword" TextMode="SingleLine" placeholder="Repetir Contraseña" />
                                        <label for="inputConfirmPassword">Repetir Contraseña</label>
                                        <asp:RequiredFieldValidator
                                            ID="rfvConfirmPass"
                                            runat="server"
                                            ControlToValidate="inputConfirmPassword"
                                            ErrorMessage="Repetir la contraseña es obligatorio."
                                            CssClass="text-danger"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <asp:CompareValidator
                                            ID="cvPasswords"
                                            runat="server"
                                            ControlToCompare="inputPassword"
                                            ControlToValidate="inputConfirmPassword"
                                            ErrorMessage="Las contraseñas ingresadas no coinciden"
                                            CssClass="text-danger"
                                            Display="Dynamic" />
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <asp:DropDownList CssClass="form-select" ID="dropTipoUsuario" runat="server">
                                            <asp:ListItem Value="admin" Text="Administrador" />
                                            <asp:ListItem Valuie="user" Text="Usuario" />
                                        </asp:DropDownList>
                                        <label for="dropTipoUsuario">Tipo de usuario</label>
                                    </div>
                                </div>
                                <div class="d-grid gap-5 d-flex justify-content-evenly">
                                    <asp:Button
                                        Text="Agregar"
                                        runat="server"
                                        class="btn btn-primary w-25 p-2"
                                        ID="btnAgregar"
                                        ClientIDMode="Static"
                                        OnClientClick="return validar()"
                                        OnClick="btnAgregar_Click" />

                                    <a href="Dashboard.aspx" class="btn btn-danger me-md-2 w-25 p-2">Cancelar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById("addUser").className += ' active'
    </script>
</asp:Content>