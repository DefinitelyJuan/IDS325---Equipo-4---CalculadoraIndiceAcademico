using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraIndiceAcademico.Models
{
    public class calificacionData
    {
        public int IDAsignatura { get; set; }
        public int IDEstudiante { get; set; }
        public string codigoAsignatura { get; set; }
        public string NombreDocente { get; set; }
        public string NombreEstudiante { get; set; }
        public string NombreAsignatura { get; set; }
        public int CalificacionNum { get; set; }    
        public int IDDocente { get; set; }
        public string CalificacionLiteral { get; set; }
        public string trimeste { get; set; }

    }
}