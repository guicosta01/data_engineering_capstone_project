#Create an index named ts on the timestamp field.

CREATE INDEX ts ON sales_data (timestamp);

SHOW INDEXES FROM sales_data;
