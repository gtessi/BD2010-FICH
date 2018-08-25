/* CONSULTA DEL PIZARRON (1)*/

-- TENER CUIDADO CON LOS AUTORES QUE NO TIENEN TITULOS VENDIDOS!

select A.au_id, A.au_lname
	from authors A
	where (25 > all (select sum(qty)
				from sales inner join titles
					on sales.title_id=titles.title_id
				inner join titleauthor
					on titles.title_id=titleauthor.title_id
				where year(ord_date) in (1993,1994) and
					titleauthor.au_id=A.au_id
				group by titles.title_id)) and
		A.au_id not in (select TA1.au_id
					from titleauthor TA1, titleauthor TA2
					where TA1.title_id = TA2.title_id and
					TA1.au_id != TA2.au_id) and
		A.au_id in (select au_id from titleauthor)

/* CONSULTA DEL PIZARRON (2) ***NO FUNCIONA***/

select A.au_id, A.au_lname
	from authors A
	where not exists (select titles.title_id, sum(qty)
				from sales inner join titles
					on sales.title_id=titles.title_id
				inner join titleauthor
					on titles.title_id=titleauthor.title_id
				where year(ord_date) in (1993,1994)
					and titleauthor.au_id=A.au_id
				group by titles.title_id
				having sum(qty)>25)
		and not exists (select TA.title_id, count(*)
					from titleauthor TA
					where TA.au_id=A.au_id
					group by TA.title_id
					having count(*)>1)


