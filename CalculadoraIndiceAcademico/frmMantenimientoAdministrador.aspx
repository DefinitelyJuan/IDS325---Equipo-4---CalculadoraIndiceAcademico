<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMantenimientoAdministrador.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmMantenimientoAdministrador" %>

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
        <%-- Modal crear --%>
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel1" TargetControlID="btnCreate" ID="frmPopUp" BackgroundCssClass="puBackground">
                    </cc1:ModalPopupExtender>

                <asp:Panel ID="Panel1" runat="server">
                <asp:LinkButton 
                    ID="btnCancel" runat="server" CssClass="btn btn-danger btnCancel">
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
                <iframe id="iframe1" src="frmEstudiante.aspx" runat="server" class="formFrame"></iframe>     

            </asp:Panel>

        <%-- Modal editar --%>
        <cc1:ModalPopupExtender runat="server" PopupControlID="Panel2" TargetControlID="btnUpdate" ID="frmPopUp2" BackgroundCssClass="puBackground">
                    </cc1:ModalPopupExtender>

                <asp:Panel ID="Panel2" runat="server">
                <asp:LinkButton 
                    ID="btnCancel2" runat="server" CssClass="btn btn-danger btnCancel">
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
                <iframe id="iframe2" src="frmEditarRol.aspx" runat="server" class="formFrame"></iframe>     

            </asp:Panel>

        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <%--<asp:button id="btnHome" runat="server" text="Inicio" cssclass="btn mt-auto selectedButton" />--%>
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto selectedButton">
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
                    ID="lbtnGenerarIndice" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnGenerarIndice_Click">
                    <i class="fa-solid fa-scroll"></i>&nbspGenerar Índice
                </asp:LinkButton> 
                <%--<asp:button id="btncerrarsesion" runat="server" text="Cerrar Sesión" cssclass="btn btn-outline-primary btncerrarsesion mt-auto secondaryButton"/>--%>
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
                        <h3 class="m-0 hAdministrador">Administrador&nbsp</h3>
                        <i class="fa fa-light fa-circle-user fa-2x"></i>
                    </div>
                    <%-- Row text --%>                    <%--<div class="row" style="padding-bottom: 0%">
                        <h3>MANTENIMIENTO</h3>
                    </div>--%>                    <%-- Row controls --%>
                    <div class="row d-flex align-content-center">
                        <%-- Columna cmb--%>
                        <div class="col-md-10">
                            <h3>Mantenimiento:</h3>
                            <asp:DropDownList ID="ddlTipoMantenimiento" runat="server" CssClass="cmb" AutoPostBack="true" OnTextChanged="ddlTipoMantenimiento_TextChanged" >
                                <asp:ListItem CssClass="dropdown-item">Roles</asp:ListItem>
                                <asp:ListItem CssClass="dropdown-item">Programa Académico</asp:ListItem>
                                <asp:ListItem CssClass="dropdown-item">Area Académica</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-2 crudButtons">
                            <button runat="server" type="button"  id="btnCreate" class="fa btn btn-outline-secondary"><i class="fa-light fa-plus fa-lg"></i></button>
                            <button runat="server" type="button" id="btnUpdate" class="fa btn btn-outline-secondary"><i class="fa-light fa-pencil fa-lg"></i></button>
                            <asp:LinkButton OnClientClick="return confirm('¿Está seguro de que quiere desactivar el registro?');" ID="btnDelete" runat="server" cssClass="fa btn btn-outline-secondary" OnClick="btnDelete_Click"><i class="fa-light fa-trash-can fa-lg"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 <%--bg-success--%> m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="IDRol" DataSourceID="ObjectDataSource1" OnSelectedIndexChanged="gridMantenimiento_SelectedIndexChanged" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="IDRol" HeaderText="IDRol" ReadOnly="True" SortExpression="IDRol" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblRolesTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_IDRol" Type="Byte" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="Original_IDRol" Type="Byte" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gridMantenimientoPrograma" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="programaSource" DataKeyNames="IDPrograma" OnSelectedIndexChanged="gridMantenimientoPrograma_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="IDPrograma" HeaderText="IDPrograma" InsertVisible="False" ReadOnly="True" SortExpression="IDPrograma" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                            <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
                            <asp:BoundField DataField="FechaCreacion" HeaderText="FechaCreacion" SortExpression="FechaCreacion" />
                            <asp:BoundField DataField="FechaModificacion" HeaderText="FechaModificacion" SortExpression="FechaModificacion" />
                            <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="programaSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblProgramasAcademicosTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_IDPrograma" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="Version" Type="String" />
                            <asp:Parameter Name="Creditos" Type="Int32" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                            <asp:Parameter Name="Estado" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="Version" Type="String" />
                            <asp:Parameter Name="Creditos" Type="Int32" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                            <asp:Parameter Name="Estado" Type="Boolean" />
                            <asp:Parameter Name="Original_IDPrograma" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gridMantenimientoArea" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="areaSource" DataKeyNames="IDArea" OnSelectedIndexChanged="gridMantenimientoArea_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="IDArea" HeaderText="IDArea" InsertVisible="False" ReadOnly="True" SortExpression="IDArea" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="FechaCreacion" HeaderText="FechaCreacion" SortExpression="FechaCreacion" />
                            <asp:BoundField DataField="FechaModificacion" HeaderText="FechaModificacion" SortExpression="FechaModificacion" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="areaSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblAreasAcademicasTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_IDArea" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Nombre" Type="String" />
                            <asp:Parameter Name="FechaCreacion" Type="DateTime" />
                            <asp:Parameter Name="FechaModificacion" Type="DateTime" />
                            <asp:Parameter Name="Original_IDArea" Type="Int32" />
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
