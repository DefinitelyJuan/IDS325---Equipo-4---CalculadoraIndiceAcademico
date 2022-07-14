using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CalculadoraIndiceAcademico.Models
{
    public class asignaturaData
    {
        public int idAsignatura { get; set; }
        public string nombreAsignatura { get; set; }
        public string codigoAsignatura { get; set; }
        public string areaAcademica { get; set; }
        public byte numeroCreditos { get; set; }

    }
}