using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearRoles : System.Web.UI.Page
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
            if (txtRol.Text.Trim() == "")
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
                    tblRolesTableAdapter roles = new tblRolesTableAdapter();
                    roles.Insert(txtRol.Text);
                    Response.Write("<script>alert('Rol insertado satisfactoriamente.');window.location = 'frmCrearRoles.aspx';</script>");
                }
                else
                    Response.Write("<script>alert('Complete todos los campos.');window.location = 'frmCrearRoles.aspx';</script>");
            }
            catch(Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }
        }
    }
}