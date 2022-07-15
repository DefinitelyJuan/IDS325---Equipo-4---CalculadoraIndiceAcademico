using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CalculadoraIndiceAcademico.dsSCIATableAdapters;
using System.Data;


namespace CalculadoraIndiceAcademico.Helpers
{
    public class Metodos
    {
        public string ConvertirCalificacionLiteral(int numerica)
        {
            if (numerica >= 90)
                return "A";
            else if (numerica >= 80)
                return "B";
            else if (numerica >= 70)
                return "C";
            else if (numerica >= 60)
                return "D";
            else
                return "F";
        }

        public string ObtenerAsignatura(int ID)
        {
            tblAsignaturasTableAdapter tblAsignaturas = new tblAsignaturasTableAdapter();
            string resultado;

            resultado = (string)tblAsignaturas.ppObtenerAsignaturaxID(ID);


            return resultado;
        }

        public int MostrarDocente()
        {
            ppMostrarUsuarioDocenteTableAdapter Docentes = new ppMostrarUsuarioDocenteTableAdapter();
            DataTable dt = new DataTable();
            dt = Docentes.GetData();
            if (dt.Rows.Count > 0)
                return 1;
            else
                return 0;

        }

        public int Login(string ID, string clave)
        {
            tblUsuariosTableAdapter tblUsuarios = new tblUsuariosTableAdapter();    
            DataTable Login = new DataTable();
            Login = tblUsuarios.GetDataByLogin(ID, clave);
            if (Login.Rows.Count > 0)
                return 1;
            else
                return 0;
                   
        }

        public string ObtenerEstudiante(int ID)
        {
            tblEstudiantesTableAdapter tblEstudiantes = new tblEstudiantesTableAdapter();
            string resultado;
            resultado = (string)tblEstudiantes.ppObtenerEstudiantexId(ID);
            return resultado;
        }

    }
}