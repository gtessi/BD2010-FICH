select * from sales
select * from titleauthor A where title_id <> ALL(select title_id from titleauthor T where T.title_id != A.title_id)

select title_id from titleauthor group by title_id

select * from publishers

----

select title_id, sum(qty) ventas 
	from sales 
	where ord_date between '1/1/1993' and '31/12/1994' 
	group by title_id 
	having sum(qty)<25


/*
create proc EliminarAutor
	(@title_id varchar(6) = null)
	declare @cant int
	select @cant = count(title_id) from titleauthor where title_id=@title_id
	if (@cant!= 1)
		raiserror('La publicación tiene coautores que no se pueden eliminar', 16,1)
	else*/
		
	
create proc CantVentas
	(@au_id varchar(20) = null)
	declare @cant int
	select @cant = sum(S.qty) from titleauthor TA, sales S where au_id = @au_id 
									and TA.title_id = S.title_id 
									and S.ord_date between '1/1/1993' and '31/12/1994'
	if(@cant>25)
		print 'Este autor no debe ser borrado'
	else
		--LLamar EliminarAutor


create proc EliminarAutor
	(@au_id varchar(11) = null)
	declare curpub cursor
		for select title_id from where au_id=@au_id

	declare @cant int
		select @cant = count(title_id) from titleauthor where title_id=@title_id

------------------------------------------------------------------------------
create table AutoresBadSeller(
	IDAutor 	smallint	not null,
	au_idviejo 	varchar(40),
	au_lname 	varchar(40)	not null,
	au_fname 	varchar(20)	not null,
	phone		char(12)	null,
	address		varchar(40)	null,
	city		varchar(20)	null,
	state		char(2)		null,
	zip		char(5)		null
	)

create table setup(
	Tabla varchar(40) not null,
	ultimo integer
	)

insert Setup values ('AutoresBadSeller', 1)

-------------------------------------------------------------------------------------------

create proc sp_obtenerID (@table_name varchar(40), @ultimo integer OUTPUT) as
	select @ultimo=ultimo
	from setup
	where tabla=@table_name
	if(@@rowcount=0)
		RAISERROR('NO SE ENCONTRO LA TABLA',16,1)
	RETURN 0

/*     PRUEBA DEL PROCEDIMIENTO sp_obtenerID
declare @ultimo integer,@sp int
exec @sp = sp_obtenerID 'AutoresBadSeler', @ultimo OUTPUT
print @ultimo	
*/
------------------------------------------------------------------------------------------------------
create proc sp_EliminarPublicacion (@au_id varchar(11)) As

declare CurPub cursor				--BUSCAMOS TODAS LAS PUBLICACIONES QUE HIZO EL AUTOR
	for select title_id
	from authortitle
	where au_id=@au_id

declare @title_id varchar(6)
open CurPub
fetch next from CurPub into @title_id

while @@fetch_status=0
begin
	delete sales where title_id=@title_id		--ELIMINAMOS LA PUBLICACION DE LAS VENTAS
	delete authortitle where title_id=@title_id	--ELIMINAMOS LA PUBLICACION DE LA TABLA DE AUTHORTITLE
	delete titles where title_id=@title_id		--ELIMIAMOS POR ULTIMO LA PUBLICACION DE LA TABAL TITLES
	fetch next from CurPub into @title_id
end
close CurPub
deallocate CurPub
return 0

--------------------------------------------------------------------------------
create proc sp_EliminarAutor (@au_id varchar(11)) As
	delete authors where au_id=@au_id		--UNA VEZ ELIMINADAS TODAS LAS ENTRADAS DE LAS OBRAS, ELIMINAMOS EL AUTOR
-----------------------------------------------------------------------------------------------------------------------------------

declare curAu cursor
	for select A.au_id from authors A
	where A.au_id IN (select au_id from titleauthor)        	--VEMOS SI TIENE ALGUNA OBRA PUBLICADA
		and A.au_id IN (select au_id from sales 		--VEMOS SI VENDIO OBRAS ENTRE 1993 Y 1994
						inner join titles on sales.title_id = titles.title_id
						inner join titleauthor on titles.title_id = titleauthor.title_id
					where year(ord_date) in (1993,1994)
				)
		and 25 > ALL(select sum(qty) from sales 		--VEMOS SI VENDIO MENOS DE 25 OBRAS EN ESOS AÑOS
						inner join titles T on sales.title_id= T.title_id
						inner join titleauthor TA on T.title_id=TA.title_id
					where year(ord_date) in(1993,1994)
						and TA.au_id = A.au_id
					group by sales.title_id)
		and A.au_id NOT IN(select TA1.au_id               --VEMOS SI UN TITULO TIENE UN UNICO AUTOR
					from titleauthor TA1, titleauthor TA2
					where TA1.title_id=TA2.title_id
					and TA1.au_id != TA2.au_id)


declare @au_id varchar(11)
open CurAu                                      --POR CADA AUTOR QUE ELEGIMOS ARRIBA, ELIMINAMOS TODAS SUS PUBLICACIONES Y LUEGO LO ELIMINAMOS A EL
fetch next from curAu into @au_id
while @@fetch_status=0
begin
	sp_EliminarPublicacion @au_id
	sp_EliminarAutor @au_id
	fetch next from curAu into @au_id
end

close CurAu
deallocate CurAu
---------------------------------------------

create trigger InsertarBadSeller


/* Solucion del profesor:


Select A.au_id
	from authors A    -- posee publicaciones
	where 	A.au_id IN (select au_id from titleauthor)
		and A.au_id IN (select au_id from sales 
	
					inner join titles on sales.title_id = titles.title_id
						inner join titleauthor on titles.title_id = titleauthor.title_id
					where year(ord_date) in (1993,1994)
				)
		and 25 > ALL(select sum(qty) from sales 
						inner join titles T on sales.title_id= T.title_id
						inner join titleauthor TA on T.title_id=TA.title_id
					where year(ord_date) in(1993,1994)
						and TA.au_id = A.au_id
					group by sales.title_id)
		and A.au_id NOT IN(select TA1.au_id               --VER SI UN TITULO TIENE UN UNICO AUTOR
					from titleauthor TA1, titleauthor TA2
					where TA1.title_id=TA2.title_id
					and TA1.au_id != TA2.au_id)
					