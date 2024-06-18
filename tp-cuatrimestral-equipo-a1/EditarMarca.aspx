<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarMarca.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.EditarMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Editar Marca</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Editar Marca de Artículo</h3>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox
                                                runat="server"
                                                CssClass="form-control"
                                                ID="txtDescripcion"
                                                ClientIDMode="Static"
                                                TextMode="SingleLine"
                                                placeholder="Descripcion" />

                                            <label for="txtDescripcion">Descripción</label>
                                            <asp:RequiredFieldValidator
                                                ID="rfvDescripcion"
                                                runat="server"
                                                ControlToValidate="txtDescripcion"
                                                ErrorMessage="La descripción es obligatoria."
                                                CssClass="text-danger"
                                                Display="Dynamic">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                                ID="revDescripcion"
                                                runat="server"
                                                ControlToValidate="txtDescripcion"
                                                ErrorMessage="Debe tener entre 1 y 50 caracteres y solo puede contener letras, números, espacios, comas y puntos."
                                                ValidationExpression="^[a-zA-Z0-9 ,.'-]{1,50}$"
                                                CssClass="text-danger"
                                                Display="Dynamic">
                                            </asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="d-grid gap-3 d-flex justify-content-around">
                                        <asp:Button Text="Aceptar" runat="server" class="btn btn-primary w-50 p-2" ID="btnAceptar" OnClick="btnAceptar_Click" />
                                        <a href="ListarMarcas.aspx" class="btn btn-danger me-md-2 w-50 p-2">Cancelar</a>
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
