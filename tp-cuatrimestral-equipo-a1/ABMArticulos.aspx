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
                                            <asp:TextBox ID="txtNombre" ClientIDMode="Static" class="form-control " runat="server"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="txtCodigo" class="form-label">Codigo</label>
                                            <asp:TextBox ID="txtCodigo" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="cmbMarca" class="form-label">Marca</label>
                                            <asp:DropDownList ID="ddlMarca" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="cmbTipo" class="form-label">Categorias</label>
                                            <asp:DropDownList ID="ddlCategoria" class="form-select" aria-label="Default select example" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="mb-5 col-5 d-flex">
                                            <label for="txtStockMinimo" class="form-label">Stock minimo</label>
                                            <asp:TextBox ID="txtStockMinimo" ClientIDMode="Static" min="0" class="form-control" runat="server" TextMode="Number" OnTextChanged="txtStockMinimo_TextChanged"></asp:TextBox>
                                        </div>
                                        <div class="mb-5 col-2 ">
                                        </div>
                                        <div class="mb-5 col-5 d-flex">
                                            <label for="txtProcentajeGanancia" class="form-label">Procentaje ganancia</label>
                                            <asp:TextBox ID="txtPorcentajeGanancia" ClientIDMode="Static" min="0" class="form-control" runat="server" TextMode="Number" OnTextChanged="txtPorcentajeGanancia_TextChanged"></asp:TextBox>
                                        </div>

                                        <div class="mb-3 col-2">
                                        </div>
                                        <div class="mb-3 col-4">
                                            <asp:Button ID="btnCancelar" Text="Cancelar" class="btn btn-danger" runat="server" OnClick="btnCancelar_Click" />
                                        </div>
                                        <div class="mb-3 col-2">
                                        </div>
                                        <div class="mb-3 col-4">
                                            <asp:Button ID="btnAceptar" OnClientClick="Validar()" Text="Confirmar" class="btn btn-success" runat="server" OnClick="btnAceptar_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:ScriptManager ID="ModalConfirmacion" runat="server"></asp:ScriptManager>
            </div>
        </div>
    </div>

    <%--MODAL--%>
    <div class="modal show" id="ModalConfirmar" style="display:none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Guardado exitoso!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnModal" onclick="Redirigir()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <script >
        txtNombre = document.getElementById('txtNombre')
        txtCodigo = document.getElementById('txtCodigo')
        txtStock = document.getElementById('txtStockMinimo')
        txtPorcentaje = document.getElementById('txtPorcentajeGanancia')

        function Validar() {
            if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtCodigo.value == '') {
                txtCodigo.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtCodigo.classList.remove("is-invalid")
                txtCodigo.classList.add("is-valid")
            }

            if (txtStock.value == '') {
                txtStock.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtStock.classList.remove("is-invalid")
                txtStock.classList.add("is-valid")
            }

            if (txtPorcentaje.value == '') {
                txtPorcentaje.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtPorcentaje.classList.remove("is-invalid")
                txtPorcentaje.classList.add("is-valid")
            }if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtCodigo.value == '') {
                txtCodigo.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtCodigo.classList.remove("is-invalid")
                txtCodigo.classList.add("is-valid")
            }

            if (txtStock.value == '') {
                txtStock.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtStock.classList.remove("is-invalid")
                txtStock.classList.add("is-valid")
            }

            if (txtPorcentaje.value == '') {
                txtPorcentaje.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtPorcentaje.classList.remove("is-invalid")
                txtPorcentaje.classList.add("is-valid")
            }
        }
<%--        function Redirigir() {
            event.preventDefault()
            <%Response.Redirect("ListarArticulos.aspx");%>
        }--%>


    </script>
</asp:Content>
