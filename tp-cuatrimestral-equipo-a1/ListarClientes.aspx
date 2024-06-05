﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ListarClientes.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ListarClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="container-fluid px-4">
     <h1 class="mt-4">Clientes</h1>
     <ol class="breadcrumb mb-4">
         <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard</a></li>
         <li class="breadcrumb-item active">Clientes</li>
     </ol>

     <div class="card mb-4">
         <div class="card-header">
             <i class="fas fa-table me-1"></i>
             <b>Listado de Clientes</b>
         </div>
         <div class="card-body">
             <table id="datatablesSimple">
                 <thead>
                     <tr>
                         <th>Nombre</th>
                         <th>Teléfono</th>
                         <th>Direccion</th>
                         <th>Email</th>
                         <th>Acciones</th>
                     </tr>
                 </thead>
                 <tbody>
                 </tbody>
             </table>
         </div>
     </div>
 </div>
</asp:Content>
