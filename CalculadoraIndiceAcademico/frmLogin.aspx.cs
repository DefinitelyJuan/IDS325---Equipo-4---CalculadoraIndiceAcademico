using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using CalculadoraIndiceAcademico.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
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
            ppObtenerDataDocenteTableAdapter obtenerDataDoc = new ppObtenerDataDocenteTableAdapter();
            DataTable ds = usuario.GetDataByLogin(txtUsuario.Text, txtContraseña.Text);
            string rol = ds.Rows[0][2].ToString();
            string id = ds.Rows[0][0].ToString();
            Session["authRol"] = rol;
            if (ds.Rows.Count == 1)
            {
                switch (rol)
                {
                    case "1":
                        DataTable usrData = ppgetdata.GetData(int.Parse(rol), int.Parse(id));
                        userData data = new userData();
                        data.IDUsuario = int.Parse(id);
                        data.IDEntidad = int.Parse(usrData.Rows[0][1].ToString());
                        data.Nombre = usrData.Rows[0][2].ToString();
                        data.Programa = usrData.Rows[0][3].ToString();
                        Session["userData"] = data;
                        Session["idEstudiante"] = data.IDEntidad;
                        Response.Redirect("Estudiante/frmPerfilEstudiante.aspx");
                        break;
                    case "2":
                        DataTable docData = obtenerDataDoc.GetData(int.Parse(id));
                        userData uData = new userData();
                        uData.IDUsuario = int.Parse(id);
                        uData.IDEntidad = int.Parse(docData.Rows[0][1].ToString());
                        uData.Nombre = docData.Rows[0][2].ToString();
                        Session["userData"] = uData;
                        Session["idDocente"] = uData.IDEntidad;
                        Response.Redirect("Docente/frmPerfilDocente.aspx");

                        break;
                    case "3":
                        Response.Redirect("Admin/frmMantenimientoAdministrador.aspx");
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