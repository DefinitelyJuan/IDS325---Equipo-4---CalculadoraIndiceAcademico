<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCrearAsignaturaDocente.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmCrearAsignaturaDocente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="./Resources/CSS/PopUp.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingresar Asignatura Docente</title>


</head>
<body>
    <form id="form1" runat="server">
        <%-- Columna principal --%>
        <div class="container py-0 px-0">

            <div class="d-flex align-items-center flex-column p-3">
                <h4 class="mainHeading">ASIGNAR ASIGNATURA</h4>
                        

                <h5 class="mt-4  lbl  d-flex-column align-self-start">Asignatura:</h5>
                <asp:DropDownList ID="ddlAsignaturas" runat="server" CssClass="cmb" DataSourceID="ObjectDataSource1" DataTextField="Código" DataValueField="ID Asignatura">
                </asp:DropDownList>


                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppMostrarAsignaturaTableAdapter"></asp:ObjectDataSource>


                <h5 class="mt-4  lbl  d-flex-column align-self-start">ID Docente:</h5>
                <asp:DropDownList ID="ddlProfesor" runat="server" CssClass="cmb" DataSourceID="ObjectDataSource2" DataTextField="IDUsuario" DataValueField="IDDocente" AutoPostBack="True" OnSelectedIndexChanged="ddlProfesor_SelectedIndexChanged">
                </asp:DropDownList>

                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblDocentesTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_IDDocente" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IDUsuario" Type="Int32" />
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Apellido" Type="String" />
                        <asp:Parameter Name="Correo" Type="String" />
                        <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                        <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                        <asp:Parameter Name="Estado" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IDUsuario" Type="Int32" />
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Apellido" Type="String" />
                        <asp:Parameter Name="Correo" Type="String" />
                        <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                        <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                        <asp:Parameter Name="Estado" Type="Boolean" />
                        <asp:Parameter Name="Original_IDDocente" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Nombre Docente:</h5>
                <asp:TextBox ID="txtNombreDocente" runat="server" CssClass="txt" Enabled="false"></asp:TextBox>
            </div>
            
            <%-- Botón guardar --%>
            <div class="d-flex justify-content-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return confirm('¿Está seguro de que quiere insertar el registro?');" />
            </div>

        </div>
    </form>
</body>
</html>
