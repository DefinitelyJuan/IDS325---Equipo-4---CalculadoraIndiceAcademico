using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();
            if (validarCampos())
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
            else Response.Write("Error al insertar asignatura.");
        }


        public bool validarCampos()
        {
            if (txtNombre.Text == "" || txtSeccion.Text == "" || (txtClave.Text == "" || int.TryParse(txtClave.Text.ToString(), out int i)))
                return false;
            else
                return true;
        }
    }
}