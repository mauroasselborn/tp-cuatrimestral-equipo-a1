<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarUsuarios.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Usuarios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table class="table table-striped table-hover">
        <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
        <th scope="col">Tipo usuario</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Admin</td>
      <td>Administrador</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Usuario</td>
      <td>Usuario</td>
    </tr>
  </tbody>
    </table>
</asp:Content>
