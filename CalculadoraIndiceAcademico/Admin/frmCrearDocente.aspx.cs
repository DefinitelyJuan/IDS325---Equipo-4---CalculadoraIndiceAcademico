using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculadoraIndiceAcademico
{
    public partial class frmCrearDocente : System.Web.UI.Page
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
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tblDocentesTableAdapter docentes = new tblDocentesTableAdapter();
            if (validarCampos())
            {
                try
                {
                    docentes.ppInsertarDocente(txtNombres.Text, txtApellidos.Text, txtCorreo.Text, GenerarClave(7));
                    Response.Write("<script>alert('Registro insertado correctamente');window.location = 'frmCrearDocente.aspx';</script>");
                }
                catch(Exception ex)
                {
                    Response.Write($"<script>alert({ex})</script>");
                }
            }
        }

        public string GenerarClave(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
                res.Append(valid[rnd.Next(valid.Length)]);
            return res.ToString();
        }

        public bool validarCampos()
        {
            if (txtNombres.Text == "" || txtApellidos.Text == "" || txtCorreo.Text == "")
                return false;
            else
                return true;
        }
    }
}