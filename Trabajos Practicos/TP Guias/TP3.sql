use pubs
go
/* EJERCICIO 1
select au_lname, au_fname, title
	from authors
		inner join titleauthor on authors.au_id=titleauthor.au_id
		inner join titles on titleauthor.title_id=titles.title_id
	order by au_lname
*/

/* EJERCICIO 2
select pub_name, fname + ' ,' + lname 'Empleado'
	from publishers inner join employee on publishers.pub_id=employee.pub_id
	where job_lvl > 200
*/

/* EJERCICIO 3
select au_lname, au_fname, sum(price * qty) 'Ingresos'
	from authors
		inner join titleauthor on authors.au_id=titleauthor.au_id
		inner join titles on titleauthor.title_id=titles.title_id
		inner join sales on titles.title_id=sales.title_id
	group by au_lname, au_fname
	order by 'Ingresos' desc
*/

/* EJERCICIO 4
select type
	from titles
	group by type
	having avg(price) > 12
*/

/* EJERCICIO 5
select lname, fname
	from employee
	where hire_date = (select max(hire_date) from employee)
*/

/* EJERCICIO 6
select pub_name
	from publishers inner join titles on publishers.pub_id=titles.pub_id
	where type = 'Business'
	group by pub_name

select pub_name
	from publishers
	where pub_id in (select pub_id
			from titles
			where type = 'Business')
*/

/* EJERCICIO 7
select title
	from titles
	where title_id not in
		(
		select title_id
			from sales
			where	year(ord_date) = 1993 or
				year(ord_date) = 1994
		)
*/

/* EJERCICIO 8
select title, pub_name, price
	from titles T inner join publishers P on T.pub_id=P.pub_id
	where price < (select avg(price)
				from titles TT
				where TT.pub_id=T.pub_id)
*/

/* EJERCICIO ADICIONAL BONUSS!
Obtener el titulo y precio de los libros que no se han vendido (para esto mirar la tabla sales)

select title, price
	from titles T
	where not exists
		(select title_id
			from sales
			where T.title_id=sales.title_id)
*/


-- EJERCICIO sin el EXIST

/*Al hacer el INNER JOIN recortamos automaticamente la tabla de titulos eliminando todos los que no
aparecen en la tabla de ventas (sales). Si queremos obtener los libros que no fueron vendidos entre 1993 y 1994
no podemos usar este metodo porque tendriamos que devolver los que no han sido vendidos y esto no ocurre
*/
/*
select titles.title
	from titles inner join sales on titles.title_id=sales.title_id
	where titles.title_id not in
		(
		select sales.title_id
			from sales
			where	year(ord_date) = 1993 or
				year(ord_date) = 1994
		)
	order by title


-- EJERCICIO 9 (con el EXIST)

select title
	from titles T
	where not exists
		(
		select *
			from sales S
			where	T.title_id=S.title_id and
				(year(ord_date) = 1993 or
			        year(ord_date) = 1994)
		)
	order by title
*/

/* EJERCICIO 10
select au_fname, au_lname, 
	case contract
		when 1 then 'si'
		else 'no'
	end
	from authors
	where state = 'CA'
*/

/* EJERCICIO 11
select lname,
	case 
		when  (job_lvl < 200 and job_lvl> 100) then 'Puntaje entre 100 y 200'
		when  job_lvl < 100 then 'Puntaje menor que 100'
		when  job_lvl > 200 then 'Puntaje mayor que 200'
		else ''
	end
	from employee
	order by job_lvl, lname
*/

/* EJERCICIO 12
create view VISTA as
	select au_lname, au_fname, phone, title, type, price
	from titles
		inner join titleauthor on titles.title_id=titleauthor.title_id
		inner join authors on titleauthor.au_id=authors.au_id
	where state='CA'
*/

/* EJERCICIO 13
create view VISTA2 as
	select *
		from titles
		where pub_id=0736

select au_lname + ', '+ au_fname, title
	from VISTA2
		inner join titleauthor on VISTA2.title_id = titleauthor.title_id
		inner join authors on titleauthor.au_id = authors.au_id
*/