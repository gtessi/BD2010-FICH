create table AutoresBadSeller(				--TABLA PARA GUARDAR LOS DATOS DE LOS AUTORES BORRADOS
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

create table setup(				--SETUP GUARDA EL NOMBRE DE LA TABLA (EJ.: AUTORESBADSELLER) JUNTO CON EL ULTIMO LUGAR DISPONIBLE
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
		RAISERROR('NO SE ENCONTRO LA TABLA',16,1)		--SI LA TABLA DEL SELECT ANTERIOR NO TIENE NADA, ENTRA EN ESTA CONDICION
		rollback					
	RETURN 0

/*     PRUEBA DEL PROCEDIMIENTO sp_obtenerID
declare @ultimo integer,@sp int
exec @sp = sp_obtenerID 'AutoresBadSeller', @ultimo OUTPUT
print @ultimo	
*/

------------------------------------------------------------------------------------------------------

create proc sp_EliminarPublicacion (@au_id varchar(11) = null) As
	if(@au_id is null)
	begin
		raiserror('No se eligio publicacion',16,1)
		rollback
	end

declare CurPub cursor				--BUSCAMOS TODAS LAS PUBLICACIONES QUE HIZO EL AUTOR
	for select title_id
	from titleauthor
	where au_id=@au_id

declare @title_id varchar(6)
open CurPub
fetch next from CurPub into @title_id

while @@fetch_status=0
begin
	delete sales where title_id=@title_id		--ELIMINAMOS LA PUBLICACION DE LAS VENTAS, PARA NO GENERAR INCONSISTENCIAS
	delete titleauthor where title_id=@title_id	--ELIMINAMOS LA PUBLICACION DE LA TABLA DE TITLEAUTHOR, PARA NO GENERAR INCONSISTENCIAS
	delete roysched where title_id=@title_id	--ELIMINAMOS LA PUBLICACION DE LA TABLA ROYSCHED (¿QUE ES ESTA TABLA?), PARA NO GENERAR INCONSISTENCIAS
	delete titles where title_id=@title_id		--ELIMIAMOS POR ULTIMO LA PUBLICACION DE LA TABLA TITLES
	fetch next from CurPub into @title_id		--AVANZAMOS EL CURSOR A LA SIGUIENTE PUBLICACION DEL AUTOR
end
close CurPub
deallocate CurPub
return 0

--------------------------------------------------------------------------------
create proc sp_EliminarAutor (@au_id varchar(11)=null) As
	if (@au_id is null)
	begin
		raiserror('No se eligió autor',16,1)
		rollback
	end
	delete authors where au_id=@au_id		--ELIMINAMOS EL AUTOR DE LA TABLA AUTHORS
	
-----------------------------------------------------------------------------------------------------------------------------------

declare curAu cursor		--ELEGIMOS LOS AUTORES QUE DEBEMOS ELIMINAR CON EL CURSOR
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
open CurAu                                      
fetch next from curAu into @au_id
while @@fetch_status=0
begin
	exec sp_EliminarPublicacion @au_id	--POR CADA AUTOR QUE ELEGIMOS ARRIBA, ELIMINAMOS TODAS SUS PUBLICACIONES
	exec sp_EliminarAutor @au_id		--UNA VEZ ELIMINADAS TODAS LAS ENTRADAS DE LAS OBRAS, ELIMINAMOS EL AUTOR
	fetch next from curAu into @au_id	--AVANZAMOS EL CURSOR AL SIGUIENTE AUTOR
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
					