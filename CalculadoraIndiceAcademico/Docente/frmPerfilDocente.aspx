<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPerfilDocente.aspx.cs" Inherits="CalculadoraIndiceAcademico.frmPerfilDocente" %>

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
    <title>SCIA | Perfil docente</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="row m-0">

           <%-- <%-- Columna izquiera --%>
            <div class="col-md-2 panelContainer d-flex justify-content-center flex-column">
                <img class="logoImg" src="../Resources/Imagenes/sciaLogo.png" />                
                <asp:LinkButton 
                    ID="lbtnHome" runat="server" CssClass="btn mt-auto selectedButton">
                    <i class="fa fa-thin fa-house"></i>&nbspInicio
                </asp:LinkButton>
                <asp:LinkButton 
                    ID="lbtnCalificaciones" runat="server" CssClass="btn btn-outline-primary secondaryButton" OnClick="lbtnCalificaciones_Click">
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
                <div class="row h-25 m-0">
                    <%-- Row Title --%>
                    <h3 class="mt-4 text-center">Aplicación de Cálculo de Índice Académico</h3>
                    <%-- Row Info --%>
                    <div class="row h-75 d-flex ">
                        <%-- Columna cmb--%>
                        <div class="col-md-1 mt-3">
                            <img src="..\Resources\profile.jpeg" class="img-fluid"/>
                        </div>
                        <%-- Columna botones CRUD --%>
                        <div class="col-md-10 mt-3">
                            <div class="row">
                            <asp:Label ID="LabelID" runat="server" Text="ID: "></asp:Label>
                            </div>
                            <div class="row">
                            <asp:Label ID="LabelNombre" runat="server" Text="Nombre: "></asp:Label>
                            </div>
                            <div class="row">
                            <asp:Label ID="LabelRol" runat="server" Text="Rol: "></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- Row 2 --%>
                <div class="row h-75 <%--bg-success--%> m-0">
                    <asp:GridView ID="gridMaterias" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="ObjectDataSource2">
                        <Columns>
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                            <asp:BoundField DataField="Numcreditos" HeaderText="Numcreditos" SortExpression="Numcreditos" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="CalculadoraIndiceAcademico.dsSCIATableAdapters.ppMostrarAsignaturasDocenteTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="IdDocente" SessionField="idDocente" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
