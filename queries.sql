--queries.sql
--1) Basic: list all books
SELECT * FROM books;

--2) Filter & sort: romance books under $15
SELECT title, price FROM books WHERE category = 'Romance' AND price<15 ORDER BY price DESC;

--3) Join: book title with author name
SELECT b.title, a.name AS author
FROM books b
JOIN authors a ON b.author_id=a.id;

--4) Aggregate: revenue per book
SELECT b.title, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN books b ON oi.book_id=b.id
GROUP BY b.id
ORDER BY revenue DESC;

--5) Window function: rank customers by spending
SELECT name, spent, RANK() OVER (ORDER BY spent DESC) AS rank
FROM (
SELECT c.name, SUM(oi.quantity*oi.unit_price) AS spent
FROM customers c
JOIN orders o ON c.id=o.customer_id
JOIN order_items oi ON o.id=oi.order_id
GROUP BY c.id
) t;

--6) CTE: monthly sales (month from order_date)
WITH monthly AS (
    SELECT substr(order_date,1,7) AS month, SUM(oi.quantity * oi.unit_price)
    FROM orders o JOIN order_items oi ON o.id=oi.order_id
    GROUP BY month
)
SELECT * FROM monthly ORDER by month;

--7) Create a view and an index (run once)
CREATE VIEW top_books AS
SELECT b.id, b.title, SUM(oi.quantity) AS sold
FROM books b JOIN order_items oi ON b.id = oi.book_id
GROUP BY b.id
ORDER BY sold DESC;

CREATE INDEX IF NOT EXISTS idx_order_items_book ON order_items(book_id);

-- 8) Transaction example (pseudo steps — see instructions below)
-- START TRANSACTION;  -- sqlite: BEGIN;
-- update books set stock = stock - 1 where id = 5;
-- insert into orders (...) values (...);
-- insert into order_items (...) values (...);
-- COMMIT;

