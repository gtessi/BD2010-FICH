/*
create database familia

use familia

create table madre (
	id_madre	smallint	not null,
	nombre		varchar(30)	not null,

	constraint pk_madre primary key (id_madre))



create table hijo (
	id_hijo		smallint	not null,
	nombre		varchar(30)	not null,

	id_madre	smallint	not null,
	constraint pk_hijo primary key (id_hijo),
	constraint fk_madre foreign key (id_madre) references madre(id_madre))

-- INSERCION DE DATOS

insert madre (id_madre,nombre) values(0,'maria')
insert madre (id_madre,nombre) values(1,'raquel')
insert madre (id_madre,nombre) values(2,'celeste')
insert madre (id_madre,nombre) values(3,'susana')

insert hijo (id_hijo,nombre,id_madre) values(0,'carlos',0)
insert hijo (id_hijo,nombre,id_madre) values(1,'pedro',0)
insert hijo (id_hijo,nombre,id_madre) values(2,'enrique',1)
insert hijo (id_hijo,nombre,id_madre) values(3,'jose',2)
insert hijo (id_hijo,nombre,id_madre) values(4,'roberto',0)

-- ACA EMPIEZA RECIEN EL EJERCICIO

-- CREACION DE NUEVAS TABLAS

create table madre_new (
	id_madreN	smallint	identity(0,1),

	id_madre	smallint	not null,
	nombre		varchar(30)	not null,

	constraint pk_madre_new primary key (id_madreN))

create table hijo_new (
	id_hijoN	smallint	identity(0,1),
	id_madreN	smallint	not null,

	id_hijo		smallint	not null,
	nombre		varchar(30)	not null,
	id_madre	smallint	not null,

	constraint pk_hijo_new primary key (id_hijoN),
	constraint fk_madre_new foreign key (id_madreN) references madre_new(id_madreN))

-- INSERTO DATOS EN MADRE_NEW
declare curMadre cursor
	for select id_madre, nombre
		from madre
	for read only
open curMadre
declare @id_madre as smallint, @nombre as varchar(30)
fetch next
	from curMadre
	into @id_madre, @nombre
while @@fetch_status = 0
	begin
	insert madre_new (id_madre, nombre) values (@id_madre, @nombre)	
	fetch next
		from curMadre
		into @id_madre, @nombre
	end
close curMadre
deallocate curMadre

-- INSERTO DATOS EN HIJO_NEW
declare curHijo cursor
	for select id_hijo, nombre, id_madre
		from hijo
	for read only
open curHijo
declare @id_hijo as smallint, @nombre as varchar(30), @id_madre as smallint,@id_madreN as smallint
fetch next
	from curHijo
	into @id_hijo,@nombre, @id_madre
while @@fetch_status = 0
	begin
	set @id_madreN = (select id_madreN from madre_new where id_madre=@id_madre)
	insert into hijo_new (id_hijo, nombre, id_madre, id_madreN) values (@id_hijo,@nombre,@id_madre, @id_madreN)
	fetch next
		from curHijo
		into @id_hijo,@nombre, @id_madre
	end
close curHijo
deallocate curHijo


-- ELIMINO LAS COLUMNAS OBSOLETAS
alter table hijo_new drop column id_hijo
alter table hijo_new drop column id_madre
alter table madre_new drop column id_madre

-- CAMBIO AL NOMBRE DE COLUMNAS ORIGINAL
exec sp_rename 'hijo_new.id_hijoN','id_hijo'
exec sp_rename 'hijo_new.id_madreN','id_madre'
exec sp_rename 'madre_new.id_madreN', 'id_madre'

-- RENOMBRO TABLAS VIEJAS
exec sp_rename 'hijo','hijo_old'
exec sp_rename 'madre', 'id_madre_old'

--RENOMBRO TABLAS NUEVAS
exec sp_rename 'hijo_new','hijo'
exec sp_rename 'madre_new','madre'
*/