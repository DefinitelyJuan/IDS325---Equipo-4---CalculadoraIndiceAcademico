CREATE DATABASE SCIA
USE SCIA


--Tabla Programas Academicos
CREATE TABLE [tblProgramasAcademicos] (
  [IDPrograma] int identity(1,1),
  [Nombre] varchar (70),
  [Version] varchar (15),
  [Creditos] int,
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  [Estado] bit,
  PRIMARY KEY ([IDPrograma])
);

--Tabla Roles
CREATE TABLE [tblRoles] (
  [IDRol] tinyint identity(1,1),
  [Nombre] nvarchar(25),
  PRIMARY KEY ([IDRol])
);

--Tabla Usuarios
CREATE TABLE [tblUsuarios] (
  [IDUsuario] int identity(1,1),
  [Usuario] varchar(7),
  [Contraseña] varchar(16),
  [IDRol] tinyint,
  [Estado] bit,
  PRIMARY KEY ([IDUsuario]),
  CONSTRAINT [FK_tblUsuarios.IDRol]
    FOREIGN KEY ([IDRol])
      REFERENCES [tblRoles]([IDRol])
);
CREATE NONCLUSTERED INDEX IX_IDRol   
    ON tblUsuarios (IDRol); 


--Tabla Docentes
CREATE TABLE [tblDocentes] (
  [IDDocente] int identity(1,1),
  [IDUsuario] int,
  [Nombre] varchar(25),
  [Apellido] varchar(25),
  [Correo] varchar(150),
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  [Estado] bit,
  PRIMARY KEY ([IDDocente]),
  CONSTRAINT [FK_tblDocentes.IDUsuario]
    FOREIGN KEY ([IDUsuario])
      REFERENCES [tblUsuarios]([IDUsuario])
);
CREATE NONCLUSTERED INDEX IX_IDUsuario   
    ON tblDocentes(IDUsuario); 

--Tabla Areas Académicas
CREATE TABLE [tblAreasAcademicas] (
  [IDArea] int identity(1,1),
  [Nombre] varchar(40),
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  PRIMARY KEY ([IDArea])
);

--Tabla Asignaturas
CREATE TABLE [tblAsignaturas] (
  [IDAsignatura] int identity(1,1),
  [Codigo] char(6),
  [IDAreaAcademica] int,
  [Nombre] varchar(70),
  [NumCreditos] tinyint,
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  PRIMARY KEY ([IDAsignatura]),
  CONSTRAINT [FK_tblAsignaturas.IDAreaAcademica]
    FOREIGN KEY ([IDAreaAcademica])
      REFERENCES [tblAreasAcademicas]([IDArea])
);
CREATE NONCLUSTERED INDEX IX_IDAsignatura  
    ON tblAsignaturas (IDAreaAcademica); 

--Tabla Docentes_Asignaturas
CREATE TABLE [tblDocentes_Asignaturas] (
  [IDAsignatura] int,
  [IDDocente] int,
  [Trimestre] varchar (7),
  PRIMARY KEY ([IDAsignatura], [IDDocente]),

  CONSTRAINT [FK_tblDocentes_Asignaturas.IDAsignatura]
    FOREIGN KEY ([IDAsignatura])
      REFERENCES [tblAsignaturas]([IDAsignatura]),
  CONSTRAINT [FK_tblDocentes_Asignaturas.IDDocente]
    FOREIGN KEY ([IDDocente])
      REFERENCES [tblDocentes]([IDDocente])
);

--Tabla Estudiantes
CREATE TABLE [tblEstudiantes] (
  [IDEstudiante] int identity(1,1),
  [IDUsuario] int,
  [Nombre] varchar (25),
  [Apellido] varchar (25),
  [Correo] varchar (150),
  [Trimestre] varchar(7),
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  [Estado] bit,
  PRIMARY KEY ([IDEstudiante]),
  CONSTRAINT [FK_tblEstudiantes.IDUsuario]
    FOREIGN KEY ([IDUsuario])
      REFERENCES [tblUsuarios]([IDUsuario])
);
CREATE NONCLUSTERED INDEX IX_IDUsuario
    ON tblEstudiantes(IDUsuario); 

--Tabla Calificaciones
CREATE TABLE [tblCalificaciones] (
  [IDAsignatura] int identity(1,1),
  [IDEstudiante] int,
  [CalificacionNumerica] float,
  [CalificacionLiteral] char(2),
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  [Trimestre] varchar(7),
  PRIMARY KEY ([IDAsignatura], [IDEstudiante]),
  CONSTRAINT [FK_tblCalificaciones.IDEstudiante]
    FOREIGN KEY ([IDEstudiante])
      REFERENCES [tblEstudiantes]([IDEstudiante]),
  CONSTRAINT [FK_tblCalificaciones.IDAsignatura]
    FOREIGN KEY ([IDAsignatura])
      REFERENCES [tblAsignaturas]([IDAsignatura])
);

--Tabla Estudiantes_Programas
CREATE TABLE [tblEstudiantes_Programas] (
  [IDEstudiante] int,
  [IDPrograma] int,
  PRIMARY KEY ([IDEstudiante], [IDPrograma]),
  CONSTRAINT [FK_tblEstudiantes_Programas.IDEstudiante]
    FOREIGN KEY ([IDEstudiante])
      REFERENCES [tblEstudiantes]([IDEstudiante]),
  CONSTRAINT [FK_tblEstudiantes_Programas.IDPrograma]
    FOREIGN KEY ([IDPrograma])
      REFERENCES [tblProgramasAcademicos]([IDPrograma])
);

--Tabla Administradores
CREATE TABLE [tblAdministradores] (
  [IDAdministrador] int,
  [IDUsuario] int,
  [Nombre] nvarchar(25),
  [Apellido] nvarchar(25),
  [Correo] nvarchar(150),
  [FechaCreacion] datetime,
  [FechaModificacion] datetime,
  PRIMARY KEY ([IDAdministrador]),
  CONSTRAINT [FK_tblAdministradores.IDUsuario]
    FOREIGN KEY ([IDUsuario])
      REFERENCES [tblUsuarios]([IDUsuario])
);
CREATE NONCLUSTERED INDEX IX_IDUsuario
    ON tblAdministradores(IDUsuario); 