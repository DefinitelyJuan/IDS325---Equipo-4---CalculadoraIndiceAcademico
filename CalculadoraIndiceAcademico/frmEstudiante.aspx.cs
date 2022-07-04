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
    public partial class frmEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombres = txtNombres.Text;
            string apellidos = txtApellidos.Text;
            string correo = txtCorreo.Text;
            string telefono = txtNumeroTelefono.Text;
            int programa = int.Parse(ddlProgramaEstudio.SelectedValue);
            tblEstudiantesTableAdapter estudiantes = new tblEstudiantesTableAdapter();
            if(validarCampos())
            {
                estudiantes.ppCrearEstudiante(nombres, apellidos, correo, programa, GenerarClave(7), telefono);
                Response.Write("Usuario Creado");
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
            if (txtNombres.Text == "" || txtApellidos.Text == "" || txtCorreo.Text == "" || txtNumeroTelefono.Text == "")
                return false;
            else
                return true;
        }
    }
}