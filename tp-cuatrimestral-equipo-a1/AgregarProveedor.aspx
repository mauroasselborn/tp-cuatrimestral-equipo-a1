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

                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtNombre"
                                                    ErrorMessage="El nombre es obligatorio."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmpresa" TextMode="SingleLine" placeholder="Empresa" />
                                                <label for="txtEmpresa">Empresa</label>
                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtEmpresa"
                                                    ErrorMessage="La empresa es obligatoria."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtCuit" TextMode="SingleLine" placeholder="Cuit" />
                                                <label for="txtCuit">Cuit</label>
                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtCuit"
                                                    ErrorMessage="El CUIT es obligatorio."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator
                                                    runat="server"
                                                    ControlToValidate="txtCuit"
                                                    ErrorMessage="Formato de CUIT no válido."
                                                    ValidationExpression="^\d{2}-\d{8}-\d{1}$"
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" TextMode="Phone" placeholder="011-15-123456" />
                                                <label for="txtTelefono">Teléfono</label>
                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtTelefono"
                                                    ErrorMessage="El teléfono es obligatorio."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator
                                                    runat="server"
                                                    ControlToValidate="txtTelefono"
                                                    ErrorMessage="Formato de teléfono no válido. Debe contener solo números y tener entre 8 y 16 dígitos."
                                                    ValidationExpression="^\d{8,16}$"
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" TextMode="SingleLine" placeholder="Direccion" />
                                                <label for="txtDireccion">Dirección</label>
                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtDireccion"
                                                    ErrorMessage="La dirección es obligatoria."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="nombre@ejemplo.com" />
                                                <label for="txtEmail">Email</label>
                                                <asp:RequiredFieldValidator
                                                    runat="server"
                                                    ControlToValidate="txtEmail"
                                                    ErrorMessage="El email es obligatorio."
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator
                                                    runat="server"
                                                    ControlToValidate="txtEmail"
                                                    ErrorMessage="Formato de email no válido."
                                                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                                    CssClass="text-danger"
                                                    Display="Dynamic">
                                                </asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mb-1">
                                        <asp:Label ID="lblErrorProveedor" CssClass="text-danger" Text="" runat="server"></asp:Label>
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
    <%--<script>
        txtNombre = document.getElementById('txtNombre')
        txtEmpresa = document.getElementById('txtEmpresa')
        txtCuit = document.getElementById('txtCuit')
        txtTelefono = document.getElementById('txtTelefono')
        txtDireccion = document.getElementById('txtDireccion')
        txtEmail = document.getElementById('txtEmail')

        function Validar(event) {
            if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                return false
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtEmpresa.value == '') {
                txtEmpresa.classList.add("is-invalid")
                return false
            } else {
                txtEmpresa.classList.remove("is-invalid")
                txtEmpresa.classList.add("is-valid")
            }

            if (txtCuit.value == '') {
                txtCuit.classList.add("is-invalid")
                return false
            } else {
                txtCuit.classList.remove("is-invalid")
                txtCuit.classList.add("is-valid")
            }

            if (txtTelefono.value == '') {
                txtTelefono.classList.add("is-invalid")
                return false
            } else {
                txtTelefono.classList.remove("is-invalid")
                txtTelefono.classList.add("is-valid")
            }

            if (txtDireccion.value == '') {
                txtDireccion.classList.add("is-invalid")
                return false
            } else {
                txtDireccion.classList.remove("is-invalid")
                txtDireccion.classList.add("is-valid")
            }

            if (txtEmail.value == '') {
                txtEmail.classList.add("is-invalid")
                return false
            } else {
                txtEmail.classList.remove("is-invalid")
                txtEmail.classList.add("is-valid")
            }
        }
    </script>--%>
</asp:Content>

