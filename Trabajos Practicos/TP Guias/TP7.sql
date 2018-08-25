/* EJERCICIO 1
create trigger disparador
	on cliente
	for insert, delete
	as
	if (@@error !=0)
		raiserror ("La cantidad de filas afectadas es %d.",16,1,@@rowcount)
*/

/* EJERCICIO 2
use master
exec sp_help sysobjects
*/

/* EJERCICIO 3
use pubs
select * from sysobjects
*/

/* EJERCICIO 4
sp_helptext employee_insupd
*/

/* EJERCICIO 5
select * into autores from authors

create trigger disp
	on autores
	for insert, update, delete
	as
	if (@@error !=0)
		raiserror ("La cantidad de filas afectadas es %d.",16,1,@@rowcount)

delete autores where au_id = '172-32-1176'
delete autores where au_id = '213-46-8915'
*/

/* EJERCICIO 6
create trigger tr_autores_iu
	on autores
	for insert, update
	as
		declare @insertados as smallint
		set @insertados = (select count (*) from inserted)
		declare @eliminados as smallint
		set @eliminados = (select count (*) from deleted)
		print 'Datos insertados en transaction log ' + convert (varchar (10),@insertados)
		print 'Datos eliminados en transaction log ' + convert (varchar (10),@eliminados)

insert autores
	values ('111-11-1111', 'Lyne','Jeff', '415 658-9932', 'Galvez y Ochoa', 'Berkeley','CA','94705',1)
update autores
	set au_fname = 'Nicanor' where au_id = '111-11-1111'
*/

create trigger tr_productos_ui
	on productos
	for insert
	as
	if ()
