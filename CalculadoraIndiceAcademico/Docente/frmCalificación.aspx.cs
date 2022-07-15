using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System.Text;
using System.Drawing;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCalificación : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["authRol"] != "2")
            {
                switch ((string)Session["authRol"])
                {
                    case "1":
                        Response.Redirect("../Estudiante/frmPerfilEstudiante.aspx");
                        break;
                    case "3":
                        Response.Redirect("../Admin/frmMantenimientoAdministrador.aspx");
                        break;
                    default:
                        Response.Redirect("../frmLogin.aspx");
                        break;
                }
            }
            if (!this.IsPostBack)
                ddlCodigo.DataBind();
            ppEstudiantesxDocenteTableAdapter ppEstudiantesxDocente = new ppEstudiantesxDocenteTableAdapter();
            userData data = (userData)Session["userData"];
            int idDocente= (int)Session["idDocente"];
            gridMantenimiento.DataSource = ppEstudiantesxDocente.GetData(idDocente, ddlCodigo.Text);
            gridMantenimiento.DataBind();
            if(!this.IsPostBack)
                gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");

            calificacionData calData = new calificacionData();


            calData.IDAsignatura = int.Parse(gridMantenimiento.Rows[0].Cells[1].Text);
            calData.IDEstudiante = int.Parse(gridMantenimiento.Rows[0].Cells[2].Text);
            calData.NombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.Rows[0].Cells[3].Text);
            calData.codigoAsignatura = gridMantenimiento.Rows[0].Cells[4].Text;
            calData.NombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.Rows[0].Cells[5].Text);
            calData.CalificacionNum = int.Parse(gridMantenimiento.Rows[0].Cells[6].Text);
            calData.CalificacionLiteral = gridMantenimiento.Rows[0].Cells[7].Text;
            Session["dataCalificacion"] = calData;


        }
        protected void Create(object sender, EventArgs e)
        {

        }
        protected void Update(object sender, EventArgs e)
        {          

        }
        protected void Delete(object sender, EventArgs e)
        {
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmPerfilDocente.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = gridMantenimiento.SelectedIndex;
            gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            calificacionData calData = new calificacionData();
            calData.IDAsignatura = int.Parse(gridMantenimiento.Rows[selectedIndex].Cells[1].Text);
            calData.IDEstudiante = int.Parse(gridMantenimiento.Rows[selectedIndex].Cells[2].Text);
            calData.NombreEstudiante = HttpUtility.HtmlDecode(gridMantenimiento.Rows[selectedIndex].Cells[3].Text);
            calData.codigoAsignatura = gridMantenimiento.Rows[selectedIndex].Cells[4].Text;
            calData.NombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.Rows[selectedIndex].Cells[5].Text);
            calData.CalificacionNum = int.Parse(gridMantenimiento.Rows[selectedIndex].Cells[6].Text);
            calData.CalificacionLiteral = gridMantenimiento.Rows[selectedIndex].Cells[7].Text;
            Session["dataCalificacion"] = calData;
        }

        protected void frmPopUp_Unload(object sender, EventArgs e)
        {
            //Response.Redirect("frmCalificación.aspx");
        }

        protected void ddlCodigo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ppEstudiantesxDocenteTableAdapter ppEstudiantesxDocente = new ppEstudiantesxDocenteTableAdapter();
            int idDocente = (int)Session["idDocente"];
            gridMantenimiento.DataSource = ppEstudiantesxDocente.GetData(idDocente, ddlCodigo.Text);
            gridMantenimiento.DataBind();
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["authRol"] = "0";
            Response.Redirect("../frmLogin.aspx");
        }
    }
}