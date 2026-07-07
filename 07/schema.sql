CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    brand TEXT NOT NULL,
    supplier TEXT NOT NULL,
    price REAL NOT NULL CHECK (price > 0),
    stock INTEGER DEFAULT 0 CHECK (stock >= 0),
    rating REAL CHECK (rating BETWEEN 0 AND 5),
    sales INTEGER DEFAULT 0 CHECK (sales >= 0),
    release_year INTEGER CHECK (release_year BETWEEN 2015 AND 2025),
    country TEXT NOT NULL
);