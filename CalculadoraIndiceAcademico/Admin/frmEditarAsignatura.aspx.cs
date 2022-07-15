using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarAsignatura : System.Web.UI.Page
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
                ddlArea.DataBind();
                Models.asignaturaData dataAsignatura = new Models.asignaturaData();
                dataAsignatura = (Models.asignaturaData)Session["dataAsignatura"];

                txtNombre.Text = dataAsignatura.nombreAsignatura;
                txtCodigo.Text = dataAsignatura.codigoAsignatura;
                txtID.Text = dataAsignatura.idAsignatura.ToString();
                txtCreditos.Text = dataAsignatura.numeroCreditos.ToString();
                ddlArea.SelectedItem.Text = dataAsignatura.areaAcademica.ToString();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos() == true)
            {
                try
                {
                    tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();
                    asignaturas.ppEditarAsignatura(int.Parse(txtID.Text), txtCodigo.Text, txtNombre.Text, byte.Parse(txtCreditos.Text), int.Parse(ddlArea.SelectedValue));
                    Response.Write("<script>alert('Asignatura editada satisfactoriamente.');window.location = 'frmEditarAsignatura.aspx';</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert({ex})</script>");
                }
            }
            else
                Response.Write("<script>alert('Complete todos los campos.');window.location = 'frmEditarAsignatura.aspx';</script>");
        }

        private bool ValidarCampos()
        {
            if (txtCodigo.Text.Trim() == "" || txtCreditos.Text.Trim() == "" || txtNombre.Text.Trim() == "" || int.Parse(txtCreditos.Text.Trim()) > 5)
                return false;
            else
                return true;
        }
    }
}