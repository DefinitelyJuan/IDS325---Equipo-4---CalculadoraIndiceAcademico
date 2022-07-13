using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Drawing;
using System.Web;

namespace CalculadoraIndiceAcademico
{
    public partial class frmMantenimientoAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ddlTipoMantenimiento.DataBind();
                string tipoMantenimiento = ddlTipoMantenimiento.SelectedValue.ToString();
                switch (tipoMantenimiento)
                {
                    case "Roles":
                        gridMantenimiento.DataBind();
                        iframe1.Src = "frmCrearRoles.aspx";
                        gridMantenimientoArea.Visible = false;
                        gridMantenimientoPrograma.Visible = false;
                        gridMantenimiento.Visible = true;

                        int SelectedIndex = gridMantenimiento.SelectedIndex;
                        rolData rol = new rolData();
                        rol.IdRol = int.Parse(gridMantenimiento.Rows[SelectedIndex].Cells[1].Text);
                        rol.Nombre = HttpUtility.HtmlDecode(gridMantenimiento.Rows[SelectedIndex].Cells[2].Text);
                        Session["rolData"] = rol;
                        break;


                    case "Programa Académico":
                        gridMantenimientoPrograma.DataBind();
                        iframe1.Src = "frmCrearPrograma.aspx";
                        gridMantenimientoArea.Visible = false;
                        gridMantenimientoPrograma.Visible = true;
                        gridMantenimiento.Visible = false;
                        break;
                    case "Area Académica":
                        gridMantenimientoArea.DataBind();
                        iframe1.Src = "frmCrearArea.aspx";
                        gridMantenimientoArea.Visible = true;
                        gridMantenimientoPrograma.Visible = false;
                        gridMantenimiento.Visible = false;

                        break;
                }
            }
        }
        protected void Create(object sender, EventArgs e)
        {
            //frmPopUp.Show();
        }

        protected void lbtnMantenimiento_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMantenimientoUsuarios.aspx");
        }

        protected void lbtnAsignaturas_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmAsignaturasAdministrador.aspx");
        }

        protected void ddlTipoMantenimiento_TextChanged(object sender, EventArgs e)
        {
            string tipoMantenimiento = ddlTipoMantenimiento.SelectedValue.ToString();
            switch (tipoMantenimiento)
            {
                case "Roles":
                    iframe1.Src = "frmCrearRoles.aspx";
                    iframe2.Src = "frmEditarRol.aspx";
                    gridMantenimientoArea.Visible = false;
                    gridMantenimientoPrograma.Visible = false;
                    gridMantenimiento.Visible = true;

                    break;
                case "Programa Académico":
                    iframe1.Src = "frmCrearPrograma.aspx";
                    //iframe2.Src = "frmEditarPrograma.aspx";
                    gridMantenimientoArea.Visible = false;
                    gridMantenimientoPrograma.Visible = true;
                    gridMantenimiento.Visible = false;
                    break;
                case "Area Académica":
                    iframe1.Src = "frmCrearArea.aspx";
                    //iframe2.Src = "frmEditarArea.aspx";
                    gridMantenimientoArea.Visible = true;
                    gridMantenimientoPrograma.Visible = false;
                    gridMantenimiento.Visible = false;
                    break;
            }
        }

        protected void lbtnCerrarSesion_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnGenerarIndice_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmReporteAdministrador.aspx");
        }

        protected void gridMantenimiento_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimiento.SelectedRow.BackColor = Color.FromName("#fcfcd4");
            rolData rol = new rolData();

            int SelectedIndex = gridMantenimiento.SelectedIndex;
            rol.IdRol = int.Parse(gridMantenimiento.Rows[SelectedIndex].Cells[1].Text);
            rol.Nombre = HttpUtility.HtmlDecode(gridMantenimiento.Rows[SelectedIndex].Cells[2].Text);
            Session["rolData"] = rol;
        }

        protected void gridMantenimientoPrograma_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimientoPrograma.SelectedRow.BackColor = Color.FromName("#fcfcd4");
        }

        protected void gridMantenimientoArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridMantenimientoArea.SelectedRow.BackColor = Color.FromName("#fcfcd4");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string tipoMantenimiento = ddlTipoMantenimiento.SelectedValue.ToString();
            if (tipoMantenimiento == "Roles")
            {
                if (gridMantenimiento.SelectedIndex != -1)
                {
                    tblRolesTableAdapter roles = new tblRolesTableAdapter();
                    roles.ppDesactivarRol(int.Parse(gridMantenimiento.SelectedRow.Cells[1].Text));
                    Response.Write("<script>alert('Rol desactivado satisfactoriamente.');window.location = 'frmMantenimientoAdministrador.aspx';</script>");
                }
                else
                    Response.Write("<script>alert('Para eliminar un rol, seleccione una fila primero.');window.location = 'frmMantenimientoAdministrador.aspx';</script>");
            }
            else if (tipoMantenimiento == "Area Académica")
            {
                if (gridMantenimientoArea.SelectedIndex != -1)
                {
                    tblAreasAcademicasTableAdapter areas = new tblAreasAcademicasTableAdapter();
                    areas.ppDesactivarArea(int.Parse(gridMantenimientoArea.SelectedRow.Cells[1].Text));
                    Response.Write("<script>alert('Área desactivado satisfactoriamente.');window.location = 'frmMantenimientoAdministrador.aspx';</script>");
                }
                else
                    Response.Write("<script>alert('Para eliminar el área, seleccione una fila primero.');window.location = 'frmMantenimientoAdministrador.aspx';</script>");

            }
        }
    }
}