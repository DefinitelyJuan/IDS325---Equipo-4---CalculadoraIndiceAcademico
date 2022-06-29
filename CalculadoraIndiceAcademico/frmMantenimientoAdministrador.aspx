<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMantenimientoAdministrador.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmMantenimientoAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link rel="stylesheet" href="./Resources/CSS/CRUD.css"/>
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
        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">

                    <asp:button id="btnHome" runat="server" text="Inicio" cssclass="btn mt-auto selectedButton"/>
                    <asp:button id="btnmantenimiento" runat="server" text="Mantenimiento" cssclass="btn btn-outline-primary secondaryButton"/>
                    <asp:button id="btncalificaciones" runat="server" text="Calificaciones" cssclass="btn btn-outline-primary secondaryButton"/>
                    <asp:button id="asignaturas" runat="server" text="Asignaturas" cssclass="btn btn-outline-primary secondaryButton"/>
                    <asp:button id="btngenerarindice" runat="server" text="Generar Índice" cssclass="btn btn-outline-primary secondaryButton"/>
                    <asp:button id="btncerrarsesion" runat="server" text="Cerrar Sesión" cssclass="btn btn-outline-primary btncerrarsesion d-flex flex-align-end mt-auto secondaryButton"/>
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 bg-warning p-0">
                lorem   
            </div>
        </div>
    </form>
</body>
</html>
