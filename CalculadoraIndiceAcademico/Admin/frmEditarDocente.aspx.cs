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
    public partial class frmEditarDocente : System.Web.UI.Page
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
                docenteData docente = (docenteData)Session["docenteData"];
                txtNombres.Text = docente.Nombre;
                txtContra.Text = docente.Contra;
                txtCorreo.Text = docente.Correo;
                txtApellidos.Text = docente.Apellido;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
                docenteData docente = (docenteData)Session["docenteData"];
                if(txtContra.Text.Length > 0)
                {
                    docentes.ppEditarDocente(docente.IdUsuario, docente.IdDocente, txtContra.Text, txtNombres.Text, txtApellidos.Text, txtCorreo.Text);
                }
                else
                {
                    docentes.ppEditarDocente(docente.IdUsuario, docente.IdDocente, docente.Contra, txtNombres.Text, txtApellidos.Text, txtCorreo.Text);
                }
                Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarDocente.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }

        }
    }
}