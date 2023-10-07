<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="LP3_TP3_Catania_Guerrero.Registros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx" >Menu</asp:HyperLink>
            <br />
            <br />
            Registros Contables:<br />
            <br />
            Seleccionar transacción:
            <asp:DropDownList ID="dlTransacciones" runat="server" AutoPostBack="True" DataSourceID="dsGetTransacciones" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="dlTransacciones_SelectedIndexChanged" Width="200px">
            </asp:DropDownList>
&nbsp;
            <asp:Button ID="btEliminar" runat="server" Text="Eliminar" OnClick="btEliminar_Click" />
&nbsp;<asp:Label ID="lbResultado" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Cuenta:
            <asp:DropDownList ID="dlCuentas" runat="server" AutoPostBack="True" DataSourceID="dsGetCuentas" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="dlCuentas_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;&nbsp; Descripción:
            <asp:TextBox ID="txDescripcion" runat="server" required="true" Width="270px"></asp:TextBox>
&nbsp;&nbsp; Monto:
            <asp:TextBox ID="txMonto" runat="server" required="true" Width="150px"></asp:TextBox>
&nbsp;&nbsp; Tipo:
            <asp:DropDownList ID="dlTipo" runat="server">
                <asp:ListItem Value="False">Debe</asp:ListItem>
                <asp:ListItem Value="True">Haber</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btAgregar" runat="server" OnClick="btAgregar_Click" Text="Agregar" />
&nbsp;
            <asp:Button ID="btModificar" runat="server" OnClick="btModificar_Click" Text="Modificar" />
            <br />
            <br />
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
            <asp:SqlDataSource ID="dsGetTransacciones" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idCuenta, RegistrosContables.descripcion, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion AS Expr1 FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.id"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsGetCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsABMRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idCuenta], [descripcion], [monto], [tipo]) VALUES (@idCuenta, @descripcion, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idCuenta] = @idCuenta, [descripcion] = @descripcion, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="dlTransacciones" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="dlCuentas" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txMonto" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="dlTipo" Name="tipo" PropertyName="SelectedValue" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="dlCuentas" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="txDescripcion" Name="descripcion" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txMonto" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="dlTipo" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="dlTransacciones" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
