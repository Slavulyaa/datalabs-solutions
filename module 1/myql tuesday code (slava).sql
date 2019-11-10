select title, round(num_of_books*price/num_of_shops, 2) as avg_revenue_per_shop, store_id
from(
select t.title, sum(qty) as num_of_books, group_concat(distinct stor_id) as store_id, price, count(distinct stor_id) as num_of_shops
from sales s
inner join titles t on t.title_id=s.title_id
group by t.title) new_table;
### 
select t.title, t.price, st.stor_name, t.type, t.pubdate
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores as st on st.stor_id=s.stor_id
where t.type = 'business';

select title, price,stor_name,a.city, a.zip, a.state, a.au_lname,new_table.city, new_table.zip,new_table.state
from(
select t.title_id,t.title, t.price, st.stor_name, t.type, t.pubdate, st.city,st.zip, st.state
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores as st on st.stor_id=s.stor_id
where t.type = 'business') new_table
inner join titleauthor ta on ta.title_id=new_table.title_id
inner join authors a on a.au_id=ta.au_id
where new_table.zip = a.zip or new_table.city=a.city or new_table.state=a.state;

create temporary table if not exists store_title_address(
select t.title_id,t.title, t.price, st.stor_name, t.type, t.pubdate, st.city,st.zip, st.state
from titles as t
inner join sales s on s.title_id=t.title_id
inner join stores as st on st.stor_id=s.stor_id
where t.type = 'business');

select * from store_title_address;