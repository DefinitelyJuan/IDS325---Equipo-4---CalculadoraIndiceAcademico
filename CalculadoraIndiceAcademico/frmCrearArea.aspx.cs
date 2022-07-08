using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearArea : System.Web.UI.Page
    {
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblAreasAcademicasTableAdapter AreasAcademicas = new tblAreasAcademicasTableAdapter();
            if (validarCampos())
            {
                AreasAcademicas.ppInsertarAreaAcademica(txtNombre.Text);
                Response.Write("Área académica insertada");
            }
            else Response.Write("Error al insertar área académica.");
        }


        public bool validarCampos()
        {
            if (txtNombre.Text.Trim() == "")
                return false;
            else
                return true;
        }
    }
}