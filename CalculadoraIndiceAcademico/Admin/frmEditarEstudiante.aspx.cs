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

        private bool ValidarCampos()
        {
            if (txtApellidos.Text.Trim() == "" || txtCorreo.Text.Trim() == "" || txtNombres.Text.Trim() == "" || txtNumeroTelefono.Text.Trim() == "")
                return false;
            else
                return true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos() == true)
                {
                    estudianteData estudiante = (estudianteData)Session["estudianteData"];
                    tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
                    if (txtContra.Text.Length > 0)
                    {
                        estudiantes.ppEditarEstudiante(estudiante.IdUsuario, estudiante.IdEst, txtContra.Text, txtNombres.Text, txtApellidos.Text, txtCorreo.Text, txtNumeroTelefono.Text);
                    }
                    else
                    {
                        estudiantes.ppEditarEstudiante(estudiante.IdUsuario, estudiante.IdEst, estudiante.Contra, txtNombres.Text, txtApellidos.Text, txtCorreo.Text, txtNumeroTelefono.Text);
                    }
                    Response.Write("<script>alert('Estudiante actualizado correctamente');window.location = 'frmEditarEstudiante.aspx';</script>");
                }
                else
                    Response.Write("<script>alert('Complete todos los campos.');window.location = 'frmEditarEstudiante.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }
        }
    }
}