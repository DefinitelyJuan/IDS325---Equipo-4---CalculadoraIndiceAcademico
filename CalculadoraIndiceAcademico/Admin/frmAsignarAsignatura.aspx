<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAsignarAsignatura.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmAsignarAsignatura" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="../Resources/CSS/CRUD.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCIA | Asignar Asignatura</title>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel1" TargetControlID="btnCreate" ID="frmPopUp" BackgroundCssClass="puBackground">
                    </cc1:ModalPopupExtender>

                <asp:Panel ID="Panel1" runat="server">
                <asp:LinkButton 
                    ID="btnCancel" runat="server" CssClass="btn btn-danger btnCancel" UseSubmitBehavior="false" OnClick="btnCancel_Click">
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
                <iframe id="iframe1" src="frmCrearAsignaturaDocente.aspx" runat="server" class="formFrame"></iframe>     

            </asp:Panel>  

        <%--Modal editar--%>
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel2" TargetControlID="btnUpdate" ID="frmPopUp1" BackgroundCssClass="puBackground">
        </cc1:ModalPopupExtender>
            <asp:Panel ID="Panel2" runat="server">
                <asp:LinkButton 
                    ID="btnCancel1" runat="server" CssClass="btn btn-danger btnCancel" OnClick="btnCancel1_Click" >
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
                <iframe id="iframe2" src="frmEditarAsignaturaDocente.aspx" runat="server" class="formFrame" style="height: 95vh!important"></iframe>     

            </asp:Panel>


        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <img class="logoImg" src="../Resources/Imagenes/sciaLogo.png" />
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto btn-outline-primary secondaryButton" OnClick="lbtnHome_Click"> <i class="fa fa-thin fa-house"></i>&nbspInicio </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnMantenimiento" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnMantenimiento_Click"> <i class="fa fa-solid fa-gear"></i>&nbspMantenimiento </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnCalificaciones_Click"> <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnAsignaturas" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnAsignaturas_Click"> <i class="fa fa-solid fa-book"></i>&nbspAsignaturas </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnAsignarAsignatura" runat="server" CssClass="btn selectedButton" OnClick="lbtnAsignarAsignatura_Click"  > <i class="fa fa-solid fa-file-pen"></i>&nbspAsignar Asignaturas </asp:LinkButton>
                <asp:LinkButton
                    ID="lbtnGenerarIndice" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnGenerarIndice_Click"> <i class="fa-solid fa-scroll"></i>&nbspGenerar Índice </asp:LinkButton> 
                <asp:LinkButton
                    ID="lbtnCerrarSesion" runat="server" CssClass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton" OnClick="lbtnCerrarSesion_Click1"> <i class="fa fa-solid fa-arrow-right-from-bracket"></i>&nbspCerrar Sesión </asp:LinkButton> 
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 m-0">
                    <div class="mt-3 d-flex flex-row justify-content-end align-items-center">
                        <h3 class="m-0 hAdministrador">Administrador&nbsp</h3>
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                    </div>

                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <div class="col-md-10">
                            <h3>Asignar Asignatura:</h3>

                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2 crudButtons">
                            <button runat="server" type="button"  id="btnCreate" class="fa btn btn-outline-secondary"><i class="fa-light fa-plus fa-lg"></i></button>
                            <button runat="server" type="button" id="btnUpdate" class="fa btn btn-outline-secondary"><i class="fa-light fa-pencil fa-lg"></i></button>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="table" OnSelectedIndexChanged="gridMantenimiento_SelectedIndexChanged" SelectedIndex="0"> <%--Cambiar Data Source a la tabla correspondiente--%>
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                            <ControlStyle CssClass="btn btnSeleccionar" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID Asignatura" HeaderText="ID Asignatura" ReadOnly="True" SortExpression="ID Asignatura" InsertVisible="False" />
                            <asp:BoundField DataField="Código" HeaderText="Código" SortExpression="Código" />
                            <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" SortExpression="Asignatura" />
                            <asp:BoundField DataField="ID Docente" HeaderText="ID Docente" SortExpression="ID Docente" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Docente " HeaderText="Docente " SortExpression="Docente " />
                            <asp:BoundField DataField="Trimestre" HeaderText="Trimestre" SortExpression="Trimestre" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppMostrarAsignaturasxDocenteTableAdapter"></asp:ObjectDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
