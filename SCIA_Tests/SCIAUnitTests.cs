using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using CalculadoraIndiceAcademico.Admin;
using CalculadoraIndiceAcademico.Helpers;
using System.Data;
using CalculadoraIndiceAcademico.dsSCIATableAdapters;

namespace SCIA_Tests
{
    [TestClass]
    public class SCIAUnitTests
    {
        [TestMethod]
        public void LoginValidation1()
        {
            Metodos metodos = new Metodos();
            int resultado = metodos.Login("16", "ekJxVemv");
            Assert.AreEqual(1, resultado);
        }

        [TestMethod]
        public void LoginValidation0()
        {
            Metodos metodos = new Metodos();
            int resultado = metodos.Login("16", "123456");
            Assert.AreNotEqual(1, resultado);
        }

        [TestMethod]
        public void ConversionNota1()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ConvertirCalificacionLiteral(82);
            Assert.AreEqual("B", resultado);
        }

        [TestMethod]
        public void ConversionNota0()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ConvertirCalificacionLiteral(92);
            Assert.AreNotEqual("C", resultado);
        }

        [TestMethod]
        public void ObtenerAsignaturaID1()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ObtenerAsignatura(6);
            Assert.AreEqual("Desarrollo de Software III", resultado);
        }

        [TestMethod]
        public void ObtenerAsignaturaID0()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ObtenerAsignatura(6);
            Assert.AreNotEqual("Calculo II", resultado);
        }

        [TestMethod]
        public void MostrarDocente1()
        {
            Metodos metodos = new Metodos();
            int resultado = metodos.MostrarDocente();
            Assert.AreEqual(1, resultado);
        }

        [TestMethod]
        public void MostrarDocente0()
        {
            Metodos metodos = new Metodos();
            int resultado = metodos.MostrarDocente();
            Assert.AreNotEqual(0, resultado);
        }

        [TestMethod]
        public void ObtenerEstudiante1()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ObtenerEstudiante(1);
            Assert.AreEqual("Juanita Lora", resultado);
        }

        [TestMethod]
        public void ObtenerEstudiante0()
        {
            Metodos metodos = new Metodos();
            string resultado = metodos.ObtenerEstudiante(3);
            Assert.AreNotEqual("Juanita Lora", resultado);
        }



    }
}
