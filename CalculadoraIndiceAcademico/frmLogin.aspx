<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="./Resources/CSS/login.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCIA</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
          <div class="LOGO"></div>
          <div class="LoginPanel">
              Iniciar Sesion
<%--            <div class="Labels">
              <div class="Usuario">Usuario</div>
              <div class="Contraseña">Contraseña</div>
            </div>--%>
            <div class="Controllers">
              <div class="btnIniciarSesión"><asp:Button ID="btnIniciarSesion" runat="server" OnClick="btnIniciarSesion_Click" Text="Iniciar Sesión" cssClass="btnLogin" BackColor="#8EF0FD" BorderColor="#FCFCD4" BorderStyle="Solid"/></div>
              <div class="txtContraseña"><asp:TextBox ID="txtContraseña" runat="server" CssClass="txtBox">Contraseña...</asp:TextBox></div>
              <div class="txtUsuario"><asp:TextBox ID="txtUsuario" runat="server" CssClass="txtBox">Usuario...</asp:TextBox></div>
            </div>
          </div>
        </div>
    </form>
    </body>
</html>
