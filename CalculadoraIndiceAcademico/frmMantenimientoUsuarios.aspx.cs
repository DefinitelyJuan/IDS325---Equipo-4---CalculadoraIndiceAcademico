using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace CalculadoraIndiceAcademico
{
    public partial class frmMantemientoUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridMantenimiento.DataSourceID = "ObjectDataSource1";
            gridMantenimiento.DataBind();
        }

        protected void Create(object sender, EventArgs e)
        {
        }
        protected void Update(object sender, EventArgs e)
        {
            int selectedIndex = gridMantenimiento.SelectedIndex;
            string a = gridMantenimiento.Rows[0].Cells[1].Text;
            Response.Write($"<script>alert('{a}');window.location = 'frmMantenimientoUsuarios.aspx';</script>");


        }
        protected void Delete(object sender, EventArgs e)
        {
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoAdministrador.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void ddlTipoUsuario_TextChanged(object sender, EventArgs e)
        {
            string rol = ddlTipoUsuario.SelectedValue.ToString();
            ppMostrarUsuariosTableAdapter user = new ppMostrarUsuariosTableAdapter();
            switch(rol)
            {
                case "Estudiante":
                    iframe1.Src = "frmEstudiante.aspx";
                    gridMantenimiento.DataSourceID = "ObjectDataSource1";
                    gridMantenimiento.DataBind();
                    break;
                case "Docente":
                    iframe1.Src = "frmCrearDocente.aspx";
                    gridMantenimiento.DataSourceID = "ObjectDataSource2";
                    gridMantenimiento.DataBind();
                    break;
                case "Administrador":
                    iframe1.Src = "frmCrearAdministrador.aspx";
                    gridMantenimiento.DataSourceID = "ObjectDataSource3";
                    gridMantenimiento.DataBind();
                    break;
            }
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCalificacionesAdministrador.aspx");
        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");
        }
    }
}