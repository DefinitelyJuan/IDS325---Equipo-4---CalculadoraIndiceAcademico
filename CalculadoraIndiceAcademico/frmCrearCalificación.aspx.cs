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

                calificacionData data = (calificacionData)Session["dataCalificacion"];
                txtCodigo.Text = data.codigoAsignatura;
                txtEstudiante.Text = data.Nombre;
                txtIDEstudiante.Text = data.IDEstudiante.ToString();
                txtNombreAsignatura.Text = data.NombreAsignatura;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            calificacionData data = (calificacionData)Session["dataCalificacion"];
            tblCalificacionesTableAdapter calificaciones = new tblCalificacionesTableAdapter();
            calificaciones.ppAsignarCalificacion(data.IDAsignatura, double.Parse(txtCalificacionNumerica.Text),int.Parse(txtIDEstudiante.Text));
            Response.Redirect("frmCalificación.aspx");
        }
    }
}