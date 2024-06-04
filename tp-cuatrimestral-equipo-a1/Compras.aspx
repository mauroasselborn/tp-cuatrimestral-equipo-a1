<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Listado de Compras</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table class="table table-striped table-hover">
        <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Proveedor</th>
      <th scope="col">Articulo</th>
      <th scope="col">Cantidad</th>
      <th scope="col">Precio</th>
      <th scope="col">Fecha</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Newsan</td>
      <td>TV 55</td>
      <td>10</td>
      <td>10000</td>
      <td>01/06/2024</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Fravega</td>
      <td>TV 32</td>
      <td>5</td>
      <td>7000</td>
      <td>02/06/2024</td>
    </tr>
  </tbody>
    </table>
</asp:Content>

