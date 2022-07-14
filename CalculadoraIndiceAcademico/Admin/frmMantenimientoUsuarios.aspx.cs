using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using CalculadoraIndiceAcademico.Models;

namespace CalculadoraIndiceAcademico
{
    public partial class frmMantemientoUsuarios : System.Web.UI.Page
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
            ddlTipoUsuario.DataBind();
            string rol = ddlTipoUsuario.SelectedValue.ToString();
            switch (rol)
            {
                case "Estudiante":
                    gridMantenimientoEst.DataBind();
                    iframe1.Src = "frmEstudiante.aspx";
                    gridMantenimientoDoc.Visible = false;
                    gridMantenimientoEst.Visible = true;
                    gridMantenimientoAdmin.Visible = false;
                    btnCreate.Disabled = false;
                    btnDelete.Enabled = true;
                    btnUpdate.Disabled = false;

                    estudianteData estudiante = new estudianteData();
                    int selectedIndex = gridMantenimientoEst.SelectedIndex;

                    estudiante.IdUsuario = int.Parse(gridMantenimientoEst.Rows[selectedIndex].Cells[1].Text);
                    estudiante.Contra = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[2].Text);
                    estudiante.IdEst = int.Parse(gridMantenimientoEst.Rows[selectedIndex].Cells[3].Text);
                    estudiante.Nombre = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[4].Text);
                    estudiante.Apellido = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[5].Text);
                    estudiante.Correo = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[6].Text);
                    estudiante.Telefono = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[7].Text);
                    estudiante.Programa = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[8].Text);
                    Session["estudianteData"] = estudiante;

                    break;
                case "Docente":
                    gridMantenimientoDoc.DataBind();
                    iframe1.Src = "frmCrearDocente.aspx";
                    iframe2.Src = "frmEditarDocente.aspx";
                    gridMantenimientoDoc.Visible = true;
                    gridMantenimientoEst.Visible = false;
                    gridMantenimientoAdmin.Visible = false;
                    btnCreate.Disabled = false;
                    btnDelete.Enabled = true;
                    btnUpdate.Disabled = false;

                    docenteData docente = new docenteData();
                    selectedIndex = gridMantenimientoDoc.SelectedIndex;

                    docente.IdUsuario = int.Parse(gridMantenimientoDoc.Rows[selectedIndex].Cells[1].Text);
                    docente.Contra = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[2].Text);
                    docente.IdDocente = int.Parse(gridMantenimientoDoc.Rows[selectedIndex].Cells[3].Text);
                    docente.Nombre = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[4].Text);
                    docente.Apellido = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[5].Text);
                    docente.Correo = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[6].Text);

                    Session["docenteData"] = docente;
                    break;
                case "Administrador":
                    gridMantenimientoAdmin.DataBind();
                    iframe1.Src = "frmCrearAdministrador.aspx";
                    gridMantenimientoDoc.Visible = false;
                    gridMantenimientoEst.Visible = false;
                    gridMantenimientoAdmin.Visible = true;
                    btnCreate.Disabled = true;
                    btnDelete.Enabled = false;
                    btnUpdate.Disabled = true;
                    break;
            }
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
                    iframe2.Src = "frmEditarEstudiante.aspx";
                    gridMantenimientoDoc.Visible = false;
                    gridMantenimientoEst.Visible = true;
                    gridMantenimientoAdmin.Visible = false;
                    btnCreate.Disabled = false;
                    btnDelete.Enabled = true;
                    btnUpdate.Disabled = false;
                    break;
                case "Docente":
                    iframe1.Src = "frmCrearDocente.aspx";
                    iframe2.Src = "frmEditarEstudiante.aspx";
                    gridMantenimientoDoc.Visible = true;
                    gridMantenimientoEst.Visible = false;
                    gridMantenimientoAdmin.Visible = false;
                    btnCreate.Disabled = false;
                    btnDelete.Enabled = true;
                    btnUpdate.Disabled = false;
                    break;
                case "Administrador":
                    iframe1.Src = "frmCrearAdministrador.aspx";
                    iframe2.Src = "";
                    gridMantenimientoDoc.Visible = false;
                    gridMantenimientoEst.Visible = false;
                    gridMantenimientoAdmin.Visible = true;
                    btnCreate.Disabled = true;
                    btnDelete.Enabled = false;
                    btnUpdate.Disabled = true;
                    break;
            }
        }

        protected void lbtnCalificaciones_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmCalificacionAdministrador.aspx");
        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");
        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmReporteAdministrador.aspx");
        }

        protected void gridMantenimientoEst_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimientoEst.SelectedRow.BackColor = Color.FromName("#fcfcd4");

            estudianteData estudiante = new estudianteData();
            int selectedIndex = gridMantenimientoEst.SelectedIndex;

            estudiante.IdUsuario = int.Parse(gridMantenimientoEst.Rows[selectedIndex].Cells[1].Text);
            estudiante.Contra = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[2].Text);
            estudiante.IdEst = int.Parse(gridMantenimientoEst.Rows[selectedIndex].Cells[3].Text);
            estudiante.Nombre = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[4].Text);
            estudiante.Apellido = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[5].Text);
            estudiante.Correo = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[6].Text);
            estudiante.Telefono = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[7].Text);
            estudiante.Programa = HttpUtility.HtmlDecode(gridMantenimientoEst.Rows[selectedIndex].Cells[8].Text);
            Session["estudianteData"] = estudiante;
        }

        protected void gridMantenimientoDoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimientoDoc.SelectedRow.BackColor = Color.FromName("#fcfcd4");

            docenteData docente = new docenteData();
            int selectedIndex = gridMantenimientoDoc.SelectedIndex;
            docente.IdUsuario = int.Parse(gridMantenimientoDoc.Rows[selectedIndex].Cells[1].Text);
            docente.Contra = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[2].Text);
            docente.IdDocente = int.Parse(gridMantenimientoDoc.Rows[selectedIndex].Cells[3].Text);
            docente.Nombre = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[4].Text);
            docente.Apellido = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[5].Text);
            docente.Correo = HttpUtility.HtmlDecode(gridMantenimientoDoc.Rows[selectedIndex].Cells[6].Text);
            Session["docenteData"] = docente;
        }

        protected void gridMantenimientoAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimientoAdmin.SelectedRow.BackColor = Color.FromName("#fcfcd4");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string rol = ddlTipoUsuario.SelectedValue.ToString();
            switch (rol)
            {
                case "Estudiante":
                    if (gridMantenimientoEst.SelectedIndex != -1)
                    {
                        tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
                        estudiantes.ppDesactivarEst(int.Parse(gridMantenimientoEst.SelectedRow.Cells[3].Text), int.Parse(gridMantenimientoEst.SelectedRow.Cells[1].Text));
                        Response.Write("<script>alert('Estudiante desactivado satisfactoriamente.');window.location = 'frmMantenimientoUsuarios.aspx';</script>");
                    }
                    else
                        Response.Write("<script>alert('Para eliminar un estudiante, seleccione una fila primero.');window.location = 'frmMantenimientoUsuarios.aspx';</script>");
                    break;

                case "Docente":
                    if (gridMantenimientoDoc.SelectedIndex != -1)
                    {
                        tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
                        docentes.ppDesactivarDoc(int.Parse(gridMantenimientoDoc.SelectedRow.Cells[3].Text), int.Parse(gridMantenimientoDoc.SelectedRow.Cells[1].Text));
                        Response.Write("<script>alert('Docente desactivado satisfactoriamente.');window.location = 'frmMantenimientoUsuarios.aspx';</script>");
                    }
                    else
                        Response.Write("<script>alert('Para eliminar un docente, seleccione una fila primero.');window.location = 'frmMantenimientoUsuarios.aspx';</script>");
                    break;
                default:
                    break;
            }
        }

        protected void lbtnAsignarAsignatura_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignarAsignatura.aspx");
        }
    }
}