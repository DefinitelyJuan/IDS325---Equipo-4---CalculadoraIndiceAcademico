﻿using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
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
    public partial class frmReporteEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["authRol"] != "1")
            {
                switch ((string)Session["authRol"])
                {
                    case "2":
                        Response.Redirect("../Docente/frmPerfilDocente.aspx");
                        break;
                    case "3":
                        Response.Redirect("../Admin/frmMantenimientoAdministrador.aspx");
                        break;
                    default:
                        Response.Redirect("../frmLogin.aspx");
                        break;
                }
            }
            ppGenerarIndiceEstudianteTableAdapter reporteEst = new ppGenerarIndiceEstudianteTableAdapter();
            ppObtenerProgramaEstudianteTableAdapter programasEst = new ppObtenerProgramaEstudianteTableAdapter();
            if (ddlTipoIndice.SelectedItem.ToString() == "General")
                ddlTrimestre.Visible = false;

            userData data = (userData)Session["userData"];
            DataTable dt = programasEst.GetData((int)Session["idEstudiante"]);
            ddlPrograma.DataSource = dt;
            ddlPrograma.DataBind();

            if(!this.IsPostBack)
            {
                DataTable dtReporte = reporteEst.GetData(ddlTipoIndice.SelectedItem.Text, (int)Session["idEstudiante"], " ");
                ReportDataSource dataSource = new ReportDataSource("dsReporteEstudiante", dtReporte);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(dataSource);
                ReportViewer1.LocalReport.Refresh();
            }
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
                ddlTrimestre.DataBind();
                ppGenerarIndiceEstudianteTableAdapter reporteEst = new ppGenerarIndiceEstudianteTableAdapter();
                DataTable dtReporte = reporteEst.GetData(ddlTipoIndice.SelectedItem.Text, (int)Session["idEstudiante"], ddlTrimestre.SelectedItem.Text);
                ReportDataSource dataSource = new ReportDataSource("dsReporteEstudiante", dtReporte);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(dataSource);
                ReportViewer1.LocalReport.Refresh(); 
            }
            else if (ddlTipoIndice.SelectedItem.ToString() == "General")
            {
                ddlTrimestre.Visible = false;
                ddlTrimestre.DataBind();
                ppGenerarIndiceEstudianteTableAdapter reporteEst = new ppGenerarIndiceEstudianteTableAdapter();
                DataTable dtReporte = reporteEst.GetData(ddlTipoIndice.SelectedItem.Text, (int)Session["idEstudiante"], " ");
                ReportDataSource dataSource = new ReportDataSource("dsReporteEstudiante", dtReporte);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(dataSource);
                ReportViewer1.LocalReport.Refresh();
            }
        }

        protected void ddlTrimestre_SelectedIndexChanged(object sender, EventArgs e)
        {
            ppGenerarIndiceEstudianteTableAdapter reporteEst = new ppGenerarIndiceEstudianteTableAdapter();
            DataTable dtReporte = reporteEst.GetData(ddlTipoIndice.SelectedItem.Text, (int)Session["idEstudiante"], ddlTrimestre.SelectedItem.Text);
            ReportDataSource dataSource = new ReportDataSource("dsReporteEstudiante", dtReporte);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(dataSource);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}