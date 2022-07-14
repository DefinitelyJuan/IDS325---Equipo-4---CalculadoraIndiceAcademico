using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CalculadoraIndiceAcademico.Models;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearCalificación : System.Web.UI.Page
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
            calificacionData data = (calificacionData)Session["dataCalificacion"];
            txtCodigo.Text = data.codigoAsignatura;
            txtEstudiante.Text = data.Nombre;
            txtIDEstudiante.Text = data.IDEstudiante.ToString();
            txtNombreAsignatura.Text = data.NombreAsignatura;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {            
            userData usrdata = (userData)Session["userData"];
            calificacionData data = (calificacionData)Session["dataCalificacion"];
            tblCalificacionesTableAdapter calificaciones = new tblCalificacionesTableAdapter();
            calificaciones.ppAsignarCalificacion(data.IDAsignatura, double.Parse(txtCalificacionNumerica.Text),int.Parse(txtIDEstudiante.Text),usrdata.IDEntidad);
            Response.Write("<script>alert('Calificación asignada satisfactoriamente.');window.location = 'frmCrearCalificación.aspx';</script>");
        }
    }
}