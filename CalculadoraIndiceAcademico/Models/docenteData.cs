using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraIndiceAcademico.Models
{
    public class docenteData
    {
        public int IdUsuario { get; set; }
        public int IdDocente { get; set; }  
        public string Contra { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
    }
}