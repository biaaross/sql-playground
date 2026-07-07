CREATE TABLE trades (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,

    investor_name   TEXT NOT NULL,
    stock_symbol    TEXT NOT NULL,
    sector          TEXT NOT NULL,

    trade_type      TEXT NOT NULL
                    CHECK (trade_type IN ('BUY', 'SELL')),

    quantity        INTEGER NOT NULL
                    CHECK (quantity > 0),

    price           REAL NOT NULL
                    CHECK (price > 0),

    total_amount    REAL NOT NULL
                    CHECK (total_amount > 0),

    profit          REAL,

    trade_date      TEXT NOT NULL
);