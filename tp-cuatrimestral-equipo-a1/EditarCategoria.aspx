<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarCategoria.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.EditarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Editar Categoria</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Editar Categría de Artículo</h3>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">

                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDescripcion" TextMode="SingleLine" placeholder="Descripcion" />
                                            <label for="inputDireccion">Descripción</label>
                                        </div>

                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <asp:Button Text="Aceptar" runat="server" class="btn btn-primary btn-block p-2" ID="btnAceptar" OnClick="btnAceptar_Click" />
                                        </div>
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
