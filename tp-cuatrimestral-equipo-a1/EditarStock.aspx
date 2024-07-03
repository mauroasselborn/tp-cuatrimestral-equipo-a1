<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EditarStock.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.EditarStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Editar Stock</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Editar Datos de Stock</h3>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="row mb-3">

                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtCantidad" TextMode="Number" placeholder="Cantidad" min="0" max="1000" />
                                            <label for="txtCantidad">Cantidad</label>
                                        </div>

                                    </div>
                                    <div class="d-grid gap-3 d-flex justify-content-around">
                                        <asp:Button Text="Aceptar" runat="server" class="btn btn-primary w-50 p-2" ID="btnAceptar" OnClick="btnAceptar_Click" />
                                        <a href="ListarStock.aspx" class="btn btn-danger me-md-2 w-50 p-2">Cancelar</a>
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
