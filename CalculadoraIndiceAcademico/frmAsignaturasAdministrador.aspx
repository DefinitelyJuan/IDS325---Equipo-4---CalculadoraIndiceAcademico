﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAsignaturasAdministrador.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmAsignaturas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
    <title>SCIA | Mantenimiento administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel1" TargetControlID="btnCreate" CancelControlID="btnCancel" ID="frmPopUp" BackgroundCssClass="puBackground">
                    </cc1:ModalPopupExtender>

                <asp:Panel ID="Panel1" runat="server">
                <asp:LinkButton 
                    ID="btnCancel" runat="server" CssClass="btn btn-danger btnCancel" UseSubmitBehavior="false" OnClick="btnCancel_Click" onserverClick="cancel">
                    <i class="fa fa-thin fa-cancel"></i>
                </asp:LinkButton>
                <iframe id="iframe1" src="frmCrearAsignatura.aspx" runat="server" class="formFrame"></iframe>     

            </asp:Panel>  


        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto btn-outline-primary secondaryButton" OnClick="lbtnHome_Click">
                    <i class="fa fa-thin fa-house"></i>&nbspInicio
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnMantenimiento" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnMantenimiento_Click">
                    <i class="fa fa-solid fa-gear"></i>&nbspMantenimiento
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton">
                    <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnAsignaturas" runat="server" CssClass="btn selectedButton">
                    <i class="fa fa-solid fa-book"></i>&nbspAsignaturas
                </asp:LinkButton>
                <asp:LinkButton
                    ID="lbtnGenerarIndice" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnGenerarIndice_Click">
                    <i class="fa-solid fa-scroll"></i>&nbspGenerar Índice
                </asp:LinkButton> 
                <asp:LinkButton
                    ID="lbtnCerrarSesion" runat="server" CssClass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton">
                    <i class="fa fa-solid fa-arrow-right-from-bracket"></i>&nbspCerrar Sesión
                </asp:LinkButton> 
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
                            <h3>Mantenimiento:</h3>
                            <div class="row">
                                <div class="col-md-3">
                                  <asp:DropDownList ID="ddlAsignaturas" runat="server" CssClass="cmb">
                                    <asp:ListItem CssClass="dropdown-item">Asignatura</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2 crudButtons">
                            <button runat="server" type="button"  id="btnCreate" class="fa btn btn-outline-secondary"><i class="fa-light fa-plus fa-lg"></i></button>
                            <button runat="server" onserverclick="Update" id="btnUpdate" class="fa btn btn-outline-secondary"><i class="fa-light fa-pencil fa-lg"></i></button>
                            <button runat="server" onserverclick="Delete" id="btnDelete" class="fa btn btn-outline-secondary"><i class="fa-light fa-trash-can fa-lg"></i></button>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" DataKeyNames="IDAsignatura" DataSourceID="dsAsignaturas" CssClass="table"> <%--Cambiar Data Source a la tabla correspondiente--%>
                        <Columns>
                            <asp:BoundField DataField="IDAsignatura" HeaderText="IDAsignatura" ReadOnly="True" SortExpression="IDAsignatura" InsertVisible="False" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                            <asp:BoundField DataField="IDAreaAcademica" HeaderText="IDAreaAcademica" SortExpression="IDAreaAcademica" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="NumCreditos" HeaderText="NumCreditos" SortExpression="NumCreditos" />
                            <asp:BoundField DataField="FechaCreacion" HeaderText="FechaCreacion" SortExpression="FechaCreacion" />
                            <asp:BoundField DataField="FechaModificacion" HeaderText="FechaModificacion" SortExpression="FechaModificacion" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsAsignaturas" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblAsignaturasTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_IDAsignatura" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Codigo" Type="String" />
                            <asp:Parameter Name="IDAreaAcademica" Type="Int32" />
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="NumCreditos" Type="Byte" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Codigo" Type="String" />
                            <asp:Parameter Name="IDAreaAcademica" Type="Int32" />
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="NumCreditos" Type="Byte" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                            <asp:Parameter Name="Original_IDAsignatura" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>