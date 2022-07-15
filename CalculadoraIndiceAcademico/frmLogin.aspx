<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="./Resources/CSS/login.css"/>
<head runat="server">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCIA</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center flex-column centrarContenedor">
            <div class ="row loginRow">

                <%-- Panel izquierdo LOGO --%>
              <div class="col-md-5 d-flex align-items-center LOGO">
                  <img class="img-fluid" src="Resources/Imagenes/sciaLogo.png"/>
              </div>
                <%-- Panel con campos --%>
              <div class="col-md-7 LoginPanel">
                  <%-- Login panel --%>
                  <div class="container d-flex justify-content-center flex-column h-100">
                       <h1 class="text-center mb-5 title">Inicio de sesión</h1>
                      <%-- Txt user --%>
                      <div class="txtUsuario"><asp:TextBox ID="txtUsuario"  runat="server" cssClass="form-control txtBox" placeholder ="Usuario..." TextMode="Number"></asp:TextBox></div>
                      <%-- Txt pass --%>
                      <div class="txtContraseña"><asp:TextBox ID="txtContraseña" runat="server" cssClass="form-control txtBox" placeholder ="Contraseña..." TextMode = "Password"></asp:TextBox></div>
                      <%-- Boton iniciar sesion --%>
                      <div class="btnIniciarSesión d-flex justify-content-center mt-4">
                          <asp:Button ID="btnIniciarSesion" runat="server" OnClick="btnIniciarSesion_Click" Text="Iniciar Sesión" cssClass=" btnLogin" BackColor="#8EF0FD" BorderColor="#FCFCD4" BorderStyle="Solid"/>
                      </div>
                  </div>

              </div>
            </div>
        </div>
    </form>
    </body>
</html>
