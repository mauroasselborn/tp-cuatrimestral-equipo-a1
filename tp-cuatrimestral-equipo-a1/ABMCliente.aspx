<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMCliente.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMCliente" EnableEventValidation="true" %>

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
                                <h3 class="text-center font-weight-light my-4">
                                    <asp:Label ID="lblTitulo" Text="Agregar cliente" runat="server"></asp:Label></h3>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" ClientIDMode="static" TextMode="SingleLine" CssClass="form-control" ID="txtNombre" placeholder="Nombre" AutoCompleteType="None" />
                                            <label for="inputNombre">Nombre</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <asp:TextBox runat="server" ClientIDMode="static" CssClass="form-control" ID="txtApellido" TextMode="SingleLine" placeholder="Apellido" />
                                            <label for="inputEmpresa">Apellido</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 ">
                                    <div class="form-floating mb-3">
                                        
                                        <asp:TextBox runat="server" ClientIDMode="static" CssClass="form-control" ID="txtDocumento" placeholder="1234567" />
                                        <label for="telefono">Documento</label>
                                            <asp:Label ID="lblMismoCliente" Text="" CssClass="text-danger mismoDoc"  runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-12 ">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" ClientIDMode="static" CssClass="form-control" ID="txtTelefono" TextMode="Phone" placeholder="011-15-123456" />
                                        <label for="telefono">Teléfono</label>
                                    </div>
                                </div>


                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" TextMode="SingleLine" placeholder="Direccion" />
                                            <label for="inputDireccion">Calle</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" ClientIDMode="static" CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="nombre@ejemplo.com" />
                                            <label for="inputEmail">Email</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-0">
                                    <div class="d-grid">
                                        <asp:Button Text="Crear Cliente" runat="server" class="btn btn-primary btn-block p-2" ID="btnAgregar" OnClientClick="Validar()" OnClick="btnAgregar_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--MODAL--%>
    <div class="modal show" id="ModalConfirmar" style="display: none">
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

    <script>
        txtNombre = document.getElementById('txtNombre')
        txtApellido = document.getElementById('txtApellido')
        txtDocumento = document.getElementById('txtDocumento')
        txtTelefono = document.getElementById('txtTelefono')
        txtEmail = document.getElementById('txtEmail')

        function Validar() {
            if (txtNombre.value == '') {
                txtNombre.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtNombre.classList.remove("is-invalid")
                txtNombre.classList.add("is-valid")
            }

            if (txtApellido.value == '') {
                txtApellido.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtApellido.classList.remove("is-invalid")
                txtApellido.classList.add("is-valid")
            }

            if (txtDocumento.value == '') {
                txtDocumento.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtDocumento.classList.remove("is-invalid")
                txtDocumento.classList.add("is-valid")
            }

            if (txtTelefono.value == '') {
                txtTelefono.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtTelefono.classList.remove("is-invalid")
                txtTelefono.classList.add("is-valid")
            }
            if (txtEmail.value == '') {
                txtEmail.classList.add("is-invalid")
                event.preventDefault()
            } else {
                txtEmail.classList.remove("is-invalid")
                txtEmail.classList.add("is-valid")
            }
        }
<%--        function Redirigir() {
            event.preventDefault()
            <%Response.Redirect("ListarArticulos.aspx");%>
        }--%>


    </script>
</asp:Content>
