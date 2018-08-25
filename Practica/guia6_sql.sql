sp_helptext @objname= 'sp_Prueba'     -- determino si existe 

-- 1
select * from titles
drop proc sp_ObtenerPrecio

create proc sp_ObtenerPrecio as 
	select title, price from titles where title_id='PS2091'

sp_ObtenerPrecio 

--2

sp_help sp_ObtenerPrecio

--3
select * from sysobjects

select name, id, type from sysobjects where name='sp_ObtenerPrecio'

--4

select name from sysobjects where type='P'

--5

sp_helptext sp_ObtenerPrecio    -- codigo fuente de mi proceso 

sp_helptext sp_help 		-- cambiar a base de datos Master para q funcione

--6

create proc sp_ObtenerPrec2 (@codigo char(6)) as 
	select title, price from titles where title_id=@codigo

sp_obtenerPrec2 PS1372

--7
select * from sales
drop proc sp_obtenerprec3
sp_VerVenta

create proc sp_VerVenta @cod char(4), @orden varchar(20), @cant int as
	select ord_date from sales where stor_id=@cod and ord_num=@orden and qty=@cant

-- ejecucion por posicion
sp_VerVenta 7067, P2121, 40

--ejecucion por nombre

sp_VerVenta @cod=7067, @orden=p2121, @cant=40

--8

create proc sp_ObtenerPrec3 (@codigo varchar(20)=NULL) as
	select title, price from titles where title_id=@codigo

sp_ObtenerPrec3

sp_ObtenerPrec3 ps1372

--9
drop proc sp_obtenerprec4

create proc sp_ObtenerPrec4 (@codigo varchar(20)=NULL) as
	if @codigo is NULL 
		print 'el SP requiere del parametro title_id'
	else
	select title, price from titles where title_id=@codigo
	

sp_obtenerprec4

sp_obtenerprec4 ps1372


--10

create table productos(
	codprod int not null,
	descr varchar(30) not null,
	precunit money not null,
	stock smallint not null)

create table detalle(
	coddetalle int not null,
	numped int not null,
	codprod int not null,
	cant  int not null,
	preciotot money null)

insert into productos values (10,"articulo 1", $50,20)
insert into productos values (20,"articulo 2", $70, 40)

create procedure sp_buscarprecio (@codprod int, @precunit money OUTPUT) as
	select @precunit=precunit
	from productos
	where codprod=@codprod
	return

create proc sp_insertadetalle (@coddetalle int, @numped int, @codprod int, @cant int)
	as
	declare @precioobtenido money
	execute sp_buscarprecio @codprod, @precioobtenido OUTPUT  --ejecuta el proc anterior y me devuelve el precio
	insert detalle values (@coddetalle, @numped, @codprod, @cant, @cant*@precioobtenido)
	if @@rowcount = 1 print 'se inserto una fila'
return


--11
sp_insertadetalle 1540, 120, 10,2

select * from detalle

--12

declare @error int

execute @error=sp_insertadetalle 1540,120,10   -- estado -1: falta objeto

--13

create procedure sp_buscarprecio2 (@codprod int, @precunit money OUTPUT) as
	select @precunit=precunit
	from productos
	where codprod=@codprod
	-- aca empieza la modificacion
	if @@rowcount=0
		return 70  -- no se encontro el producto
	if @precunit is NULL
		return 71
	return 0

create procedure sp_insertadetalle2 @coddetalle int, @numped int, @codprod int, @cant int
	as
	declare @precioobtenido money
	declare @statusretorno int 	-- nuevo !
	execute @statusretorno=sp_buscarprecio2 @codprod, @precioobtenido OUTPUT  --ejecuta el proc anterior y me devuelve el precio
	--empieza lo nuevo
	if @statusretorno != 0 
	begin
		if @statusretorno=70
			raiserror (' codigo de producto inexistente', 16, 1)  -- codigo error completo 
		else
			if @statusretorno=71
				raiserror ('el producto %d no posee precio',16,1,@codprod)
			else
				raiserror ('error en el SP sp_buscar precio2',16,1)
				return 99
	end
	insert detalle values (@coddetalle, @numped, @codprod, @cant, @cant*@precioobtenido)
	if @@error!= 0
		return 77
	if @@rowcount = 1 print 'se inserto una fila'
return 0

sp_insertadetalle2 1540,120,99,2

--14

select pub_id, pub_name into editoriales from publishers where pub_id=0000

select * from editoriales

--15

drop proc sp_publishers

create proc sp_publishers as
	select pub_id, pub_name from publishers

insert editoriales execute sp_publishers

select * from editoriales