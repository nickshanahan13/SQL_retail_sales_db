# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis    
**Database**: `sql_retail_sales_project`


## Objectives

1. **Create a retail sales database**: Populate the database with provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the given dataset.
4. **Business Analysis**: Using SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: `sql_retail_sales_project` is the database beign created. 
- **Table Creation**: I have created a table named `retail_sales` to store the sales data. Table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

```sql
DROP DATABASE IF EXISTS sql_retail_sales_project;
CREATE DATABASE sql_retail_sales_project;
USE sql_retail_sales_project;

-- Create Table

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales 
			(
				transactions_id INT PRIMARY KEY,
                sale_date DATE,
                sale_time TIME,
                customer_id INT,
                gender VARCHAR(6),
                age INT,
                category VARCHAR(15),
                quantity INT,
                price_per_unit FLOAT,
                cogs INT,
                total_sale FLOAT
			);
```

### 2. Data Exploration & Cleaning

- **Record Count**: I determined the total number of records in the dataset.
- **Customer Count**: Counted how many unique customers are in the dataset.
- **Category Count**: I have identified all of the unique product categories in the dataset.
- **Null Value Check**: I check for any null values in the dataset and deleted records with missing data.

```sql
SELECT COUNT(*) AS total_sale
FROM retail_sales;
```
- 1,987 total sales

```sql
SELECT COUNT(DISTINCT customer_id) AS num_cust
FROM retail_sales;
```
- 155 total customers

```sql
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
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

### Q. 1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'

```sql
SELECT * FROM retail_sales
WHERE sale_date = "2022-11-05";
```
### Q. 2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022

```sql
SELECT category, SUM(quantity)
FROM retail_sales
WHERE category = "Clothing"
AND quantity > 3
AND sale_date >= "2022-11-01"
AND sale_date < "2022-11-30";
```
- 68 clothing transactions of more than 3 items sold in Nov-2022.


### Q. 3 Write a SQL query to calculate the total sales (total_sale) for each category.

```sql
SELECT category, SUM(total_sale) AS total_sale_per_cat, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```
- Beauty: 286,270$ total sales, 611 total orders
- Clothing: 309,995$, 698 total orders
- Electronics: 311,445$, total orders 

### Q. 4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

```sql
SELECT ROUND(AVG(age), 2) AS avg_age, category 
FROM retail_sales
WHERE category = "Beauty"
GROUP BY category;
```
- Average age of beauty customers is 40.42

### Q. 5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000;
```
### Q. 6 Write a SQL query to find the total number of transactions (transaction_id) made by both genders in each category.

```sql
SELECT category, gender,
COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender 
ORDER BY category;
```
### Q. 7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

```sql
SELECT YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
ROUND(AVG(total_sale), 2) AS avg_sale
FROM retail_sales
GROUP BY year, month
ORDER BY year DESC;
```
- Best selling month of 2023 was February
- Best selling month of 2022 was July

### Q. 8 Write a SQL query to find the top 5 customers based on the highest total sales 

```sql
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```
### Q. 9 Write a SQL query to find the number of unique customers who purchased items from each category.

```sql
SELECT COUNT(DISTINCT customer_id) AS unique_customers, category
FROM retail_sales
GROUP BY category;
```
### Q. 10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

```sql
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
```
-- End of analysis

## Findings & Reports

- **Customer Demographics**: The dataset included customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: The monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: My analysis identified the top-spending customers and the most popular product categories.
- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

