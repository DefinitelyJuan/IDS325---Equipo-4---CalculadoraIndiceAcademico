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
            ppGetUserDataTableAdapter ppgetdata = new ppGetUserDataTableAdapter();
            DataTable ds = usuario.GetDataByLogin(txtUsuario.Text, txtContraseña.Text);
            string rol = ds.Rows[0][2].ToString();
            string id = ds.Rows[0][0].ToString();
            DataTable usrData = ppgetdata.GetData(int.Parse(rol), int.Parse(id));
            userData data = new userData();

            if (ds.Rows.Count == 1)
            {
                switch (rol)
                {
                    case "1":
                        data.IDUsuario = int.Parse(id);
                        data.IDEntidad = int.Parse(usrData.Rows[0][1].ToString());
                        data.Nombre = usrData.Rows[0][2].ToString();
                        data.Programa = usrData.Rows[0][3].ToString();
                        Session["userData"] = data;
                        Response.Redirect("/frmPerfilEstudiante.aspx");
                        break;
                    case "2":
                        data.IDUsuario = int.Parse(id);
                        data.IDEntidad = int.Parse(usrData.Rows[0][1].ToString());
                        data.Nombre = usrData.Rows[0][2].ToString();
                        Session["userData"] = data;
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