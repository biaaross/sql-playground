```sql
-- ==========================================================
-- Project : TechStore SQL Challenge
-- File    : schema.sql
-- ==========================================================

PRAGMA foreign_keys = ON;

------------------------------------------------------------
-- TABLE : brands
------------------------------------------------------------

CREATE TABLE brands (

    brand_id INTEGER PRIMARY KEY AUTOINCREMENT,

    brand_name TEXT NOT NULL UNIQUE

);

------------------------------------------------------------
-- TABLE : categories
------------------------------------------------------------

CREATE TABLE categories (

    category_id INTEGER PRIMARY KEY AUTOINCREMENT,

    category_name TEXT NOT NULL UNIQUE

);

------------------------------------------------------------
-- TABLE : customers
------------------------------------------------------------

CREATE TABLE customers (

    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,

    first_name TEXT NOT NULL,

    last_name TEXT NOT NULL,

    email TEXT NOT NULL UNIQUE,

    city TEXT NOT NULL,

    register_date DATE DEFAULT CURRENT_DATE

);

------------------------------------------------------------
-- TABLE : products
------------------------------------------------------------

CREATE TABLE products (

    product_id INTEGER PRIMARY KEY AUTOINCREMENT,

    product_name TEXT NOT NULL,

    brand_id INTEGER NOT NULL,

    category_id INTEGER NOT NULL,

    price REAL NOT NULL
        CHECK(price > 0),

    stock INTEGER NOT NULL
        CHECK(stock >= 0),

    rating REAL DEFAULT 0
        CHECK(rating BETWEEN 0 AND 5),

    release_year INTEGER
        CHECK(release_year >= 2020),

    sales INTEGER DEFAULT 0
        CHECK(sales >= 0),

    FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)

);

------------------------------------------------------------
-- TABLE : orders
------------------------------------------------------------

CREATE TABLE orders (

    order_id INTEGER PRIMARY KEY AUTOINCREMENT,

    customer_id INTEGER NOT NULL,

    order_date DATE NOT NULL,

    total_amount REAL NOT NULL,

    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)

);

------------------------------------------------------------
-- TABLE : order_items
------------------------------------------------------------

CREATE TABLE order_items (

    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,

    order_id INTEGER NOT NULL,

    product_id INTEGER NOT NULL,

    quantity INTEGER NOT NULL
        CHECK(quantity > 0),

    unit_price REAL NOT NULL
        CHECK(unit_price > 0),

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY(product_id)
        REFERENCES products(product_id)

);
```
