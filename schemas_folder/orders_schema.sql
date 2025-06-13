--  -- // ORDERS \\ -- -- 

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_delivery_address TEXT,
    order_total_price REAL,
    order_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);