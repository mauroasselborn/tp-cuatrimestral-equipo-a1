﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6 mt-5">
                <img src="../img/ErrorPage.png" alt="Alternate Text" class="img-fluid">
                <p class="mt-4 text-danger">
                    <%: Session["Error"] %>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
