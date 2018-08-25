-- ************************* Ejercicio 1**************************************

create database examenfinal1
use examenfinal1

create table consumidor (
idConsumidor	smallint	identity(1,1),
ApeNom		varchar(30)	not null,
Domic		varchar(30)	not null,
Email		varchar(30)	null,
FamiliarDe	smallint	null,

constraint pk_idConsumidor primary key (idConsumidor)
)

insert consumidor (ApeNom,Domic)
	values ('Patricio Calvo', 'General Paz 3157')
insert consumidor (ApeNom,Domic, FamiliarDe)
	values ('Zunilda Calvo', 'General Paz 3157',1)
insert consumidor (ApeNom,Domic)
	values ('Esteban Oggier', 'Castelli 2554')
insert consumidor (ApeNom,Domic)
	values ('Javier Schneider', 'JJ Paso 1453')
insert consumidor (ApeNom,Domic, FamiliarDe)
	values ('Hector Calvo', 'General Paz 3157',1)
insert consumidor (ApeNom,Domic, FamiliarDe)
	values ('Gabriel Schneider', 'JJ Paso 1453',4)
insert consumidor (ApeNom,Domic)
	values ('Roman Rosso', 'Cullen 8245')
insert consumidor (ApeNom,Domic, FamiliarDe)
	values ('Leandro Schneider', 'JJ Paso 1453',4)


-- *****************Solucion Ejercicio 1**************************************
select idConsumidor
	into eliminar
	from consumidor C
	where (FamiliarDe is null) AND
		(exists (select *
				from consumidor CC
				where (C.idConsumidor != CC.idConsumidor) AND
					(CC.Domic=C.Domic)
			))

delete consumidor where idconsumidor in (select idConsumidor from eliminar)
drop table eliminar

-- *************Fin Solucion Ejercicio 1**************************************

-- *************Intento de generar estructura del problema 2 (INCOMPLETA)**************************************
create table sucursal (
idSucursal	smallint	identity(1,1),
Descrip		varchar(30)	not null,

constraint pk_sucursal primary key (idSucursal)
)

create table producto (
idProd		smallint	identity(1,1),
Descrip		varchar(30)	not null,
Precio		money		not null,

constraint pk_producto primary key (idProd)
)

create table depprod (
idDeposito	smallint	identity(1,1),
idProd		smallint	not null,
Cant		smallint	not null,

constraint pk_depprod primary key (idDeposito),
constraint fk_depprod_producto foreign key (idProd) references producto (idProd)
)

create table localprod (
idLocal	smallint	identity(1,1),
idProd		smallint	not null,
Cant		smallint	not null,

constraint pk_localprod primary key (idLocal),
constraint fk_localprod_producto foreign key (idProd) references producto (idProd)
)

create table deposito (
idSucursal	smallint	not null,
idDeposito	smallint	not null,
Descrip		varchar(30)	not null,

constraint pk_deposito primary key (idSucursal,idDeposito),
constraint fk_deposito_sucursal foreign key (idSucursal) references sucursal (idSucursal),
constraint fk_deposito_depprod foreign key (idDeposito) references depprod (idDeposito)
)

create table localventa (
idSucursal	smallint	not null,
idLocal		smallint	not null,
Descrip		varchar(30)	not null,

constraint pk_localventa primary key (idSucursal,idLocal),
constraint fk_localventa_sucursal foreign key (idSucursal) references sucursal (idSucursal),
constraint fk_localventa_depprod foreign key (idLocal) references localprod (idLocal)
)

insert producto (Descrip,Precio) values ('Florero',10)
insert producto (Descrip,Precio) values ('Cuadro',15)
insert producto (Descrip,Precio) values ('Reloj',5)

insert sucursal (Descrip) values ('Norte')
insert sucursal (Descrip) values ('Sur')
insert sucursal (Descrip) values ('Este')
insert sucursal (Descrip) values ('Oeste')

insert depprod (idprod,cant) values (1,5)
insert depprod (idprod,cant) values (2,14)
insert depprod (idprod,cant) values (3,52)

insert localprod (idprod,cant) values (1,57)
insert localprod (idprod,cant) values (2,4)
insert localprod (idprod,cant) values (3,10)

insert deposito (idSucursal, idDeposito,Descrip) values (1,1,'ninguna')
insert deposito (idSucursal, idDeposito,Descrip) values (2,2,'ninguna')
insert deposito (idSucursal, idDeposito,Descrip) values (3,3,'ninguna')
insert deposito (idSucursal, idDeposito,Descrip) values (4,4,'ninguna')
-- *************FIN Intento de generar estructura del problema 2 (INCOMPLETA)**************************************