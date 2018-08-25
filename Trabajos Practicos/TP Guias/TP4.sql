/* EJERCICIO 1
select db_name()
exec sp_helpdb
use tempdb
select * from pubs..authors
use pubs
*/

/*
EJERCICIO 2
declare @mens varchar(40)
set @mens = 'just testing...'
select @mens


select @mens

La variable existe dentro del batch, una vez ejecutado el go la variable se destruye

*/
/* EJERCICIO 3
--Tabla ventas
create table ventas
	(
	codVent	smallint	identity(1,1),
	fechaVent	datetime	not null default(current_timestamp),
	usuarioDB	varchar(30)	not null default(user),
	cant		smallint	null
	)

insert into ventas (cant)
	values (100)

insert into ventas (cant)
	values (200)

--Fin Tabla ventas

declare @cant smallint
update ventas
	set cant = cant + 100,
	@cant = cant
	where codvent = 1

select @cant
*/

/* EJERCICIO 4
print 'El ultimo código de error registrado fue ' +  convert(varchar(10),@@error)
*/

/* EJERCICIO 5
use pubs

declare @precio as smallint
set @precio = (select price
		from titles
		where title_id='BU1111')
if (@precio = 10)
	print 'Precio igual a 10'
else
	if (@precio>10)
		print 'Precio mayor a 10'
	else
		print 'Precio menor a 10'
*/

/* EJERCICIO 6

create table t1
	(
	ID	smallint	identity(1,1),
	FechaHora	datetime	not null default(current_timestamp)
	)

declare @contador as smallint
set @contador = 0
while (@contador <100)
	begin
	insert into t1 (FechaHora) values (current_timestamp)
	set @contador = @contador +1
	end

select * from t1
*/

--insert into productos (codProd,descr,precUnit,stock) values (100,1200,30,200)
--select * from productos

/* EJERCICIO 7
begin transaction

declare @contador as smallint
set @contador=1
while (@contador < 6)
	begin

	update productos
		set stock = stock -1
		where codprod = 100

	insert into pedidos (numPed, fechaPed, codCli) values (1108,current_timestamp,1200)

	set @contador=@contador +1
	end

commit transaction

select * from pedidos
select * from productos

*/
