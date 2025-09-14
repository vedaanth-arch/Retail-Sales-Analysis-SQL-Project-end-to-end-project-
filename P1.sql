SELECT * FROM retail_sales.retail_sales_db;
SELECT COUNT(*) FROM retail_sales.retail_sales_db;
select count(distinct customer_id) from retail_sales.retail_sales_db;
select count(distinct category) from retail_sales.retail_sales_db;

select * from retail_sales.retail_sales_db where
transactions_id is null or sale_date is null or sale_time is null or customer_id is null or 
gender is null or category is null or quantity is null or price_per_unit is null or cogs is null or total_sale is null;

delete  from retail_sales.retail_sales_db where
transactions_id is null or sale_date is null or sale_time is null or customer_id is null or 
gender is null or category is null or quantity is null or price_per_unit is null or cogs is null or total_sale is null;

-- (1) Write a SQL query to retrieve all columns for sales made on '2022-11-05:'
select * from retail_sales.retail_sales_db where sale_date='2022-11-05';
-- (2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT 
  *
FROM retail_sales.retail_sales_db
WHERE 
    category = 'Clothing'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
    AND
    quantity >= 4;
-- (3) Write a SQL query to calculate the total sales (total_sale) for each category.:
select category, sum(total_sale) from retail_sales.retail_sales_db group by 1;
-- (4) Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select category,avg(age) from retail_sales.retail_sales_db where category = 'Beauty' group by 1;
-- (5) Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales.retail_sales_db where total_sale = '1000';
-- (6)Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select category,gender,sum(transactions_id) from retail_sales.retail_sales_db group by gender,category order by 1;
-- (7)Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select year(sale_date),month(sale_date),avg(total_sale) from retail_sales.retail_sales_db group by 1,2 order by 1,3;
-- (8)**Write a SQL query to find the top 5 customers based on the highest total sales **:
select customer_id,sum(total_sale)from retail_sales.retail_sales_db group by 1;
-- (9)Write a SQL query to find the number of unique customers who purchased items from each category.:
select category,count(distinct customer_id)from retail_sales.retail_sales_db group by 1;
-- (10)Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales.retail_sales_db
GROUP BY shift;