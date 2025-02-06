USE sql_retail_sales_project;

SELECT * FROM retail_sales;
SELECT COUNT(*) FROM retail_sales;

-- Data Exploration

-- How many sales do we have?
SELECT COUNT(*) AS total_sale
FROM retail_sales; 
-- 1987 total sales

-- How many customers do we have?
SELECT COUNT(DISTINCT customer_id) AS num_cust
FROM retail_sales;
-- 155 total customers
