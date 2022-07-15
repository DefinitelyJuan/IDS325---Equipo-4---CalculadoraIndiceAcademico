using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearAsignatura : System.Web.UI.Page
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

        private bool ValidarCampos()
        {
            if (txtClave.Text.Trim() == "" || txtCreditos.Text.Trim() == "" || txtNombre.Text.Trim() == "" || txtSeccion.Text.Trim() == "" || int.Parse(txtCreditos.Text.Trim()) > 5)
                return false;
            else
                return true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();

            if (ValidarCampos() == true)
            {
                try
                {
                    asignaturas.ppInsertarAsignatura(txtClave.Text, int.Parse(ddlArea.SelectedValue.ToString()), txtNombre.Text, byte.Parse(txtCreditos.Text));
                    Response.Write("<script>alert('Asignatura insertada satisfactoriamente.');window.location = 'frmCrearAsignatura.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert({ex})</script>");
                }
            }
            else
                Response.Write("<script>alert('Complete todos los campos.');window.location = 'frmCrearAsignatura.aspx';</script>");
        }

    }
}