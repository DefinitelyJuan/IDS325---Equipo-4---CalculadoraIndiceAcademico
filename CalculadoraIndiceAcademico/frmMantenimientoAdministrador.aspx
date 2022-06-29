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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css%22%3E
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
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 bg-danger m-0">
                    <%-- Row admin --%>
                    <div class="row">
                        <h3 class="text-right">Administrador</h3>
                    </div>
                    <%-- Row text --%>
                    <div class="row">
                        <h3>MANTENIMIENTO</h3>
                    </div>
                    <%-- Row controls --%>
                    <div class="row">
                        <%-- Columna cmb--%>
                        <div class="col-md-10">
                            <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2">
                            <i class="fa-solid fa-home">dbf</i>
                            <asp:Button ID="Button1" runat="server" Text="<% # FontAwesome.Icons.Rocket %>"
 cssClass="fa"/>
                            <asp:Button ID="Button2" runat="server" Text="Button" />
                            <asp:Button ID="Button3" runat="server" Text="Button" />
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 bg-success m-0">
                    
                </div>
            </div>
        </div>
    </form>
</body>
</html>
