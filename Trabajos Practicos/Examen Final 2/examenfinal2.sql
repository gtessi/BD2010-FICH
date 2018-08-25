create database examenfinal2
use examenfinal2

/*==============================================================*/
/* Table: Articulo                                              */
/*==============================================================*/
create table Articulo (
   IDArt                smallint             not null,
   Descrip              varchar(30)          not null,
   Precio               money                not null,
   stock                smallint             not null,
   CodDesc              varchar(30)          null,
   constraint PK_ARTICULO primary key (IDArt)
)
go

/*==============================================================*/
/* Table: Cliente                                               */
/*==============================================================*/
create table Cliente (
   IDCliente            smallint             not null,
   ApeNom               varchar(30)          not null,
   Domic                varchar(30)          not null,
   Tel                  integer              null,
   CondIVA              bit                  null,
   Saldo                money                not null,
   CP                   integer              not null,
   constraint PK_CLIENTE primary key (IDCliente)
)
go

/*==============================================================*/
/* Table: Detalle                                               */
/*==============================================================*/
create table Detalle (
   IDFact               smallint             not null,
   IDArt                smallint             not null,
   Cant                 smallint             null,
   constraint PK_DETALLE primary key (IDFact, IDArt)
)
go

/*==============================================================*/
/* Table: Factura                                               */
/*==============================================================*/
create table Factura (
   IDFact               smallint             not null,
   IDCliente            smallint             not null,
   Fecha                datetime             null,
   constraint PK_FACTURA primary key (IDFact)
)
go

/*==============================================================*/
/* Table: Localidad                                             */
/*==============================================================*/
create table Localidad (
   CP                   integer              not null,
   Descrip              varchar(50)          not null,
   constraint PK_LOCALIDAD primary key (CP)
)
go

alter table Cliente
   add constraint FK_CLIENTE_REFERENCE_LOCALIDA foreign key (CP)
      references Localidad (CP)
go

alter table Detalle
   add constraint FK_DETALLE_REFERENCE_ARTICULO foreign key (IDArt)
      references Articulo (IDArt)
go

alter table Detalle
   add constraint FK_DETALLE_REFERENCE_FACTURA foreign key (IDFact)
      references Factura (IDFact)
go

alter table Factura
   add constraint FK_FACTURA_REFERENCE_CLIENTE foreign key (IDCliente)
      references Cliente (IDCliente)
go

--Inserciones

insert Articulo (IDArt, Descrip,Precio,stock) values (1,'Reloj', 20,5)
insert Articulo (IDArt, Descrip,Precio,stock) values (2,'Cuadro', 100,1)
insert Articulo (IDArt, Descrip,Precio,stock) values (3,'Velador', 45,2)
insert Articulo (IDArt, Descrip,Precio,stock) values (4,'Mesa', 120,1)
insert Articulo (IDArt, Descrip,Precio,stock) values (5,'Ropero', 200,1)
go

insert Localidad (CP, Descrip) values (3000, 'Santa Fe')
insert Localidad (CP, Descrip) values (3080, 'Esperanza')
insert Localidad (CP, Descrip) values (3100, 'Paraná')
go

insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (1, 'Patricio Calvo', 'Gral Paz 3157', 0, 3000)
insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (2, 'Hector Calvo', 'Colodrero 1342', 0, 3000)
insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (3, 'Marta Lopez', 'Rivadavia 2745', 0, 3080)
insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (4, 'José Perez', 'Chacabuco 224', 0, 3100)
insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (5, 'Pedro Lopez', 'San martin 2647', 0, 3100)
insert Cliente (IDCliente, ApeNom,Domic,Saldo, CP) values (6, 'Pedro Calvo', 'Colodrero 1342', 0, 3000)
go

insert Factura (IDFact, IDCliente, Fecha) values (1,1,current_timestamp)
insert Factura (IDFact, IDCliente, Fecha) values (2,1,current_timestamp)
insert Factura (IDFact, IDCliente, Fecha) values (3,2,current_timestamp)
insert Factura (IDFact, IDCliente, Fecha) values (4,3,current_timestamp)
insert Factura (IDFact, IDCliente, Fecha) values (5,4,current_timestamp)
go

Insert Detalle (IDFact, IDArt, Cant) values (1, 1, 3) -- 3 relojes   |Factura 1
Insert Detalle (IDFact, IDArt, Cant) values (1, 3, 2) -- 2 veladores |
Insert Detalle (IDFact, IDArt, Cant) values (2, 1, 1) -- 1 reloj        |Factura 2
Insert Detalle (IDFact, IDArt, Cant) values (3, 4, 2) -- 2 mesas          |Factura 3
Insert Detalle (IDFact, IDArt, Cant) values (4, 4, 1) -- 1 mesa               |Factura 4
Insert Detalle (IDFact, IDArt, Cant) values (4, 3, 2) -- 2 veladores          |
Insert Detalle (IDFact, IDArt, Cant) values (4, 1, 2) -- 2 relojes            |
Insert Detalle (IDFact, IDArt, Cant) values (5, 2, 1) -- 1 cuadro                |Factura 5
go

--***********************************SOLUCION EJERCICIO 1 (POR PARTES) ******************************
-- clientes de santa fe
select IDFact
	into facturasSTF
	from factura F inner join cliente C
		on F.IDCliente = C.IDCliente
		inner join Localidad L
		on C.CP=L.CP
	where L.Descrip = 'Santa Fe'
go

-- Precio medio del total de articulos
declare @PrecioMedio money
set @PrecioMedio = (select avg(Precio) from Articulo)
select @PrecioMedio

-- resultado final
select IDFact
	from detalle D inner join Articulo A
		on D.IDArt = A.IDArt
	where (2*A.Precio)>@PrecioMedio AND
		(IDFact IN (select IDFact from facturasSTF))
go
--****************************** FIN SOLUCION EJERCICIO 1 (POR PARTES) **********************************

--***********************************SOLUCION EJERCICIO 1 (SIN T-SQL) ***********************************

--****************************** FIN SOLUCION EJERCICIO 1 (SIN T-SQL) ***********************************


--********************************* SOLUCION EJERCICIO 2 (BIEN) ************************************************
/*
MUCHO CUIDADO CON HACER UN INNER JOIN Y DE AHI APLICAR EL WHERE
NO SE PODRIA HACER UN INNER JOIN DIRECTO PORQUE NO ME TOMARIA LOS ARTICULOS QUE NO ESTAN REFERENCIADOS (ROPERO)
(No entran en la tabla inner join)
*/
select A.Descrip
	from Articulo A
	where not exists (select F.IDFact
		from Localidad L inner join Cliente C
			on L.CP=C.CP
			inner join Factura F
			on C.IDCliente=F.IDCliente
			inner join Detalle D
			on F.IDFact=D.IDFact
			inner join Articulo AA
			on D.IDArt=AA.IDArt
		where L.Descrip  = 'Paraná' AND
			A.IDArt = AA.IDArt)
--****************************** FIN SOLUCION EJERCICIO 2 (BIEN)************************************************
