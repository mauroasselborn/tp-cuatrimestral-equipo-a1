<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarMarcas.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarMarcas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado Marcas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table class="table table-striped table-hover">
        <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Descripción</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Motorola</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Samsung</td>>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">LG</td>
    </tr>
  </tbody>
    </table>
</asp:Content>
