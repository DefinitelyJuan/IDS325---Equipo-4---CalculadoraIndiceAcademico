using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearPrograma : System.Web.UI.Page
    {
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblProgramasAcademicosTableAdapter ProgramaAcademico = new tblProgramasAcademicosTableAdapter();
            if (validarCampos())
            {
                ProgramaAcademico.ppInsertarPrograma(txtNombre.Text, txtVersion.Text, int.Parse(txtCreditos.Text));
                Response.Write("<script>alert('Programa académico insertado satisfactoriamente.');window.location = 'frmCrearPrograma.aspx';</script>");
            }
            else Response.Write("Error al insertar programa académico.");
        }


        public bool validarCampos()
        {
            if (txtNombre.Text.Trim() == "" || txtVersion.Text.Trim() == "" || !(int.TryParse(txtCreditos.Text, out int i)) || txtCreditos.Text.Trim() == "")
                return false;
            else
                return true;
        }

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
    }
}