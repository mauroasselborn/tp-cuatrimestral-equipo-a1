<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFactura.aspx.cs" Inherits="tp_cuatrimestral_equipo_a1.ViewFactura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Factura</title>
    <link rel="stylesheet" href="/css/Factura.css" media="all" />
</head>
<body>
    <header class="clearfix">
        <div id="logo">
            <img src="/Img/logoStore.JPG" class="img-fluid" />
        </div>
        <h1>Factura</h1>
        <div id="company" class="clearfix">
            <div>N° <%: venta.nroFactura%></div>
             <div><span>FECHA</span> <%: venta.FechaVenta%></div>
            <div>TecnoStore</div>
        </div>
        <div id="project">
            <%--            <div><span>PROJECT</span> Website development</div>--%>
            <div><span class="text-left">CLIENTE</span> <%: venta.cliente.Nombre +' '+ venta.cliente.Apellido%></div>
            <div><span>DIRECCION</span><%: venta.cliente.Direccion%></div>
            <div><span>EMAIL</span> <a href="mailto:john@example.com"><%: venta.cliente.Mail%></a></div>

        </div>
    </header>
    <main>
        <table>
            <thead>
                <tr>
                    <th class="service">Articulo</th>
                    <th class="desc">Marca</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptFactura" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="service"><%#Eval("articulo.Nombre")%></td>
                            <td class="desc"><%#Eval("articulo.Marca.Descripcion")%></td>
                            <td class="unit"><%#Eval("cantidad")%></td>
                            <td class="qty"><%#Eval("precio")%></td>
                            <td class="total"><%#Eval("subtotal")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

              <tr>
                    <td colspan="4">Metodo de pago: <%: venta.MetodoPago.Descripcion%></td>
<%--                    <td colspan="4">Metodo de pago: <%: venta.MetodoPago.Descripcion%></td>
                    <td class="total">$1,300.00</td>--%>
                </tr>
                <tr>
                    <td colspan="4" class="grand total">TOTAL</td>
                    <td class="grand total">$<%: venta.Total%></td>
                </tr>
            </tbody>
        </table>
<%--        <div id="notices">
            <div>NOTICE:</div>
            <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
        </div>--%>
    </main>
</body>
</html>
