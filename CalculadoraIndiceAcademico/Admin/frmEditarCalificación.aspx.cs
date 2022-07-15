using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CalculadoraIndiceAcademico.Models;

namespace CalculadoraIndiceAcademico.Admin
{
    public partial class frmCalificación : System.Web.UI.Page
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
                calificacionData calificacion = (calificacionData)Session["calAdminData"];
                txtNombreAsignatura.Text = calificacion.NombreAsignatura;
                txtIdDocente.Text = calificacion.IDDocente.ToString();
                txtNombreDocente.Text = calificacion.NombreDocente;
                txtIdEstudiante.Text = calificacion.IDEstudiante.ToString();
                txtNombreEstudiante.Text = calificacion.NombreEstudiante;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                calificacionData calificacion = (calificacionData)Session["calAdminData"];
                string trimestre = calificacion.trimeste;
                string califLiteral = ConvertirCalificacionLiteral(int.Parse(txtCalificacion.Text));
                tblCalificacionesTableAdapter calificaciones = new tblCalificacionesTableAdapter();
                calificaciones.ppEditarCalificacionAdmin(calificacion.IDDocente, calificacion.IDAsignatura, calificacion.IDEstudiante, trimestre, int.Parse(txtCalificacion.Text), califLiteral);

                Response.Write("<script>alert('Registro editado correctamente');window.location = 'frmEditarCalificación.aspx';</script>");
            }
            catch
            {
                Response.Write("<script>alert('No es posile editar el registro, verifique los cambios');window.location = 'frmEditarCalificación.aspx';</script>");
            }
        }

        public string ConvertirCalificacionLiteral(int numerica)
        {
            if (numerica >= 90)
                return "A";
            else if (numerica >= 80)
                return "B";
            else if (numerica >= 70)
                return "C";
            else if (numerica >= 60)
                return "D";
            else
                return "F";
        }
    }
}