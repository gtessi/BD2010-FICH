
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
-- TABLA MADRE
select * into madre_new from madre
alter table madre_new add id_madreN smallint identity(0,1)
alter table madre_new add constraint  pk_madreN primary key (id_madreN)

-- TABLA HIJO
select * into hijo_new from hijo
alter table hijo_new add id_hijoN smallint identity(0,1)
alter table hijo_new add id_madreN smallint null

alter table hijo_new add constraint  pk_hijoN primary key (id_hijoN)
alter table hijo_new add constraint  fk_madreN foreign key (id_madreN) references madre_new(id_madreN)

-- COMPLETAR LA COLUMNA id_madreN

update hijo_new set id_madreN = (select id_madreN from madre_new where madre_new.id_madre=hijo_new.id_madre)

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
exec sp_rename 'madre', 'madre_old'

--RENOMBRO TABLAS NUEVAS
exec sp_rename 'hijo_new','hijo'
exec sp_rename 'madre_new','madre'
