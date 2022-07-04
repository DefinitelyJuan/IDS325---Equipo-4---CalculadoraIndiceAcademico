using CalculadoraIndiceAcademico.dsSCIATableAdapters;
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
            if (ds.Rows.Count == 1)
            {
                switch (ds.Rows[0][2].ToString())
                {
                    case "1":
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