-- schema.sql
PRAGMA foreign_keys = ON;

CREATE TABLE authors (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT
);

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER,
    price REAL,
    published_date TEXT,
    stock INTEGER,
    category TEXT,
    FOREIGN KEY (author_id) REFERENCES authors (id)
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    city TEXT,
    signup_date TEXT
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INTEGER PRIMARY KEY,
    order_id INTEGER,
    book_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(book_id) REFERENCES books(id)
)