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
    public partial class frmEditarPrograma : System.Web.UI.Page
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
                programaData data = (programaData)Session["programaData"];
                txtNombre.Text = data.Nombre;
                txtCreditos.Text = data.Creditos.ToString();
                txtVersion.Text = data.version;
            }
        }

        private bool ValidarCampos()
        {
            if (txtNombre.Text.Trim() == "" || txtVersion.Text.Trim() == "" || txtCreditos.Text.Trim() == "" || int.Parse(txtCreditos.Text.Trim()) > 425)
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
                    programaData programa = (programaData)Session["programaData"];
                    tblProgramasAcademicosTableAdapter programas = new tblProgramasAcademicosTableAdapter();
                    programas.ppEditarPrograma(programa.Id, txtNombre.Text, txtVersion.Text, int.Parse(txtCreditos.Text));
                    Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarPrograma.aspx';</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert({ex})</script>");
            }

        }
    }
}