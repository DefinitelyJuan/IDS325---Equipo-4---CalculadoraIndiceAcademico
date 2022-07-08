using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmMantenimientoAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    gridMantenimientoArea.Visible = false;
                    gridMantenimientoPrograma.Visible = false;
                    gridMantenimiento.Visible = true;

                    break;
                case "Programa Académico":
                    iframe1.Src = "frmCrearPrograma.aspx";
                    gridMantenimientoArea.Visible = false;
                    gridMantenimientoPrograma.Visible = true;
                    gridMantenimiento.Visible = false;
                    break;
                case "Area Académica":
                    iframe1.Src = "frmCrearArea.aspx";
                    gridMantenimientoArea.Visible = true;
                    gridMantenimientoPrograma.Visible = false;
                    gridMantenimiento.Visible = false;

                    break;
            }
        }

    }
}