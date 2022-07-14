using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace CalculadoraIndiceAcademico
{
    public partial class frmReporteAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ppMostrarCalificacionesAdminTableAdapter adapterAdmin = new ppMostrarCalificacionesAdminTableAdapter();
            if (!this.IsPostBack)
            {
                DataTable dtAdmin = adapterAdmin.GetData(int.Parse(ddlTipoRank.SelectedValue));
                ReportDataSource dataSource = new ReportDataSource("dsReporteAdministrador", dtAdmin);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(dataSource);
                ReportViewer1.LocalReport.Refresh();
            }
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

        protected void ddlTipoRank_SelectedIndexChanged(object sender, EventArgs e)
        {
            ppMostrarCalificacionesAdminTableAdapter adapterAdmin = new ppMostrarCalificacionesAdminTableAdapter();
            DataTable dtAdmin = adapterAdmin.GetData(int.Parse(ddlTipoRank.SelectedValue));
            ReportDataSource dataSource = new ReportDataSource("dsReporteAdministrador", dtAdmin);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSource);
            ReportViewer1.LocalReport.Refresh();
        }

        protected void lbtnAsignarAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignarAsignatura.aspx");
        }
    }
}