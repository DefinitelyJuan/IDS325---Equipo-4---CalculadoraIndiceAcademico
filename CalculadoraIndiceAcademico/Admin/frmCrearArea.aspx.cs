using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearArea : System.Web.UI.Page
    {
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                tblAreasAcademicasTableAdapter AreasAcademicas = new tblAreasAcademicasTableAdapter();
                if (validarCampos())
                {
                    AreasAcademicas.ppInsertarAreaAcademica(txtNombre.Text);
                    Response.Write("<script>alert('Área académica insertada satisfactoriamente.');window.location = 'frmCrearArea.aspx';</script>");
                }
                else Response.Write("Error al insertar área académica.");
            }
            catch(Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }
        }


        public bool validarCampos()
        {
            if (txtNombre.Text.Trim() == "")
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