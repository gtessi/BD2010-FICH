/*select * from authors
select * from titles
select * from sales
sp_help sales
sp_help titleauthor
select * from titleauthor


group by title_id
sp_columns sales

select T.title_id, sum(qty), au_lname, au_fname from sales S, titles T, authors A, titleauthor TA
where S.title_id = T.title_id and (S.ord_date between '1/1/1993' and '31/12/1994')
	inner join T.title_id = TA.title_id 
	inner join TA.au_id = A.au_id
group by T.title_id, au_lname, au_fname HAVING sum(qty) < 25

select au_lname, au_

select au_lname, au_fname from authors A, titleauthor TA, titles T
where A.au_id = TA.au_id and (TA.title_id = T.title_id and T.title_id = 'BU1032')

select au_lname, au_

select @@rowcount

select T.title_id from authors A, titleauthor TA, titles T
where A.au_id = TA.au_id and TA.title_id = T.title_id
group by T.title_id*/

select au_lname, au_fname from authors A 
	where A.au_id in (select au_id from titleauthor) --posee publicaciones
		and au_id in(select au_id from sales S
				inner join titles T on S.title_id = T.title_id
				inner join titleauthor TA on T.title_id = TA.title_id
				where year(ord_date) in (1993, 1994))
	and 25 > all (select sum(qty) from sales S
			inner join titles T on S.title_id = T.title_id
			inner join titleauthor TA on T.title_id = TA.title_id
		where year(ord_date) in (1993, 1994) and TA.au_id = A.au_id
		group by S.title_id)
	and A.au_id not in (select TA.au_id from titleauthor TA1, titleauthor TA2
				where TA1.title_id = TA2.title_id and TA1.au_id != TA2.au_id)