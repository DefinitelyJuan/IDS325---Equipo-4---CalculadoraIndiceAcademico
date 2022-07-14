<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEditarEstudiante.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmEditarEstudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Resources/CSS/PopUp.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingresar estudiante</title>


</head>
<body>
    <form id="form1" runat="server">
        <%-- Columna principal --%>
        <div class="container py-0 px-0">

            <div class="d-flex align-items-center flex-column p-3">
                <h4 class="mainHeading">EDITAR ESTUDIANTE</h4>

                <h5 class="mt-4 lbl d-flex-column align-self-start">ID:</h5>
                <asp:TextBox ID="txtID" runat="server" CssClass="txt" Enabled="False"></asp:TextBox>
            
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Nombres:</h5>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="txt" MaxLength="25"></asp:TextBox>
            
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Apellidos:</h5>
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="txt" MaxLength="25"></asp:TextBox>
            
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Correo electrónico:</h5>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="txt" MaxLength="150" TextMode="Email"></asp:TextBox>
            
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Número de teléfono:</h5>
                <asp:TextBox ID="txtNumeroTelefono" runat="server" CssClass="txt" MaxLength="12" TextMode="Phone"></asp:TextBox>

                <h5 class="mt-3 lbl  d-flex-column align-self-start">Contraseña:</h5>
                <asp:TextBox ID="txtContra" runat="server" CssClass="txt" TextMode = "Password"></asp:TextBox>
            
                <h5 class="mt-4  lbl  d-flex-column align-self-start">Programa de estudio:</h5>
                <asp:DropDownList ID="ddlProgramaEstudio" runat="server" CssClass="cmb" DataSourceID="dllPrograma" DataTextField="Nombre" DataValueField="IDPrograma">
                    <asp:ListItem CssClass="dropdown-item"></asp:ListItem>
                    <asp:ListItem CssClass="dropdown-item">Ingeniería de Software (IDS 2020)</asp:ListItem>
                    <asp:ListItem CssClass="dropdown-item">Ingeniería de Sistemas (SIS 2020)</asp:ListItem>
                    <asp:ListItem CssClass="dropdown-item">Ingeniería de Ciberseguridad (ICS 2020)</asp:ListItem>
                </asp:DropDownList>

                <asp:ObjectDataSource ID="dllPrograma" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblProgramasAcademicosTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_IDPrograma" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Version" Type="String" />
                        <asp:Parameter Name="Creditos" Type="Int32" />
                        <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                        <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Version" Type="String" />
                        <asp:Parameter Name="Creditos" Type="Int32" />
                        <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                        <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                        <asp:Parameter Name="Original_IDPrograma" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>

            </div>
            
            <%-- Botón guardar --%>
            <div class="d-flex justify-content-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return confirm('¿Está seguro de que quiere desactivar el registro?');" />
            </div>

        </div>
    </form>
</body>
</html>
