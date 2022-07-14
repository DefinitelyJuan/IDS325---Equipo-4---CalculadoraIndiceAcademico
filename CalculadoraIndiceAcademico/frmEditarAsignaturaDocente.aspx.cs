using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarAsignaturaDocente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ddlAsignaturas.DataBind();
                ddlProfesor.DataBind();
                tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
                Models.asignaturaDocData aDocData = new Models.asignaturaDocData();
                aDocData = (Models.asignaturaDocData)Session["AsigDocData"];
                ddlAsignaturas.SelectedValue = aDocData.IDAsignatura.ToString();
                ddlProfesor.SelectedValue = aDocData.IDDocente.ToString();
                string resultado = (string)docentes.ppObtenerDocentexId(int.Parse(ddlProfesor.SelectedValue));
                txtNombreDocente.Text = resultado;
            }


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Models.asignaturaDocData aDocData = new Models.asignaturaDocData();
            aDocData = (Models.asignaturaDocData)Session["AsigDocData"];
            tblDocentes_AsignaturasTableAdapter tblDocentes_Asignaturas = new tblDocentes_AsignaturasTableAdapter();
            tblDocentes_Asignaturas.Update(int.Parse(ddlAsignaturas.SelectedValue), int.Parse(ddlProfesor.SelectedValue),aDocData.IDAsignatura,aDocData.IDDocente);
            Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmCrearAsignaturaDocente.aspx';</script>");
        }

        protected void ddlProfesor_SelectedIndexChanged(object sender, EventArgs e)
        {
            tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
            string resultado = (string)docentes.ppObtenerDocentexId(int.Parse(ddlProfesor.SelectedValue));
            txtNombreDocente.Text = resultado;
        }
    }
}