USE sql_retail_sales_project;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT * FROM retail_sales
WHERE sale_date = "2022-11-05";

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

SELECT category, SUM(quantity)
FROM retail_sales
WHERE category = "Clothing"
AND quantity > 3
AND sale_date >= "2022-11-01"
AND sale_date < "2022-11-30";
-- 68 clothing transactions of more than 3 items sold in Nov-2022.

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, SUM(total_sale) AS total_sale_per_cat, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Beauty: 286,270$ total sales, 611 total orders
-- Clothing: 309,995$, 698 total orders
-- Electronics: 311,445$, total orders 

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT ROUND(AVG(age), 2) AS avg_age, category 
FROM retail_sales
WHERE category = "Beauty"
GROUP BY category;

-- Average age of beauty customers is 40.42

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by both genders in each category.

SELECT category, gender,
COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender 
ORDER BY category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
ROUND(AVG(total_sale), 2) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY year DESC;
-- Best selling month of 2023 was February
-- Best selling monht of 2022 was July

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT COUNT(DISTINCT customer_id) AS unique_customers, category
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sales
AS
(
SELECT *,
	CASE
		WHEN HOUR(sale_time) <= 12 THEN "Morning"
		WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN "Afternoon"
		ELSE "Evening"
	END AS shift
FROM retail_sales
)
SELECT COUNT(*) AS total_orders, 
shift
FROM hourly_sales
GROUP BY shift;

-- End of analysis