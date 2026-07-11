CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    brand TEXT NOT NULL,
    category TEXT NOT NULL,
    country TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0),
    rating REAL NOT NULL CHECK(rating BETWEEN 1 AND 5),
    sales INTEGER NOT NULL DEFAULT 0 CHECK(sales >= 0),
    release_year INTEGER NOT NULL CHECK(release_year BETWEEN 2018 AND 2026)
);