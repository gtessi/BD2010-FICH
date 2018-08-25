use pubs

EJERCICIO 1

select title_id, title, type, price + price *0.08
	from titles
	order by type, title

EJERCICIO 2
select title_id, title, type, price + price *0.08 'Precio Actualizado'
	from titles
	order by type, title

EJERCICIO 3

select title_id, title, type, price + price *0.08 'Precio Actualizado'
	from titles
	order by price desc

EJERCICIO 4

select title_id, title, type, price + price *0.08 'Precio Actualizado'
	from titles
	order by 4 desc

EJERCICIO 5
select au_lname + ',' + au_fname 'Listado de autores'
	from authors
	order by 'Listado de autores'

EJERCICIO 6 y 7

select title_id + ' Posee un valor de $' + convert(varchar,price)
	from titles

EJERCICIO 8
exec sp_help
*/

EJERCICIO 9
exec sp_help authors

EJERCICIO 10
select title, price
	from titles
	where not price > 13

EJERCICIO 11
select lname, hire_date
	from employee
	where hire_date between '01/01/91' and '01/01/91'

EJERCICIO 12
select au_id, address, city
	from authors
	where au_id in ('172-32-1176','238-95-7766')

select au_id, address, city
	from authors
	where au_id not in ('172-32-1176','238-95-7766')

EJERCICIO 13
select title_id, title
	from titles
	where title like '%Computer%'

EJERCICIO 14

select pub_name, city, state
	from publishers
	where state = null

EJERCICIO 15
exec sp_help publishers
*/

EJERCICIO 16
select count (*) from titles
select count (*) from titles where price is not null
*/

EJERCICIO 17
select count(distinct price)
	from titles

EJERCICIO 18
select lname, fname
	from employee
	where hire_date = (select max(hire_date) from employee)

EJERCICIO 19
select sum(convert(money, price) * ytd_sales) from titles

EJERCICIO 20
select sum(qty)
	from sales
	where MONTH(ord_date)=6

EJERCICIO 21
select name from sysobjects where type='U' --Tablas de Usuario
select name from sysobjects where type='S' --Tablas de Sistema
select name from sysobjects where type='V' --Vistas
select name from sysobjects where type='P' --Procedimientos almacenados
select name from sysobjects where type='TR'--Desencadenador
select name from sysobjects where type='K' --Restriccion PRIMARY KEY o UNIQUE
select name from sysobjects where type='F'--Restriccion FOREIGN KEY

