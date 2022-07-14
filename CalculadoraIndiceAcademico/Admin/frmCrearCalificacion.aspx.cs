using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico.Admin
{
    public partial class frmCrearCalificacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                ddlAsignatura.DataBind();
                ddlDocente.DataBind();
                ddlEstudiante.DataBind();
                tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
                tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();
                tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
                txtNombreAsignatura.Text = (string)asignaturas.ppObtenerAsignaturaxID(int.Parse(ddlAsignatura.SelectedValue));
                txtNombreEstudiante.Text = (string)estudiantes.ppObtenerEstudiantexId(int.Parse(ddlEstudiante.SelectedValue));
                txtNombreDocente.Text = (string)docentes.ppObtenerDocentexId(int.Parse(ddlDocente.SelectedValue));
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                tblCalificacionesTableAdapter calificaciones = new tblCalificacionesTableAdapter();
                calificaciones.ppAsignarAsignatura(int.Parse(ddlAsignatura.SelectedValue), int.Parse(ddlEstudiante.SelectedValue), int.Parse(ddlDocente.SelectedValue));
                Response.Write("<script>alert('Registro insertado correctamente');window.location = 'frmCrearCalificacion.aspx';</script>");
            }
            catch
            {
                Response.Write("<script>alert('Ya existe el registro que desea insertar');window.location = 'frmCrearCalificacion.aspx';</script>");
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
    }
}