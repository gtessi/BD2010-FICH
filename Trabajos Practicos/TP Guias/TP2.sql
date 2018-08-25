/* EJERCICIO 1
use pubs
create table cliente
	(
	codCli	int	not null, 
	ape	varchar(30)	not null,
	nom	varchar(30)	not null,
	dir	varchar(40)	not null,
	codPost	char(9)		null default 3000
	)
create table productos
	(
	codProd	int	not null,
	descr	varchar(30)	not null,
	precUnit	money	not null,
	stock	smallint	not null
	)

create table pedidos
	(
	numPed	int	not null,
	fechaPed	datetime	not null,
	codCli	int	not null
	)

create table proveed
	(
	codProv	int	identity(1,1),
	razonSoc	varchar(30)	not null,
	dir	varchar(30)	not null
	)
*/

/* EJERCICIO 2
insert into cliente (codCli, ape, nom, dir, codPost) values (1,'LOPEZ', 'JOSE MARIA', 'Gral. Paz 3124', default)
select * from cliente
*/

/* EJERCICIO 3
insert into cliente (codCli, ape, nom, dir, codPost) values (2,'GERVASOLI', 'MAURO', 'San Luis 472', null)
select * from cliente
*/

/* EJERCICIO 4
insert
into proveed(razonSoc,dir)
values ('FLUKE INGENIERIA','RUTA 9 KM. 80')

insert
into proveed(razonSoc,dir)
values ('PVD PATCHES','Pinar de Rocha 1154')

select * from proveed
*/

/* EJERCICIO 5
create table ventas
	(
	codVent	smallint	identity(1,1),
	fechaVent	datetime	not null default(current_timestamp),
	usuarioDB	varchar(30)	not null default(user),
	cant		smallint	null
	)
*/

/* EJERCICIO 6
insert into ventas (cant)
	values (100)

insert into ventas (cant)
	values (200)

select * from ventas

*/

/* EJERCICIO 7
select *
	into clistafe
	from cliente
	where codPost = 3000

select * from clistafe
*/

/* EJERCICIO 8
insert into clistafe
	select *
		from cliente
select * from clistafe
*/

/* EJERCICIO 9
update cliente
	set dir = 'The crystal method 168'
	where dir like '%1%'
*/

/* EJERCICIO 10
update cliente
	set codpost = default
*/

/* EJERCICIO 11
delete cliente
	where codPost is null
*/

/* EJERCICIO 12
create table #tempi
	(
	CodCli	int not null,
	ape	varchar(30) not null
	)
*/

/* EJERCICIO 13
select au_lname, au_fname, city
	into #Autores
	from authors
	where state = 'CA'

select * from #Autores
*/