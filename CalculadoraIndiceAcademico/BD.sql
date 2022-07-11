
-- Procedimientos almacenados
create or alter proc ppGetUserData
@IDRol int,
@IDUsuario int
as
if @IDRol = 1
begin
	select top 1 est.IDUsuario as Id_Usuario, est.IDEstudiante as ID_Estudiante, est.Nombre + ' ' + est.Apellido as NombreCompleto,
	pa.Nombre + ' ' + pa.Version Programa_Academico
	from tblEstudiantes as est 
	inner join  tblEstudiantes_Programas as esp on est.IDEstudiante = esp.IDEstudiante 
	inner join tblProgramasAcademicos as pa on esp.IDPrograma = pa.IDPrograma
	where est.IDUsuario = @IDUsuario and est.Estado = 1
	order by pa.FechaCreacion
end
if @IDRol = 2
begin
	select IDUsuario, IDDocente, Nombre + ' ' + Apellido as NombreCompleto from tblDocentes
	where IDUsuario = @IDUsuario and Estado = 1
	order by FechaCreacion
end

go

create or alter proc ppInsertarDocente
@Nombre varchar(25),
@Apellido varchar(25),
@Correo varchar(150),
@Contra varchar(16)
as
insert into tblUsuarios (IDRol, Contraseña) values (2, @Contra)
Declare @CurrIDUser int = (select IDENT_CURRENT('tblUsuarios'))
insert into tblDocentes (IDUsuario, Nombre, Apellido, Correo, FechaModificacion)
				values  (@CurrIDUser, @Nombre, @Apellido, @Contra, GETDATE())



go
create or alter proc ppInsertarAreaAcademica
@Nombre varchar(40)
as
insert into tblAreasAcademicas (Nombre, FechaModificacion) values (@Nombre, GETDATE())


go


create or alter proc ppInsertarAsignatura
@Codigo varchar(7),
@IDAreaAcademica int,
@Nombre varchar(70),
@NumCreditos tinyint
as
insert into tblAsignaturas (Codigo, IDAreaAcademica, Nombre, NumCreditos, FechaModificacion)
					 values(@Codigo, @IDAreaAcademica, @Nombre, @NumCreditos, GETDATE())

go

create or alter proc ppAsignarAsignatura
@IDAsignatura int,
@IDEstudiante int
as
declare @year varchar (4) = (select YEAR(GETDATE()))
declare @month varchar(2) = (select MONTH(GETDATE()))
declare @Trimestre varchar(7)

if(@month in (2,3,4))
begin
	set @Trimestre = @year + '-' + '01'
end

else if(@month in (5,6,7))
begin
	set @Trimestre = @year + '-' + '02'
end

else if(@month in (8,9,10))
begin
	set @Trimestre = @year + '-' + '03'
end

else
begin
	set @Trimestre = @year + '-' + '03'
end

insert into tblCalificaciones (IDAsignatura, IDEstudiante, Trimestre, CalificacionLiteral, CalificacionNumerica, FechaModificacion)
					    values(@IDAsignatura, @IDEstudiante, @Trimestre, ' ', 0, GETDATE())

go

create or alter proc ppAsignarCalificacion
@IDAsignatura int,
@CalificacionNumerica float,
@IDEstudiante int
as
declare @CalificacionLiteral varchar(2) = ''

if @CalificacionNumerica >= 90
begin
	set @CalificacionLiteral = 'A'
end

else if @CalificacionNumerica >= 80
begin
	set @CalificacionLiteral = 'B'
end

else if @CalificacionNumerica >= 70
begin
	set @CalificacionLiteral = 'C'
end

else if @CalificacionNumerica >= 65
begin
	set @CalificacionLiteral = 'D'
end

else
begin
	set @CalificacionLiteral = 'F'
end

update tblCalificaciones set CalificacionNumerica = @CalificacionNumerica, CalificacionLiteral = @CalificacionLiteral, FechaModificacion = GETDATE()
where IDEstudiante = @IDEstudiante and IDAsignatura = @IDAsignatura

go

create or alter proc ppEliminarAsignatura
@IDAsignatura int
as
update tblAsignaturas set Estado = 0 where IDAsignatura = @IDAsignatura
delete tblDocentes_Asignaturas where IDAsignatura = @IDAsignatura
go

create or alter proc ppEliminarDocente
@IDDocente int
as
update tblDocentes set Estado = 0 where IDDocente = @IDDocente
delete tblDocentes_Asignaturas where IDDocente = @IDDocente

go

create or alter proc ppMostrarUsuarios
@IDRol int
as
if @IDRol = 1
begin
	select 
	IDUsuario 'ID de Usuario' ,
	Contraseña,
	IDRol 'ID de Rol'
	from tblUsuarios where IDRol = @IDRol
end

else if @IDRol = 2
begin
	select 
	IDUsuario 'ID de Usuario' ,
	Contraseña,
	IDRol 'ID de Rol'
	from tblUsuarios where IDRol = @IDRol
end

else
begin
	select 
	IDUsuario 'ID de Usuario' ,
	Contraseña,
	IDRol 'ID de Rol'
	from tblUsuarios where IDRol = @IDRol
end
go



go
create or alter function ObtenerTrimestreActual
(
)
returns varchar(7)
as
begin
	declare @year varchar (4) = (select YEAR(GETDATE()))
	declare @month varchar(2) = (select MONTH(GETDATE()))
	declare @Trimestre varchar(7)

	if(@month in (2,3,4))
	begin
		set @Trimestre = @year + '-' + '01'
	end

	else if(@month in (5,6,7))
	begin
		set @Trimestre = @year + '-' + '02'
	end

	else if(@month in (8,9,10))
	begin
		set @Trimestre = @year + '-' + '03'
	end

	else
	begin
		set @Trimestre = @year + '-' + '03'
	end
	return @Trimestre
end
go

create or alter proc MostrarAsignaturasActuales
@IDEstudiante int
as
declare @TrimestreActual varchar(7) = (select dbo.ObtenerTrimestreActual())
declare @Docente varchar(50) =
(select doc.Nombre + ' ' + doc.Apellido from tblDocentes doc 
inner join tblDocentes_Asignaturas da on doc.IDDocente = da.IDDocente
inner join tblCalificaciones ca on ca.IDAsignatura = da.IDAsignatura
inner join tblEstudiantes est on est.IDEstudiante = ca.IDEstudiante
where ca.IDEstudiante = @IDEstudiante)
select 
asig.Codigo 'Clave',
asig.Nombre 'Nombre',
asig.NumCreditos 'Créditos',
(select @Docente) 'Docente', 

cl.CalificacionLiteral 'Calificación literal',
cl.CalificacionNumerica 'Calificación numérica'
from tblAsignaturas asig
inner join tblCalificaciones cl on cl.IDAsignatura = cl.IDAsignatura
inner join tblDocentes_Asignaturas da on asig.IDAsignatura = da.IDAsignatura
inner join tblDocentes doc on doc.IDDocente = da.IDDocente
inner join tblEstudiantes est on est.IDEstudiante = cl.IDEstudiante
where cl.Trimestre = @TrimestreActual and cl.IDEstudiante = @IDEstudiante
go



create or alter proc ppEstudiantesxDocente
@IDDocente int,
@CodigoAsignatura varchar(7)
as
select 
asig.IDAsignatura 'ID Asignatura',
ca.IDEstudiante 'IDEstudiante',
est.Nombre + ' ' + est.Apellido 'Nombre completo',
asig.Codigo 'Código',
asig.Nombre 'Asignatura',
ca.CalificacionNumerica 'Calificación numérica',
ca.CalificacionLiteral 'Calificación literal'
from tblCalificaciones ca 
inner join tblAsignaturas asig on asig.IDAsignatura = ca.IDAsignatura 
inner join tblDocentes_Asignaturas da on da.IDAsignatura = asig.IDAsignatura
inner join tblDocentes doc on doc.IDDocente = da.IDDocente
inner join tblEstudiantes est on est.IDEstudiante = ca.IDEstudiante
where da.IDDocente = @IDDocente and asig.Codigo = @CodigoAsignatura

go
create or alter proc ppObtenerDataDocente
@IDUsuario int
as
select IDUsuario ID_Usuario, 
IDDocente ID_Docente,
Nombre + ' ' + Apellido 'Nombre Completo'
from tblDocentes where IDUsuario = @IDUsuario
go


create or alter proc ppObtenerAsignaturasDocentes
@IDDocente int
as
select a.Codigo from tblDocentes_Asignaturas da
inner join tblAsignaturas a on da.IDAsignatura = a.IDAsignatura
where da.IDDocente = @IDDocente

go

create or alter proc [dbo].[ppObtenerPrograma]
@Nombre varchar(100)
as
select top 1 IDPrograma from tblProgramasAcademicos where Nombre = @Nombre order by FechaCreacion

go

create or alter proc [dbo].[ppCrearEstudiante]
@Nombre varchar(25),
@Apellido varchar(25),
@Correo varchar(25),
@IDPrograma int,
@Contra varchar(7),
@NumTelefonico varchar(12)

as
	insert into tblUsuarios(Contraseña, IDRol)
	values (@Contra, 1)

	declare @Curr_UserID int = (select IDENT_CURRENT('tblUsuarios'))

	insert into tblEstudiantes(Nombre, IDUsuario, Apellido, Correo, Trimestre, FechaModificacion, NumTelefonico)
						values(@Nombre, @Curr_UserID, @Apellido, @Correo, '1', GETDATE(), @NumTelefonico)
	
	declare @Curr_EstID int  = (select IDENT_CURRENT('tblEstudiantes'))

	insert into tblEstudiantes_Programas(IDEstudiante, IDPrograma)
								values (@Curr_EstID, @IDPrograma)

go
-- Mostrar asignaturas docente
create or alter proc ppMostrarAsignaturasDocente
@IdDocente int
as
	declare @actualTrimester as varchar(7)
	set @actualTrimester = (select dbo.ObtenerTrimestreActual())

	select a.Codigo, a.Nombre, a.Numcreditos from tblAsignaturas a inner join tblDocentes_Asignaturas da on a.IDAsignatura = da.IDAsignatura
	where da.IDDocente = @IdDocente and @actualTrimester = da.Trimestre
go

-- Generar indice estudiante
create or alter proc ppGenerarIndiceEstudiante
@tipoIndice varchar(15),
@IdEstudiante int
as

declare @actualTrimester as varchar(7)
set @actualTrimester = (select dbo.ObtenerTrimestreActual())

-- Indice general
if @tipoIndice = 'General'
begin
	select a.Codigo, a.Nombre, a.NumCreditos, 
	c.CalificacionLiteral, c.Trimestre,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end 'Puntos'
	from tblCalificaciones c
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura
	where IDEstudiante = @IdEstudiante
end

-- Indice trimestral
if @tipoIndice = 'Trimestral'
begin
	select a.Codigo, a.Nombre, a.NumCreditos, 
	c.CalificacionLiteral, c.Trimestre,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end 'Puntos'
	from tblCalificaciones c
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura
	where IDEstudiante = @IdEstudiante and c.Trimestre=@actualTrimester
end

go

-- Mostrar calificaciones admin
create or alter proc ppMostrarCalificacionesAdmin
@CodigoAsignatura varchar (7)
as
	select e.IDEstudiante, CONCAT(e.Nombre, ' ', e.Apellido) 'Nombre completo', a.Codigo, a.Nombre, c.CalificacionLiteral, c.Trimestre from tblCalificaciones c
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura
	inner join tblEstudiantes e on c.IDEstudiante = e.IDEstudiante
	where a.Codigo = @CodigoAsignatura