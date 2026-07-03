CREATE TABLE books (
    book_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    publisher TEXT NOT NULL,
    category TEXT NOT NULL,
    language TEXT NOT NULL,
    price REAL CHECK (price>0),
    stock INTEGER DEFAULT 0 CHECK (stock>=0),
    published_year INTEGER CHECK (published_year BETWEEN 1900 AND 2100)
);