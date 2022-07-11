using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CalculadoraIndiceAcademico
{
    public partial class frmReporteEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ppObtenerProgramaEstudianteTableAdapter programasEst = new ppObtenerProgramaEstudianteTableAdapter();
            if (ddlTipoIndice.SelectedItem.ToString() == "General")
                ddlTrimestre.Visible = false;

            userData data = (userData)Session["userData"];
            DataTable dt = programasEst.GetData((int)Session["idEstudiante"]);
            ddlPrograma.DataSource = dt;
            ddlPrograma.DataBind();
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPerfilEstudiante.aspx");
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
        }

        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlTipoIndice_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTipoIndice.SelectedItem.ToString() == "Trimestral")
            {
                ddlTrimestre.Visible = true;

            }
        }
    }
}