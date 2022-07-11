<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReporteEstudiante.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmReporteEstudiante" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

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
                <%--<asp:button id="btnHome" runat="server" text="Inicio" cssclass="btn mt-auto selectedButton" />--%>
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto btn-outline-primary secondaryButton" OnClick="lbtnHome_Click"> <i class="fa fa-thin fa-house"></i>&nbspInicio </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnCalificaciones_Click"> <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones </asp:LinkButton>
                <asp:LinkButton
                    ID="lbtnGenerarIndice" runat="server" CssClass="btn selectedButton"> <i class="fa-solid fa-scroll"></i>&nbspGenerar Índice </asp:LinkButton> 
                <%--<asp:button id="btncerrarsesion" runat="server" text="Cerrar Sesión" cssclass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton"/>--%>
                <asp:LinkButton
                    ID="lbtnCerrarSesion" runat="server" CssClass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton"> <i class="fa fa-solid fa-arrow-right-from-bracket"></i>&nbspCerrar Sesión </asp:LinkButton> 
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 <%--bg-danger--%> m-0">
                    <%-- Row admin --%>
                    <div class="mt-3 d-flex flex-row justify-content-end align-items-center">
                        <h3 class="m-0 hAdministrador">Estudiante&nbsp</h3>
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                    </div>                  
                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <h3>CALCULAR ÍNDICE ACADÉMICO:</h3>
                        <div class="col-md-10 d-flex flex-row">
                            <asp:DropDownList ID="ddlPrograma" runat="server" CssClass="col-md-4 cmb" DataTextField="Programa" DataValueField="Programa">
                                <asp:ListItem Selected="True" Hidden="True">Programa</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlTipoIndice" runat="server" CssClass="col-md-4 cmb" OnSelectedIndexChanged="ddlTipoIndice_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="General" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Trimestral" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlTrimestre" runat="server" cssClass="col-md-4 cmb" DataSourceID="ObjectDataSource2" DataTextField="Trimestre" DataValueField="Trimestre" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppObtenerTrimestresEstudianteTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="IDEstudiante" SessionField="idEstudiante" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppObtenerProgramaEstudianteTableAdapter">
                                <SelectParameters>
                                    <asp:Parameter Name="IDEstudiante" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                    </div>
                </div>
                <%-- Row 2 --%> 
                <div class="row h-55 m-0">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" CssClass="Report" Width="1810px">
                        <LocalReport ReportPath="ReporteCalificaciones.rdlc">
                        </LocalReport>
                    </rsweb:ReportViewer>
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