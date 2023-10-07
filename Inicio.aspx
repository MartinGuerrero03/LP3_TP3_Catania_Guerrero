<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="LP3_TP3_Catania_Guerrero.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Bienvenido!<br />
            <br />
            <asp:HyperLink ID="hlCuentas" runat="server" NavigateUrl="~/Gestion_Cnts.aspx" >Gestionar Cuentas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="hlRegistros" runat="server" NavigateUrl="~/Registros.aspx" >Gestionar Registros Contables</asp:HyperLink>
        </div>
    </form>
</body>
</html>
