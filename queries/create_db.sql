GRANT ALL PRIVILEGES ON sales.* TO 'myuser'@'%';

CREATE DATABASE sales;

CREATE TABLE sales_data (
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (product_id, customer_id, timestamp)
);
