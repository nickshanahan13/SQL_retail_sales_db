USE sql_retail_sales_project;

-- DATA Cleaning 

SELECT * FROM  retail_sales;

SELECT COUNT(*) FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
	transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    gender IS NULL
    OR 
    category IS NULL
    OR 
    customer_id IS NULL
    OR
    age IS NULL
    OR
    quantity IS NULL
    OR 
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR 
    total_sale IS NULL;
    
    DELETE FROM retail_sales
    WHERE
		transactions_id IS NULL
    OR
    sale_date IS NULL
    OR
    sale_time IS NULL
    OR
    gender IS NULL
    OR 
    category IS NULL
    OR 
    customer_id IS NULL
    OR
    age IS NULL
    OR
    quantity IS NULL
    OR 
    price_per_unit IS NULL
    OR
    cogs IS NULL
    OR 
    total_sale IS NULL;
    
    
    