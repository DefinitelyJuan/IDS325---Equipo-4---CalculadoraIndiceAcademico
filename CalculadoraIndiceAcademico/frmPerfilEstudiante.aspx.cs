using System;
using System.Collections.Generic;
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
            LabelID.Text = LabelID.Text + "userfromDB"; //y asi sucesivamente
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