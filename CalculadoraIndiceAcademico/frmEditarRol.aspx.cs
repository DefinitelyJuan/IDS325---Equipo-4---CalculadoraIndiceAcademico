using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarRol : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                rolData data = (rolData)Session["rolData"];
                txtRol.Text = data.Nombre;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            rolData data = (rolData)Session["rolData"];
            tblRolesTableAdapter roles = new tblRolesTableAdapter();
            string rol = txtRol.Text;
            roles.ppEditarRol(data.IdRol, rol);
            Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarRol.aspx';</script>");
        }
    }
}