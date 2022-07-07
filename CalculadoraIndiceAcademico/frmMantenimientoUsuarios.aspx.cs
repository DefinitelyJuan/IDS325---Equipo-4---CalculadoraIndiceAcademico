using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmMantemientoUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Create(object sender, EventArgs e)
        {
        }
        protected void Update(object sender, EventArgs e)
        {
            int selectedIndex = gridMantenimiento.SelectedIndex;
            string a = gridMantenimiento.Rows[0].Cells[1].Text;
            Response.Write($"<script>alert('{a}');window.location = 'frmMantenimientoUsuarios.aspx';</script>");


        }
        protected void Delete(object sender, EventArgs e)
        {
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoAdministrador.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void ddlTipoUsuario_TextChanged(object sender, EventArgs e)
        {
            string rol = ddlTipoUsuario.SelectedValue.ToString();
            switch(rol)
            {
                case "Estudiante":
                    iframe1.Src = "frmEstudiante.aspx";
                    break;
                case "Docente":
                    iframe1.Src = "frmCrearDocente.aspx";
                    break;
                case "Administrador":
                    iframe1.Src = "frmCrearAdministrador.aspx";
                    break;
            }
        }
    }
}