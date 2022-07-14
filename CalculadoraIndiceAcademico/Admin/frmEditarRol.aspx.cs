using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarRol : System.Web.UI.Page
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
                rolData data = (rolData)Session["rolData"];
                txtRol.Text = data.Nombre;
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
                    rolData data = (rolData)Session["rolData"];
                    tblRolesTableAdapter roles = new tblRolesTableAdapter();
                    string rol = txtRol.Text;
                    roles.ppEditarRol(data.IdRol, rol);
                    Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarRol.aspx';</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }
        }
    }
}