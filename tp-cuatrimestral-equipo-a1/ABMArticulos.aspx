<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMArticulos.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Agregar Articulo</h3>
                            </div>
                            <div class="card-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="mb-3 col-12">
                                            <label for="txtNombre" class="form-label">Nombre</label>
                                            <asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="cmbMarca" class="form-label">Marca</label>
                                            <asp:DropDownList ID="ddlMarca" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cmbTipo" class="form-label">Categorias</label>
                                            <asp:DropDownList ID="ddlCategoria" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="txtStockMinimo" class="form-label">Stock minimo</label>
                                            <asp:TextBox ID="txtStockMinimo" type="number" min="0" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="txtProcentajeGanancia" class="form-label">Procentaje ganancia</label>
                                            <asp:TextBox ID="txtProcentajeGanancia" type="number" min="0" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-6 ">
                                            <asp:Button ID="btnCancelar" Text="Cancelar" class="btn btn-danger" runat="server" OnClick="btnCancelar_Click" />
                                        </div>
                                        <div class="mb-3 col-6 ">
                                            <asp:Button ID="btnAceptar" Text="Confirmar" class="btn btn-primary" runat="server" OnClick="btnAceptar_Click" />
                                        </div>
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
