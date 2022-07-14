<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEditarPrograma.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmEditarPrograma" %>

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
    <title>Editar Asignatura</title>


</head>
<body>
    <form id="form1" runat="server">
        <%-- Columna principal --%>
        <div class="container py-0 px-0">

            <div class="d-flex align-items-center flex-column p-3">
                <h4 class="mainHeading text-center">EDITAR PROGRAMA <br /> ACADÉMICO</h4>
            
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Nombre:</h5>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="txt" MaxLength="70"></asp:TextBox>
                
                <h5 class="mt-3 lbl  d-flex-column align-self-start">Versión:</h5>
                <asp:TextBox ID="txtVersion" runat="server" CssClass="txt" MaxLength="15"></asp:TextBox>

                <h5 class="mt-3 lbl  d-flex-column align-self-start">Créditos:</h5>
                <asp:TextBox ID="txtCreditos" runat="server" CssClass="txt" MaxLength="1" TextMode="Number"></asp:TextBox>
            </div>
            
            <%-- Botón guardar --%>
            <div class="d-flex justify-content-center">
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btnGuardar" OnClick="btnGuardar_Click" OnClientClick="return confirm('¿Está seguro de que quiere insertar el registro?');" />
            </div>

        </div>
    </form>
</body>
</html>
