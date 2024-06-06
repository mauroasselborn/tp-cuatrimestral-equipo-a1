<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ABMCliente.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ABMCliente" %>

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
                                <h3 class="text-center font-weight-light my-4">Agregar Cliente</h3>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="txtNombre" placeholder="Nombre" AutoCompleteType="None" />
                                            <label for="inputNombre">Nombre</label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" TextMode="SingleLine" placeholder="Apellido" />
                                            <label for="inputEmpresa">Apellido</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 ">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDocumento" placeholder="1234567" />
                                        <label for="telefono">Documento</label>
                                    </div>
                                </div>
                                <div class="col-12 ">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" TextMode="Phone" placeholder="011-15-123456" />
                                        <label for="telefono">Teléfono</label>
                                    </div>
                                </div>


                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtDireccion" TextMode="SingleLine" placeholder="Direccion" />
                                            <label for="inputDireccion">Calle</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtAltura" TextMode="Number" placeholder="123" />
                                            <label for="inputDireccion">Altura</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="nombre@ejemplo.com" />
                                            <label for="inputEmail">Email</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 mb-0">
                                    <div class="d-grid">
                                        <asp:Button Text="Crear Cliente" runat="server" class="btn btn-primary btn-block p-2" ID="btnAgregar" OnClick="btnAgregar_Click" />
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
