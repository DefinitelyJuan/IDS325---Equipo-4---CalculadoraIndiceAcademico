using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearPrograma : System.Web.UI.Page
    {
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblProgramasAcademicosTableAdapter ProgramaAcademico = new tblProgramasAcademicosTableAdapter();
            if (validarCampos())
            {
                ProgramaAcademico.ppInsertarPrograma(txtNombre.Text, txtVersion.Text, int.Parse(txtCreditos.Text));
                Response.Write("Programa académico insertado");
            }
            else Response.Write("Error al insertar programa académico.");
        }


        public bool validarCampos()
        {
            if (txtNombre.Text.Trim() == "" || txtVersion.Text.Trim() == "" || !(int.TryParse(txtCreditos.Text, out int i)) || txtCreditos.Text.Trim() == "")
                return false;
            else
                return true;
        }
    }
}