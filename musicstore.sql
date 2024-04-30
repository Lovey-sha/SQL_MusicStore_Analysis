---Q1:Who is the senior most employee based on job title?

SELECT * from employee
ORDER BY levels desc
LIMIT 1;

--Q2:Which countries have the most invoices?

SELECT count(*),billing_country
from invoice
group by billing_country
ORDER BY billing_country desc
LIMIT 1;

---Q3:What are top 3 values of total invoice

SELECT total FROM invoice
order by total desc
limit 3;

--Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns one city that has the highest sum of invoice totals. 
--Return both the city name & sum of all invoice totals */

SELECT billing_city,SUM(total)as sum_of_invoices
from invoice
group by billing_city
order by sum_of_invoices desc
LIMIT 1;

--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer.
--Write a query that returns the person who has spent the most money.*/

SELECT c.customer_id,c.first_name,c.last_name,SUM(i.total)AS tot_cost
FROM customer c
JOIN invoice i on i.customer_id=c.customer_id
GROUP BY c.customer_id
order by tot_cost
LIMIT 1;

--***Moderate/Hard**

-- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A. */

SELECT DISTINCT c.email as Email,c.first_name as Firstname,c.last_name as Lastname
from customer c
join invoice i on c.customer_id=i.customer_id
join invoice_line il on il.invoice_id=i.invoice_id
join track t on il.track_id=t.track_id
join genre g on g.genre_id=t.genre_id
where g.name='Rock'
order by c.email;



-- Q2: Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands. */

SELECT A.name
FROM artist A
JOIN Album Al ON A.artist_id=Al.artist_id
JOIN Track t ON  t.album_id=Al.album_id
JOIN Genre g ON g.genre_id=t.genre_id
WHERE g.name='Rock'
ORDER BY g.name DESC
LIMIT 10;

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT name,milliseconds 
FROM track 
WHERE milliseconds>
(SELECT AVG(milliseconds)
FROM track)
order by milliseconds desc;
