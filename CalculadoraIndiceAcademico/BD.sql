
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
				values  (@CurrIDUser, @Nombre, @Apellido, @Correo, GETDATE())



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
where IDEstudiante = @IDEstudiante and IDAsignatura = @IDAsignatura and Trimestre = dbo.ObtenerTrimestreActual()

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
where da.IDDocente = @IDDocente and asig.Codigo = @CodigoAsignatura and ca.Trimestre = dbo.ObtenerTrimestreActual()

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
@IdEstudiante int,
@Trimestre varchar(7)
as

declare @actualTrimester as varchar(7)
set @actualTrimester = (select dbo.ObtenerTrimestreActual())
declare @Indice as decimal(2,1)

-- Indice general
if @tipoIndice = 'General'
begin
	with CalculoIndice as (select a.Codigo, a.Nombre, a.NumCreditos, 
	c.CalificacionLiteral, c.Trimestre,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end Puntos
	from tblCalificaciones c
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura
	where IDEstudiante = @IdEstudiante)

	select Codigo, Nombre, NumCreditos, CalificacionLiteral, Trimestre, Puntos, (select ROUND(sum(convert(float, Puntos))/SUM(convert(float, NumCreditos)),2) from CalculoIndice) Indice
	from CalculoIndice
	group by Codigo, Nombre, NumCreditos, CalificacionLiteral, Trimestre, Puntos
end

-- Indice trimestral
if @tipoIndice = 'Trimestral'
begin
	
	with CalculoIndice as (select a.Codigo, a.Nombre, a.NumCreditos, 
	c.CalificacionLiteral, c.Trimestre,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end Puntos
	from tblCalificaciones c
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura
	where IDEstudiante = @IdEstudiante and c.Trimestre=@Trimestre) 

	select Codigo, Nombre, NumCreditos, CalificacionLiteral, Trimestre, Puntos, (select ROUND(sum(convert(float, Puntos))/SUM(convert(float, NumCreditos)),2) from CalculoIndice where Trimestre = @Trimestre) Indice
	from CalculoIndice
	group by Codigo, Nombre, NumCreditos, CalificacionLiteral, Trimestre, Puntos
end

go

create or alter proc ppMostrarCalificacionesAdmin
@Top int
as
if @Top = 5
begin
	with CalculoIndice as (select e.IDEstudiante, e.Nombre + ' ' + e.Apellido NombreCompleto,  a.NumCreditos, 
	c.CalificacionLiteral,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end Puntos
	from tblCalificaciones c 
	inner join tblEstudiantes e on c.IDEstudiante = e.IDEstudiante
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura)
	
	select distinct top 5 CalculoIndice.IDEstudiante, CalculoIndice.NombreCompleto,
	(select ROUND(sum(convert(float, Puntos))/SUM(convert(float, NumCreditos)),2) from CalculoIndice ci where ci.IDEstudiante = CalculoIndice.IDEstudiante) Indice
	from CalculoIndice
end

else if @Top = 10
begin
	with CalculoIndice as (select e.IDEstudiante, e.Nombre + ' ' + e.Apellido NombreCompleto,  a.NumCreditos, 
	c.CalificacionLiteral,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end Puntos
	from tblCalificaciones c 
	inner join tblEstudiantes e on c.IDEstudiante = e.IDEstudiante
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura)
	
	select distinct top 10 CalculoIndice.IDEstudiante, CalculoIndice.NombreCompleto,
	(select ROUND(sum(convert(float, Puntos))/SUM(convert(float, NumCreditos)),2) from CalculoIndice ci where ci.IDEstudiante = CalculoIndice.IDEstudiante) Indice
	from CalculoIndice
end

else if @Top = 15
begin
	with CalculoIndice as (select e.IDEstudiante, e.Nombre + ' ' + e.Apellido NombreCompleto,  a.NumCreditos, 
	c.CalificacionLiteral,
	case
		when c.CalificacionLiteral = 'A' then 4 * a.NumCreditos
		when c.CalificacionLiteral = 'B' then 3 * a.NumCreditos
		when c.CalificacionLiteral = 'C' then 2 * a.NumCreditos
		when c.CalificacionLiteral = 'D' then 1 * a.NumCreditos
		when c.CalificacionLiteral = 'F' then 0 * a.NumCreditos
	end Puntos
	from tblCalificaciones c 
	inner join tblEstudiantes e on c.IDEstudiante = e.IDEstudiante
	inner join tblAsignaturas a on c.IDAsignatura = a.IDAsignatura)
	
	select distinct top 15 CalculoIndice.IDEstudiante, CalculoIndice.NombreCompleto,
	(select ROUND(sum(convert(float, Puntos))/SUM(convert(float, NumCreditos)),2) from CalculoIndice ci where ci.IDEstudiante = CalculoIndice.IDEstudiante) Indice
	from CalculoIndice
end

go

create or alter proc ppInsertarRol
@Nombre nvarchar(25)
as
insert into tblRoles (Nombre) values (@Nombre)
go


create or alter proc ppDesactivarRol
@IDRol int
as
update tblRoles set Estado = 0 where IDRol = @IDRol

go

create or alter proc ppEditarRol
@IDRol int,
@Nombre nvarchar(25)
as
update tblRoles set Nombre = @Nombre where IDRol = @IDRol

go

create or alter proc ppDesactivarArea
@Id int
as
update tblAreasAcademicas set Estado = 0 where IDArea = @Id

exec ppDesactivarArea 4

select * from tblCalificaciones

go

create or alter proc ppEditarArea
@Id int,
@Nombre varchar(40)
as
update tblAreasAcademicas set Nombre = @Nombre where IDArea = @Id


go

create or alter proc ppDesactivarPrograma
@id int
as
update tblProgramasAcademicos set Estado = 0 where IDPrograma = @id

go

create or alter proc ppEditarPrograma
@Id int,
@Nombre varchar(70),
@Version varchar(15),
@Creditos int
as
update tblProgramasAcademicos set Nombre = @Nombre, Version = @Version, Creditos = @Creditos where IDPrograma = @Id

go

create or alter proc ppMostrarUsuarioEstudiante
as
select  
u.IDUsuario Usuario, u.Contraseña Contraseña, e.IDEstudiante, e.Nombre 'Nombre Estudiante', e.Apellido, e.Correo, e.NumTelefonico 'Teléfono', p.Nombre 'Programa' 

from tblEstudiantes e inner join tblUsuarios u on e.IDUsuario = u.IDUsuario
inner join tblEstudiantes_Programas ep on e.IDEstudiante = ep.IDEstudiante
inner join tblProgramasAcademicos p on ep.IDPrograma = p.IDPrograma
where u.IDRol = 1 and e.Estado = 1

go
create or alter proc ppMostrarUsuarioDocente
as
select u.IDUsuario Usuario, u.Contraseña Contraseña, d.IDDocente, d.Nombre, d.Apellido, d.Correo
from tblDocentes d inner join tblUsuarios u on d.IDUsuario = u.IDUsuario
where u.IDRol = 2 and d.Estado = 1

go

create or alter proc ppMostrarUsuarioAdmin
as
select
u.IDUsuario, u.Contraseña, a.IDAdministrador, a.Nombre, a.Apellido, a.Correo
from tblAdministradores a inner join tblUsuarios u on a.IDUsuario = u.IDUsuario

go

create or alter proc ppEditarEstudiante
@IdUsuario int,
@IdEstudiante int,
@Contra varchar(16),
@Nombre varchar(25),
@Apellido varchar(25),
@Correo varchar(150),
@Telefono varchar(12)
as
update tblUsuarios set Contraseña = @Contra where IDUsuario = @IdUsuario
update tblEstudiantes set Nombre = @Nombre, Apellido = @Apellido, Correo = @Correo, NumTelefonico = @Telefono, FechaModificacion = GETDATE() where IDEstudiante = @IdEstudiante

go
create or alter proc ppEditarDocente
@IdUs int,
@IdDoc int,
@Contra varchar(16),
@Nombre varchar(25), 
@Apellido varchar(25),
@Correo varchar(150)
as
update tblUsuarios set Contraseña = @Contra where IDUsuario = @IdUs 
update tblDocentes set Nombre = @Nombre, Apellido = @Apellido, Correo = @Correo, FechaModificacion = GETDATE() 
where IDDocente = @IdDoc

go
create or alter proc ppDesactivarEst
@IdEst int,
@IdUs int
as
update tblUsuarios set Estado = 0 where IDUsuario = @IdUs
update tblEstudiantes set Estado = 0 where IDEstudiante = @IdEst

select * from tblEstudiantes

go
create or alter proc ppDesactivarDoc
@IdDoc int,
@IdUs int
as
update tblUsuarios set Estado = 0 where IDUsuario = @IdUs
update tblDocentes set Estado = 0 where IDDocente = @IdDoc
