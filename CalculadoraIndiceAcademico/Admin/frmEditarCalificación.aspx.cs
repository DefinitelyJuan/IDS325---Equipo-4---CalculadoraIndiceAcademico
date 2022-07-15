using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CalculadoraIndiceAcademico.Models;

namespace CalculadoraIndiceAcademico.Admin
{
    public partial class frmCalificación : System.Web.UI.Page
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
            if (!this.IsPostBack)
            {
                calificacionData calificacion = (calificacionData)Session["calAdminData"];
                ddlAsignatura.SelectedValue = calificacion.IDAsignatura.ToString();
                ddlDocente.SelectedValue = calificacion.IDDocente.ToString();
                ddlEstudiante.SelectedValue = calificacion.IDEstudiante.ToString();
                txtNombreAsignatura.Text = calificacion.NombreAsignatura;
                txtNombreDocente.Text = calificacion.NombreDocente;
                txtNombreEstudiante.Text = calificacion.NombreEstudiante;
            }
        }

        protected void ddlDocente_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
            txtNombreDocente.Text = (string)docentes.ppObtenerDocentexId(int.Parse(ddlDocente.SelectedValue));
        }

        protected void ddlAsignatura_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();
            txtNombreAsignatura.Text = (string)asignaturas.ppObtenerAsignaturaxID(int.Parse(ddlAsignatura.SelectedValue));
        }

        protected void ddlEstudiante_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
            txtNombreEstudiante.Text = (string)estudiantes.ppObtenerEstudiantexId(int.Parse(ddlEstudiante.SelectedValue));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                calificacionData calificacion = (calificacionData)Session["calAdminData"];
                tblCalificacionesTableAdapter calificaciones = new tblCalificacionesTableAdapter();
                calificaciones.ppEditarCalificacionAdmin(calificacion.IDAsignatura, calificacion.trimeste, calificacion.IDEstudiante, int.Parse(ddlAsignatura.SelectedValue), int.Parse(ddlEstudiante.SelectedValue), int.Parse(ddlDocente.SelectedValue));
                Response.Write("<script>alert('Registro editado correctamente');window.location = 'frmEditarCalificación.aspx';</script>");
            }
            catch
            {
                Response.Write("<script>alert('No es posile editar el registro, verifique los cambios');window.location = 'frmEditarCalificación.aspx';</script>");
            }
        }
    }
}