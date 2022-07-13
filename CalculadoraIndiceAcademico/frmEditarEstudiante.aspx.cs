using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                estudianteData estudiante = (estudianteData)Session["estudianteData"];
                txtNombres.Text = estudiante.Nombre;
                txtApellidos.Text = estudiante.Apellido;
                txtContra.Text = estudiante.Contra;
                txtID.Text = estudiante.IdEst.ToString();
                txtID.Enabled = false;
                txtNumeroTelefono.Text = estudiante.Telefono;
                txtCorreo.Text = estudiante.Correo;
                ddlProgramaEstudio.SelectedItem.Text = estudiante.Programa;
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            estudianteData estudiante = (estudianteData)Session["estudianteData"];
            tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
            estudiantes.ppEditarEstudiante(estudiante.IdUsuario,estudiante.IdEst, txtContra.Text, txtNombres.Text, txtApellidos.Text, txtCorreo.Text, txtNumeroTelefono.Text);
            Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarEstudiante.aspx';</script>");
        }
    }
}