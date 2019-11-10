

select authors.au_id as author_id,au_lname as last_name,au_fname as first_name,title,pub_name as publisher
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id order by authors.au_id;

select authors.au_id as author,au_lname as last_name,au_fname as first_name,pub_name as publisher,count(title)
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id
group by authors.au_id,publishers.pub_id;
# count sum of count title
select sum(save.Title_count) from(
select authors.au_id as author,au_lname as last_name,au_fname as first_name,pub_name as publisher,count(title) as Title_count
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id
group by authors.au_id,publishers.pub_id) save;

### best selling authors
select authors.au_id as author_id,au_lname as last_name,au_fname as first_name,sum(qty) as vol_books, count(titles.title_id) as vol_titles
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titleauthor.title_id = titles.title_id
inner join publishers on publishers.pub_id = titles.pub_id
inner join sales on sales.title_id = titles.title_id
group by authors.au_id order by vol_titles desc limit 3;

### challenge 4
select authors.au_id as author_id,au_lname as last_name,au_fname as first_name,sum(qty) as vol_books, count(titles.title_id) as vol_titles
from authors
left join titleauthor on titleauthor.au_id = authors.au_id
left join titles on titleauthor.title_id = titles.title_id
left join publishers on publishers.pub_id = titles.pub_id
left join sales on sales.title_id = titles.title_id
group by authors.au_id order by vol_books desc limit 23;
