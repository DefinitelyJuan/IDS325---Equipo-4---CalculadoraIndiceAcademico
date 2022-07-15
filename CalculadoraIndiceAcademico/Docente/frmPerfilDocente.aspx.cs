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
	public partial class frmPerfilDocente : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if ((string)Session["authRol"] != "2")
            {
                switch ((string)Session["authRol"])
                {
                    case "1":
                        Response.Redirect("../Estudiante/frmPerfilEstudiante.aspx");
                        break;
                    case "3":
                        Response.Redirect("../Admin/frmMantenimientoAdministrador.aspx");
                        break;
                    default:
                        Response.Redirect("../frmLogin.aspx");
                        break;
                }
            }
            ppMostrarAsignaturasDocenteTableAdapter asignaturasDoc = new ppMostrarAsignaturasDocenteTableAdapter();
            userData data = (userData)Session["userData"];
            LabelID.Text = $"ID: {data.IDUsuario}";
            LabelNombre.Text = $"Nombre: {data.Nombre}";
            LabelRol.Text = "Rol: Docente";
            
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
			Response.Redirect("frmCalificación.aspx");
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["authRol"] = "0";
            Response.Redirect("../frmLogin.aspx");
        }
    }
}