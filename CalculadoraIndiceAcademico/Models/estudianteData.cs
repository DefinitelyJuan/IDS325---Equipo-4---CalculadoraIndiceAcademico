using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraIndiceAcademico.Models
{
    public class estudianteData
    {
        public int IdUsuario { get; set; }
        public string Contra { get; set; }
        public int IdEst { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public string Telefono { get; set; }
        public string Programa { get; set; }
    }
}