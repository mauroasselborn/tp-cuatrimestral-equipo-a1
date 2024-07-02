<%@ Page Title="Nueva Compra" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CrearCompra.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.CrearCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Nueva Compra</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4">Nueva Compra</h3>
                            </div>
                            <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">                                            
                                            <asp:DropDownList CssClass="form-select" ID="dropProveedor" runat="server">
                                                <asp:ListItem Text="Newsan" />
                                                <asp:ListItem Text="Fravega" />
                                            </asp:DropDownList>
                                            <label for="dropProveedor">Proveedor</label>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="form-floating mb-3 mb-md-0">                                            
                                            <asp:DropDownList CssClass="form-select" ID="dropArticulo" runat="server">
                                                <asp:ListItem Text="TV 55" />
                                                <asp:ListItem Text="TV 32" />
                                            </asp:DropDownList>
                                            <label for="dropArticulo">Articulo</label>
                                        </div>
                                    </div>
                                    <div class="row mb-3">

                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="inputCantidad" TextMode="SingleLine" placeholder="Cantidad" />
                                            <label for="inputCantidad">Cantidad</label>
                                        </div>

                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <asp:Button Text="Guardar" runat="server" class="btn btn-primary btn-block p-2" ID="btnAgregar" OnClick="btnAgregar_Click" />
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        ddlCompra = document.getElementById('ddlCompra')
        ddlCompra.classList.remove('collapsed');
        ddlCompra.setAttribute("aria-expanded", "true");
        document.getElementById('collapseLayoutsCompras').className += " show"
        document.getElementById('addCompra').className += ' active'
    </script>
</asp:Content>
