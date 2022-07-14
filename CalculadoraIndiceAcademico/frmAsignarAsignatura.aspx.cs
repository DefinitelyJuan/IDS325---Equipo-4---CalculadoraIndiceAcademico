using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmAsignarAsignatura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridMantenimiento.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoAdministrador.aspx");
        }

        protected void lbtnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoUsuarios.aspx");

        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");

        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmReporteAdministrador.aspx");
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbtnAsignarAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignarAsignatura.aspx");

        }
    }
}