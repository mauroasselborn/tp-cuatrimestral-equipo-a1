<%@ Page Title="Gestion articulo" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMArticulos.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMArticulos" %>

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
                                            <asp:TextBox ID="txtNombre" ClientIDMode="Static" class="form-control " runat="server" TabIndex="1"></asp:TextBox>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="txtCodigo" class="form-label">Codigo</label>
                                            <asp:TextBox ID="txtCodigo" ClientIDMode="Static" class="form-control" runat="server" TabIndex="2"></asp:TextBox>
                                            <asp:Label ID="lblMismoCodigo" CssClass="text-danger" Text="" runat="server"></asp:Label>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="cmbMarca" class="form-label">Marca</label>
                                            <asp:DropDownList ID="ddlMarca" class="form-select" aria-label="Default select example" runat="server" TabIndex="3"></asp:DropDownList>
                                        </div>
                                        <div class="mb-3 col-12">
                                            <label for="cmbTipo" class="form-label">Categorias</label>
                                            <asp:DropDownList ID="ddlCategoria" class="form-select" aria-label="Default select example" runat="server" TabIndex="4"></asp:DropDownList>
                                        </div>
                                        <div class="mb-2 col-5 ">
                                            <label for="txtStockMinimo" class="form-label">Stock minimo</label>
                                            <asp:TextBox ID="txtStockMinimo" ClientIDMode="Static" min="1" CssClass="form-control" runat="server" TextMode="Number" TabIndex="5"></asp:TextBox>
                                        </div>
                                        <div class="mb-2 col-2 ">
                                        </div>
                                        <div class="mb-2 col-5">
                                            <label for="txtProcentajeGanancia" class="form-label">Procentaje ganancia</label>
                                            <asp:TextBox ID="txtPorcentajeGanancia" onkeypress="return filterFloat(event,this);" ClientIDMode="Static" min="1" CssClass="form-control" runat="server" TabIndex="6"></asp:TextBox>
                                            <label>separar decimales con coma (",")</label>
                                        </div>
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid">
                                                <asp:Button ID="btnAceptar" OnClientClick="return Validar()" Text="Confirmar" class="btn btn-primary" runat="server" OnClick="btnAceptar_Click" TabIndex="7" />
                                            </div>
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
    <div class="modal show" id="ModalConfirmar" style="display: none">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <svg fill="#269a1d" height="100px" width="100px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve" stroke="#269a1d">

                        <g id="SVGRepo_bgCarrier" stroke-width="0" />

                        <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" />

                        <g id="SVGRepo_iconCarrier">
                            <g>
                                <path d="M474.045,173.813c-4.201,1.371-6.494,5.888-5.123,10.088c7.571,23.199,11.411,47.457,11.411,72.1 c0,62.014-24.149,120.315-68,164.166s-102.153,68-164.167,68s-120.316-24.149-164.167-68S16,318.014,16,256 S40.149,135.684,84,91.833s102.153-68,164.167-68c32.889,0,64.668,6.734,94.455,20.017c28.781,12.834,54.287,31.108,75.81,54.315 c3.004,3.239,8.066,3.431,11.306,0.425c3.24-3.004,3.43-8.065,0.426-11.306c-23-24.799-50.26-44.328-81.024-58.047 C317.287,15.035,283.316,7.833,248.167,7.833c-66.288,0-128.608,25.813-175.48,72.687C25.814,127.392,0,189.712,0,256 c0,66.287,25.814,128.607,72.687,175.479c46.872,46.873,109.192,72.687,175.48,72.687s128.608-25.813,175.48-72.687 c46.873-46.872,72.687-109.192,72.687-175.479c0-26.332-4.105-52.26-12.201-77.064 C482.762,174.736,478.245,172.445,474.045,173.813z" />
                                <path d="M504.969,83.262c-4.532-4.538-10.563-7.037-16.98-7.037s-12.448,2.499-16.978,7.034l-7.161,7.161 c-3.124,3.124-3.124,8.189,0,11.313c3.124,3.123,8.19,3.124,11.314-0.001l7.164-7.164c1.51-1.512,3.52-2.344,5.66-2.344 s4.15,0.832,5.664,2.348c1.514,1.514,2.348,3.524,2.348,5.663s-0.834,4.149-2.348,5.663L217.802,381.75 c-1.51,1.512-3.52,2.344-5.66,2.344s-4.15-0.832-5.664-2.348L98.747,274.015c-1.514-1.514-2.348-3.524-2.348-5.663 c0-2.138,0.834-4.149,2.351-5.667c1.51-1.512,3.52-2.344,5.66-2.344s4.15,0.832,5.664,2.348l96.411,96.411 c1.5,1.5,3.535,2.343,5.657,2.343s4.157-0.843,5.657-2.343l234.849-234.849c3.125-3.125,3.125-8.189,0-11.314 c-3.124-3.123-8.189-3.123-11.313,0L212.142,342.129l-90.75-90.751c-4.533-4.538-10.563-7.037-16.98-7.037 s-12.448,2.499-16.978,7.034c-4.536,4.536-7.034,10.565-7.034,16.977c0,6.412,2.498,12.441,7.034,16.978l107.728,107.728 c4.532,4.538,10.563,7.037,16.98,7.037c6.417,0,12.448-2.499,16.977-7.033l275.847-275.848c4.536-4.536,7.034-10.565,7.034-16.978 S509.502,87.794,504.969,83.262z" />
                            </g>
                        </g>

                    </svg>
                    Guardado exitoso!
                </div>
                <div class="modal-footer">
                    <asp:Button ID="BtnAceptarModal" Text="Aceptar" CssClass="btn btn-primary" OnClick="BtnAceptarModal_Click" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <script>
        txtNombre = document.getElementById('txtNombre')
        txtCodigo = document.getElementById('txtCodigo')
        txtStock = document.getElementById('txtStockMinimo')
        txtPorcentaje = document.getElementById('txtPorcentajeGanancia')

        function Validar(event) {
            if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                return false
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtCodigo.value == '') {
                txtCodigo.classList.add("is-invalid")
                return false
            } else {
                txtCodigo.classList.remove("is-invalid")
                txtCodigo.classList.add("is-valid")
            }

            if (txtStock.value == '') {
                txtStock.classList.add("is-invalid")
                return false
            } else {
                txtStock.classList.remove("is-invalid")
                txtStock.classList.add("is-valid")
            }

            if (txtPorcentaje.value == '') {
                txtPorcentaje.classList.add("is-invalid")
                return false
            } else {
                txtPorcentaje.classList.remove("is-invalid")
                txtPorcentaje.classList.add("is-valid")
            }

            if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                return false
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtCodigo.value == '') {
                txtCodigo.classList.add("is-invalid")
                return false
            } else {
                txtCodigo.classList.remove("is-invalid")
                txtCodigo.classList.add("is-valid")
            }

            if (txtStock.value == '' && txtStock.value > 0) {
                txtStock.classList.add("is-invalid")
                return false
            } else {
                txtStock.classList.remove("is-invalid")
                txtStock.classList.add("is-valid")
            }

            if (txtPorcentaje.value == '' && txtPorcentaje.value > 0 ) {
                txtPorcentaje.classList.add("is-invalid")
                return false
            } else {
                txtPorcentaje.classList.remove("is-invalid")
                txtPorcentaje.classList.add("is-valid")
            }
        }

    </script>
</asp:Content>
