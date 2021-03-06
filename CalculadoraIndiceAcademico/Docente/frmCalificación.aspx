<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCalificación.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmCalificación" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es" >
<head runat="server">
<meta charset="UTF-8"/>
<link rel="stylesheet" href="../Resources/CSS/CRUD.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;300;400;500;700&display=swap" rel="stylesheet"/>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SCIA | Calificaciones</title>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel1" TargetControlID="btnCreate" ID="frmPopUp" BackgroundCssClass="puBackground" OnUnload="frmPopUp_Unload">
                    </cc1:ModalPopupExtender>
        
                <asp:Panel ID="Panel1" runat="server">
                <asp:LinkButton 
                    ID="btnCancel" runat="server" CssClass="btn btn-danger btnCancel" onServerClick = "cancel" OnClick="btnCancel_Click" >
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
                <iframe id="iframe1" src="frmCrearCalificación.aspx" runat="server" class="formFrame"></iframe>     

            </asp:Panel>  


        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <img class="logoImg" src="../Resources/Imagenes/sciaLogo.png" />
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto btn-outline-primary secondaryButton" OnClick="lbtnHome_Click">
                    <i class="fa fa-thin fa-house"></i>&nbspInicio
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn selectedButton">
                    <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones
                </asp:LinkButton>
                <asp:LinkButton
                    ID="lbtnCerrarSesion" runat="server" CssClass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton" OnClick="lbtnCerrarSesion_Click">
                    <i class="fa fa-solid fa-arrow-right-from-bracket"></i>&nbspCerrar Sesión
                </asp:LinkButton> 
            </div>

            <%-- Contenedor derecha --%>
            <div class="col-md-10 p-0">
                <%-- Row 1 --%>
                <div class="row h-25 <%--bg-danger--%> m-0">
                    <%-- Row admin --%>
                    <div class="mt-3 d-flex flex-row justify-content-end align-items-center">
                        <h3 class="m-0 hAdministrador">Docente&nbsp</h3>
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                    </div>                  
                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <div class="col-md-10">
                            <h3>Asignaturas:</h3>
                            <asp:DropDownList ID="ddlCodigo" runat="server" CssClass="cmb" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="Codigo" DataValueField="Codigo" OnSelectedIndexChanged="ddlCodigo_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppObtenerAsignaturasDocentesTableAdapter">
                                <SelectParameters>
                                    <asp:SessionParameter Name="IDDocente" SessionField="idDocente" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2 crudButtons">
                            <button runat="server" type="button"  id="btnCreate" class="fa btn btn-outline-secondary"><i class="fa-light fa-pencil fa-lg"></i></button>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 <%--bg-success--%> m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" CssClass="table" OnSelectedIndexChanged="gridMantenimiento_SelectedIndexChanged" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" >
                            <ControlStyle  CssClass="btn btnSeleccionar" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID Asignatura" HeaderText="ID Asignatura" InsertVisible="False" ReadOnly="True" SortExpression="ID Asignatura" />
                            <asp:BoundField DataField="IDEstudiante" HeaderText="IDEstudiante" SortExpression="IDEstudiante" />
                            <asp:BoundField DataField="Nombre completo" HeaderText="Nombre completo" SortExpression="Nombre completo" ReadOnly="True" />
                            <asp:BoundField DataField="Código" HeaderText="Código" SortExpression="Código" />
                            <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" SortExpression="Asignatura" />
                            <asp:BoundField DataField="Calificación numérica" HeaderText="Calificación numérica" SortExpression="Calificación numérica" />
                            <asp:BoundField DataField="Calificación literal" HeaderText="Calificación literal" SortExpression="Calificación literal" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppEstudiantesxDocenteTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="IDDocente" SessionField="idDocente" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlCodigo" Name="CodigoAsignatura" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
