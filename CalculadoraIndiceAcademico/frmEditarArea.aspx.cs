using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmEditarArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                areaData area = (areaData)Session["areaData"];
                txtNombre.Text = area.Nombre;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblAreasAcademicasTableAdapter areas = new tblAreasAcademicasTableAdapter();
            areaData area = (areaData)Session["areaData"];
            int id = area.Id;
            areas.ppEditarArea(id, txtNombre.Text);
            Response.Write("<script>alert('Registro actualizado correctamente');window.location = 'frmEditarArea.aspx';</script>");
        }
    }
}