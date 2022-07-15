using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearAsignaturaDocente : System.Web.UI.Page
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
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos() == true)
            {
                try
                {
                    tblDocentes_AsignaturasTableAdapter tblDocentes_Asignaturas = new tblDocentes_AsignaturasTableAdapter();
                    tblDocentes_Asignaturas.Insert(int.Parse(ddlAsignaturas.SelectedValue), int.Parse(ddlProfesor.SelectedValue));
                    Response.Write("<script>alert('Registro insertado correctamente');window.location = 'frmCrearAsignaturaDocente.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert({ex})</script>");
                }
            }
            else
                Response.Write("<script>alert('Complete todos los campos.');window.location = 'frmCrearAsignaturaDocente.aspx';</script>");
        }

        protected void ddlProfesor_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
            string resultado = (string)docentes.ppObtenerDocentexId(int.Parse(ddlProfesor.SelectedValue));
            txtNombreDocente.Text = resultado;
        }

        private bool ValidarCampos()
        {
            if (txtNombreDocente.Text.Trim() == "")
                return false;
            else
                return true;
        }
    }
}