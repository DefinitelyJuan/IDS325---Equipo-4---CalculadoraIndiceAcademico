using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarRol : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                rolData data = (rolData)Session["idRol"];
                txtRol.Text = data.Nombre.ToString();
            }
            catch (Exception)
            {
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            rolData data = (rolData)Session["idRol"];
            tblRolesTableAdapter roles = new tblRolesTableAdapter();
            roles.ppEditarRol(data.IdRol, txtRol.Text);
        }
    }
}