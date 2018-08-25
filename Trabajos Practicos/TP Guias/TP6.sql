/* EJERCICIO 1
create proc sp_obtenerprecio
as
	select price
	from titles
	where title_id = 'PS2091'
return

exec sp_obtenerprecio
*/

/* EJERCICIO 2
exec sp_help sp_obtenerprecio
*/

/* EJERCICIO 3
select name, id, type from sysobjects where name = 'sp_obtenerprecio'
*/

/* EJERCICIO 4
select name from sysobjects where type='P'
*/

/* EJERCICIO 5
exec sp_helptext 'sp_obtenerprecio'
use master
exec sp_helptext sp_help
*/

/* EJERCICIO 6
create procedure sp_obtenerprecio2
	@codigo varchar(30)
	as
	(select price from titles where title_id=@codigo)
return

sp_obtenerprecio2 'PS1372'
*/

/* EJERCICIO 7
create procedure sp_VerVenta
	(
	@almacen char(4),
	@orden varchar(20),
	@cantidad smallint
	)
	as
	select ord_date
		from sales
		where (stor_id=@almacen) and (ord_num=@orden) and (qty=@cantidad)
return

sp_VerVenta 7067, p2121, 40

sp_verVenta
	@almacen=7067,
	@orden=p2121,
	@cantidad=40
*/

/* EJERCICIO 8
create procedure sp_obtenerprecio3
	@codigo varchar(30) = NULL
	as
	(select price from titles where title_id=@codigo)
return

sp_obtenerprecio3 'PS1372'

sp_obtenerprecio3
*/

/* EJERCICIO 9
create procedure sp_obtenerprecio4
	@codigo varchar(30) = NULL
	as
	if (@codigo is null)
		print 'El SP sp_obtenerprecio4 requiere del parametro title_id'
	else
	(select price from titles where title_id=@codigo)
return

sp_obtenerprecio4 'PS1372'

sp_obtenerprecio4
*/

/* EJERCICIO 10
insert into productos values(10,'Articulo 1', 50,20)
insert into productos values(20,'Articulo 2', 70,40)
*/

/* EJERCICIO 11
create procedure sp_BuscarPrecio
	(@codProd	int,
	@precUnit	money	output)
	as
		set @precUnit = (select precUnit from productos where codProd = @codProd)
	return

create procedure sp_InsertarDetalle
	(@codDetalle	int,
	@numPed		int,
	@codProd	int,
	@cant		int)
	as
		declare @precioObtenido	money
		execute sp_BuscarPrecio @codProd, @precioObtenido output
		insert detalles values (@codDetalle, @numPed, @codProd, @cant, @cant * @precioObtenido)
		if @@RowCount = 1
			print 'Se inserto una fila'
	return

execute sp_InsertarDetalle 1540,120,10,2
select * from detalles
*/

/*************************** EJERCICIO 12 MAL**************************************
declare @errornro int
execute @errornro = sp_InsertarDetalle 1540,120,10
print 'El SP retorna el error numero' + convert(varchar(5),@errornro)
**********************************************************************************/

/*************************** EJERCICIO 132 MAL**************************************
create procedure sp_BuscarPrecio2
	(@codProd	int,
	@precUnit	money	output)
	as
		set @precUnit = (select precUnit from productos where codProd = @codProd)
		if @@rowcount = 0
			return 70
		if @precUnit is null
			return 71
	return 0

create procedure sp_InsertarDetalle2
	(@codDetalle	int,
	@numPed		int,
	@codProd	int,
	@cant		int)
	as
		declare @precioObtenido	money
		declare @statusRetorno int
		execute @statusRetorno = sp_BuscarPrecio2 @codProd, @precioObtenido output
		if @statusRetorno !=0
			begin
			if @statusRetorno = 70
				raiserror('Codigo de producto inexistente',16,1)
			else
				if @statusRetorno = 70
					raiserror('El producto %d no posee precio',16,1,@codprod)
				else
					raiserror('Error en el SP sp_BuscarPrecio2',16,1)
			end
		insert detalles values (@codDetalle, @numPed, @codProd, @cant, @cant * @precioObtenido)
		if @@error != 0
			return 77
		if @@rowcount = 1
			print 'Se inserto una fila'
	return 0

execute sp_InsertarDetalle2 1540,120,99,2

select * from detalles
**********************************************************************************/

/* EJERCICIO 14
select pub_id,pub_name 	into editoriales
	from publishers
	where pub_id!=pub_id
*/

/* EJERCICIO 15
create procedure sp_selIDyN
	as
	select pub_id , pub_name
		from publishers	
	return

insert editoriales execute sp_selIDyN
*/
