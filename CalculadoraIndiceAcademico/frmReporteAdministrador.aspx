<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporteAdministrador.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmReporteAdministrador" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es" >
<head runat="server">
<meta charset="UTF-8"/>
<link rel="stylesheet" href="./Resources/CSS/CRUD.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCIA | Generar Índice</title>
    <style type="text/css">
        .Report {}
        .Report {}
        .Report {}
        .Report {}
        .Report {}
        .Report {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <img class="logoImg" src="Resources/Imagenes/sciaLogo.png" />
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto btn-outline-primary secondaryButton" OnClick="lbtnHome_Click">
                    <i class="fa fa-thin fa-house"></i>&nbspInicio
                </asp:LinkButton>
                <%--<asp:button id="btnmantenimiento" runat="server" text="Mantenimiento" cssclass="btn btn-outline-primary secondaryButton"/>--%>
                <asp:LinkButton 
                    ID="lbtnMantenimiento" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnMantenimiento_Click">
                    <i class="fa fa-solid fa-gear"></i>&nbspMantenimiento
                </asp:LinkButton>
                <%--<asp:button id="btncalificaciones" runat="server" text="Calificaciones" cssclass="btn btn-outline-primary secondaryButton"/>--%>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton">
                    <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones
                </asp:LinkButton>
                <%--<asp:button id="asignaturas" runat="server" text="Asignaturas" cssclass="btn btn-outline-primary secondaryButton"/>--%>
                <asp:LinkButton 
                    ID="lbtnAsignaturas" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnAsignaturas_Click">
                    <i class="fa fa-solid fa-book"></i>&nbspAsignaturas
                </asp:LinkButton>
                <%--<asp:button id="btngenerarindice" runat="server" text="Generar Índice" cssclass="btn btn-outline-primary secondaryButton"/>--%>
                <asp:LinkButton
                    ID="lbtnGenerarIndice" runat="server" CssClass="btn selectedButton">
                    <i class="fa-solid fa-scroll"></i>&nbspGenerar Índice
                </asp:LinkButton> 
                <%--<asp:button id="btncerrarsesion" runat="server" text="Cerrar Sesión" cssclass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton"/>--%>
                <asp:LinkButton
                    ID="lbtnCerrarSesion" runat="server" CssClass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton">
                    <i class="fa fa-solid fa-arrow-right-from-bracket"></i>&nbspCerrar Sesión
                </asp:LinkButton> 
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 <%--bg-danger--%> m-0">
                    <%-- Row admin --%>
                    <div class="mt-3 d-flex flex-row justify-content-end align-items-center">
                        <h3 class="m-0 hAdministrador">Administrador&nbsp</h3>
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                    </div>                  
                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <h3>RANKING ÍNDICES ACADÉMICOS:</h3>
                        <div class="col-md-10 d-flex flex-row">
                            <asp:DropDownList ID="ddlTipoRank" runat="server" CssClass="col-md-4 cmb" AutoPostBack="True" OnSelectedIndexChanged="ddlTipoRank_SelectedIndexChanged">
                                <asp:ListItem Text="Top 5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="Top 10" Value="10"></asp:ListItem>
                                <asp:ListItem Text="Top 15" Value="15"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <%-- Row 2 --%> 
                <div class="row h-75 m-0">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Height="100%" Width="100%">
                        <localreport reportpath="rptRanking.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsReporteAdministrador"/>
                            </DataSources>
                        </localreport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppMostrarCalificacionesAdminTableAdapter"></asp:ObjectDataSource>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
                <div class="row h-20 m-0 d-flex align-items-end">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
