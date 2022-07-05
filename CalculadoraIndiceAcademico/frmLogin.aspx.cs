using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CalculadoraIndiceAcademico
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            tblUsuariosTableAdapter usuario = new tblUsuariosTableAdapter();
            DataTable ds = usuario.GetDataByLogin(txtUsuario.Text, txtContraseña.Text);
            
            
            userData data = new userData();
            data.ID = ds.Rows[0][0].ToString();
            data.Rol = ds.Rows[0][2].ToString();

            if (ds.Rows.Count == 1)
            {
                switch (ds.Rows[0][2].ToString())
                {
                    case "1":
                        Response.Redirect("/frmPerfilEstudiante.aspx");
                        break;
                    case "2":
                        break;
                    case "3":
                        Response.Redirect("/frmMantenimientoAdministrador.aspx");
                        break; 
                }
            }
            else
            {
                Response.Write("Inválido");
            }
        }
    }
}