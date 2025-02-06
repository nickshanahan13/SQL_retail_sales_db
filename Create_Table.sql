-- SQL Retail Sales Analysis

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

