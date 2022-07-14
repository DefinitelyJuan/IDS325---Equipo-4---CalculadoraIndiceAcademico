using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmAsignaturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["authRol"] != "3")
            {
                switch ((string)Session["authRol"])
                {
                    case "1":
                        Response.Redirect("../Estudiante/frmPerfilEstudiante.aspx");
                        break;
                    case "2":
                        Response.Redirect("../Docente/frmPerfilDocente.aspx");
                        break;
                    default:
                        Response.Redirect("../frmLogin.aspx");
                        break;

                }
            }
            gridMantenimiento.DataBind();
            if (!this.IsPostBack)
            {
                gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            }
            Models.asignaturaData asignatura = new Models.asignaturaData();
            asignatura.idAsignatura = int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text);
            asignatura.codigoAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[2].Text);
            asignatura.nombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[3].Text);
            asignatura.numeroCreditos = byte.Parse(gridMantenimiento.SelectedRow.Cells[4].Text);
            asignatura.areaAcademica = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[5].Text);
            Session["dataAsignatura"] = asignatura;
        }
        protected void Create(object sender, EventArgs e)
        {
            //frmPopUp.Show();
        }
        protected void Update(object sender, EventArgs e)
        {
        }
        protected void Delete(object sender, EventArgs e)
        {
        }

        protected void lbtnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoUsuarios.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            frmPopUp.Hide();
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoAdministrador.aspx");
        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmReporteAdministrador.aspx");
        }

        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            Models.asignaturaData asignatura = new Models.asignaturaData();
            asignatura.idAsignatura = int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text);
            asignatura.codigoAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[2].Text);
            asignatura.nombreAsignatura = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[3].Text);
            asignatura.numeroCreditos = byte.Parse(gridMantenimiento.SelectedRow.Cells[4].Text);
            asignatura.areaAcademica = HttpUtility.HtmlDecode(gridMantenimiento.SelectedRow.Cells[5].Text);
            Session["dataAsignatura"] = asignatura;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            tblAsignaturasTableAdapter asignaturas = new tblAsignaturasTableAdapter();
            asignaturas.ppDesactivarAsignatura(int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text));
            Response.Write("<script>alert('Asignatura desactivada satisfactoriamente.');window.location = 'frmAsignaturasAdministrador.aspx';</script>");
        }

        protected void lbtnAsignarAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignarAsignatura.aspx");
        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");
        }
    }
}