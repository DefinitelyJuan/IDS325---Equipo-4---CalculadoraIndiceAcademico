using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico.Admin
{
    public partial class frmCalificacionAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["authRol"] != "3")
            {
                switch ((string)Session["authRol"])
                {
                    case "1":
                        Response.Redirect("../Estudiante/frmPerfilEstudiante.aspx");
                        break;
                    case "2":
                        Response.Redirect("../Docente/frmPerfilDocente.aspx");
                        break;
                    default:
                        Response.Redirect("../frmLogin.aspx");
                        break;

                }
            }
            gridMantenimiento.DataBind();
            if (!this.IsPostBack)
            {
                ddlAsignaturas.DataBind();
                gridMantenimiento.DataBind();
                gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            }
            gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            calificacionData calData = new calificacionData();
            calData.IDAsignatura = int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text);
            calData.NombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[2].Text);
            calData.codigoAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[3].Text);
            calData.IDDocente = int.Parse(gridMantenimiento.SelectedRow.Cells[4].Text);
            calData.NombreDocente = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[5].Text);
            calData.NombreEstudiante = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[6].Text);
            calData.IDEstudiante = int.Parse(gridMantenimiento.SelectedRow.Cells[7].Text);
            calData.trimeste = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[8].Text);
            Session["calAdminData"] = calData;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoAdministrador.aspx");
        }

        protected void lbtnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoUsuarios.aspx");

        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");

        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmReporteAdministrador.aspx");
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {

        }


        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            calificacionData calData = new calificacionData();
            calData.IDAsignatura = int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text);
            calData.NombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[2].Text);
            calData.codigoAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[3].Text);
            calData.IDDocente = int.Parse(gridMantenimiento.SelectedRow.Cells[4].Text);
            calData.NombreDocente = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[5].Text);
            calData.NombreEstudiante = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[6].Text);
            calData.IDEstudiante = int.Parse(gridMantenimiento.SelectedRow.Cells[7].Text);
            calData.trimeste = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[8].Text);
            Session["calAdminData"] = calData;
        }

        protected void lbtnAsignarAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignarAsignatura.aspx");

        }

        protected void ddlAsignaturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimiento.DataBind();
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCalificacionAdministrador.aspx");
        }
    }
}