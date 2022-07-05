<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPerfilEstudiante.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmPerfilEstudiante" %>
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
    <title>SCIA | Perfil estudiante</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto selectedButton">
                    <i class="fa fa-thin fa-house"></i>&nbspInicio
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnCalificaciones_Click">
                    <i class="fa fa-solid fa-file-pen"></i>&nbspCalificaciones
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
                    <%-- Row Title --%>
                    <h3 class="mt-4 text-center">Aplicación de Cálculo de Índice Académico</h3>
                    <%-- Row Info --%>
                    <div class="row h-75 d-flex ">
                        <%-- Columna cmb--%>
                        <div class="col-md-1 mt-3">
                            <img src=".\Resources\profile.jpeg" class="img-fluid"/>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-10 mt-3">
                            <div class="row">
                            <asp:Label ID="LabelID" runat="server" Text="ID:"></asp:Label>

                            </div>
                            <div class="row">
                            <asp:Label ID="LabelNombre" runat="server" Text="Nombre:"></asp:Label>

                            </div>
                            <div class="row">
                            <asp:Label ID="LabelRol" runat="server" Text="Rol:"></asp:Label>

                            </div>
                            <div class="row">
                            <asp:Label ID="LabelPrograma" runat="server" Text="Programa Académico:"></asp:Label>

                            </div>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 <%--bg-success--%> m-0">
                    <asp:GridView ID="gridMantenimiento" runat="server" AutoGenerateColumns="False" DataKeyNames="IDUsuario" DataSourceID="ObjectDataSource2" CssClass="table"> <%--Cambiar Data Source a la tabla correspondiente--%>
                        <Columns>
                            <asp:BoundField DataField="IDUsuario" HeaderText="IDUsuario" InsertVisible="False" ReadOnly="True" SortExpression="IDUsuario" />
                            <asp:BoundField DataField="Contraseña" HeaderText="Contraseña" SortExpression="Contraseña" />
                            <asp:BoundField DataField="IDRol" HeaderText="IDRol" SortExpression="IDRol" />
                            <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblUsuariosTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_IDUsuario" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Contraseña" Type="String" />
                            <asp:Parameter Name="IDRol" Type="Byte" />
                            <asp:Parameter Name="Estado" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Contraseña" Type="String" />
                            <asp:Parameter Name="IDRol" Type="Byte" />
                            <asp:Parameter Name="Estado" Type="Boolean" />
                            <asp:Parameter Name="Original_IDUsuario" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.tblUsuariosTableAdapter"></asp:ObjectDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

