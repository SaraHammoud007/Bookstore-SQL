-- seeds.sql
INSERT INTO authors (id,name,country) VALUES
  (1,'Jane Austen','UK'),
  (2,'Nicholas Sparks','USA'),
  (3,'Chimamanda Ngozi Adichie','Nigeria'),
  (4,'Stephen King','USA'),
  (5,'Alex Dev','USA');

INSERT INTO books (id,title,author_id,price,published_date,stock,category) VALUES
  (1,'Pride and Prejudice',1,9.99,'1813-01-28',10,'Romance'),
  (2,'The Notebook',2,12.50,'1996-10-01',5,'Romance'),
  (3,'Half of a Yellow Sun',3,14.00,'2006-06-12',4,'Historical'),
  (4,'It',4,18.00,'1986-09-15',2,'Horror'),
  (5,'Learning SQL',5,29.99,'2020-06-01',7,'Tech');

INSERT INTO customers (id,name,email,city,signup_date) VALUES
  (1,'Sara','sara@example.com','Riyadh','2024-01-10'),
  (2,'Ali','ali@example.com','Jeddah','2023-11-05'),
  (3,'Maya','maya@example.com','Beirut','2024-06-20'),
  (4,'Omar','omar@example.com','Cairo','2025-01-15');

INSERT INTO orders (id,customer_id,order_date,status) VALUES
  (1,1,'2025-08-01','completed'),
  (2,2,'2025-07-30','completed'),
  (3,3,'2025-08-10','completed'),
  (4,1,'2025-08-14','pending');

INSERT INTO order_items (id,order_id,book_id,quantity,unit_price) VALUES
  (1,1,1,1,9.99),
  (2,1,2,1,12.50),
  (3,2,3,2,14.00),
  (4,3,5,1,29.99),
  (5,4,5,1,29.99);
