<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMantenimientoAdministrador.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmMantenimientoAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="./Resources/CSS/CRUD.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <asp:button id="btncerrarsesion" runat="server" text="Cerrar Sesión" cssclass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton"/>
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 bg-danger m-0">
                    <%-- Row admin --%>
                    <div class="mt-3 d-flex flex-row justify-content-end align-items-center">
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                        <h3 class="m-0 hAdministrador">Administrador</h3>
                    </div>
                    <%-- Row text --%>
                    <div class="row">
                        <h3>MANTENIMIENTO</h3>
                    </div>
                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <div class="col-md-10">
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Programa Academico</asp:ListItem>
                                <asp:ListItem>Roles</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2">
                            <button runat="server" onserverclick="Create" id="btnCreate" class="fa btn btn-outline-secondary"><i class="fa-light fa-plus fa-lg"></i></button>
                            <button runat="server" onserverclick="Update" id="btnUpdate" class="fa btn btn-outline-secondary"><i class="fa-light fa-pencil fa-lg"></i></button>
                            <button runat="server" onserverclick="Delete" id="btnDelete" class="fa btn btn-outline-secondary"><i class="fa-light fa-trash-can fa-lg"></i></button>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 bg-success m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUsuario" DataSourceID="ObjectDataSource1" CssClass="table"> <%--Cambiar Data Source a la tabla correspondiente--%>
                        <Columns>
                            <asp:BoundField DataField="IDUsuario" HeaderText="IDUsuario" InsertVisible="False" ReadOnly="True" SortExpression="IDUsuario" />
                            <asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
                            <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" SortExpression="Contraseña" />
                            <asp:BoundField DataField="IDRol" HeaderText="IDRol" SortExpression="IDRol" />
                            <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblUsuariosTableAdapter"></asp:ObjectDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
