<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gestion_Cnts.aspx.cs" Inherits="LP3_TP3_Catania_Guerrero.Gestion_Cnts" %>

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
            Gestionar Cuentas:<br />
            <br />
            Descripción Cuenta:
            <asp:TextBox ID="tbAgrMdf" required="true" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="btAgregar" runat="server" OnClick="btAgregar_Click" style="margin-left: 0px" Text="Agregar" />
&nbsp;<asp:Button ID="btModificar" runat="server" Text="Modificar" OnClick="btModificar_Click" />
&nbsp;<asp:Button ID="btBorrar" runat="server" Text="Borrar" OnClick="btBorrar_Click" />
            &nbsp;<asp:Label ID="lbResultado" runat="server" Text=" "></asp:Label>
            <br />
            <br />
            Filtrar cuentas:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
&nbsp;
            <br />
            <br />
            <asp:Table ID="Table1" runat="server" Width="268px">
            </asp:Table>
        </div>
        <asp:SqlDataSource ID="dsABM" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE Cuentas SET descripcion = @descripcion WHERE (id = @id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="tbAgrMdf" Name="descripcion" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
