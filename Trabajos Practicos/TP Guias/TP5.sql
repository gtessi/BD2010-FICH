/* EJERCICIO BONUS
-- Mostrar mediante el uso de cursores la lista de precios de las publicaciones

declare p cursor for
	select price
		from titles

open p
declare @precio as money

fetch next from p into @precio

while (@@fetch_status=0)
	begin
	print convert(varchar(30), @precio)
	fetch next from p into @precio
	end

*/

/* EJERCICIO 1
use pubs

declare p cursor for
	select price
	from titles
	where pub_id='0736'
	for update

open p

declare @precio money

fetch next from p into @precio

while (@@fetch_status=0)
	begin
	if (@precio >10)
		update titles
		set price=price-(price*.25)
		where current of p
	else
		update titles
		set price=price+(price*.25)
		where current of p

	fetch next from p into @precio
	end
close p
deallocate p

select price from titles
*/

/* EJERCICIO 2
use pubs
select title, price, type, ytd_sales from titles

begin transaction

declare p cursor for
	select price, title, ytd_sales,type
	from titles
	--for update

open p

declare @precio as money
declare @titulo as varchar(80)
declare @ventasanuales as money
declare @tipo as char(12)
declare @rebajadas as smallint
set @rebajadas =0

fetch next from p into @precio, @titulo, @ventasanuales,@tipo

while (@@fetch_status=0)
	begin
	if (@ventasanuales>1000)
		begin
		update titles
		set price=price*(0.9)
		where current of p
		set @rebajadas=@rebajadas+1
		end
	else
		if ((@tipo='popular_comp')or(@titulo like '%computer%'))
			begin
			update titles
			set price=price*(0.5)
			where current of p
			set @rebajadas=@rebajadas+1
			end
		else
			begin
			update titles
			set price=price*(0.75)
			where current of p
			set @rebajadas=@rebajadas+1
			end
	fetch next from p into @precio, @titulo, @ventasanuales,@tipo
	end
close p
deallocate p
commit transaction

select title, price, type, ytd_sales from titles
/*