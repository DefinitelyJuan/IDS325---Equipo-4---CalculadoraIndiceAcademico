using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CalculadoraIndiceAcademico
{
    public partial class frmEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombres = txtNombres.Text;
            string apellidos = txtApellidos.Text;
            string correo = txtCorreo.Text;
            string telefono = txtNumeroTelefono.Text;
            string programa = ddlProgramaEstudio.Text;
            tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();

        }
    }
}