using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmPerfilEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tblUsuariosTableAdapter estudiante = new tblUsuariosTableAdapter();
            userData data = (userData)Session["userData"];
            LabelID.Text = $"ID: {data.IDUsuario}";
            LabelNombre.Text = $"Nombre: {data.Nombre}";
            LabelPrograma.Text = $"Programa: {data.Programa}";
            LabelRol.Text = "Rol: Estudiante";
            DataTable materias = new DataTable();
            //estudiante.fillMaterias(materias); //Reemplazar con el pp que se cree
            gridMaterias.DataSource = materias;
            
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
            //Response.Redirect("frmEstudianteCalificaciones");
        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            //Response.Redirect("frmEstudianteGenerarIndice");
        }
    }
}