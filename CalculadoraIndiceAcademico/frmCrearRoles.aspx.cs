using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblRolesTableAdapter roles = new tblRolesTableAdapter();
            roles.Insert(txtRol.Text);
            Response.Write("<script>alert('Rol insertado satisfactoriamente.');window.location = 'frmCrearRoles.aspx';</script>");
        }
    }
}