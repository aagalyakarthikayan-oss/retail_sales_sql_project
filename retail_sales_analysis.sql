
CREATE DATABASE RetailSalesDB;

USE RetailSalesDB;

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

INSERT INTO retail_sales VALUES
(1, '2026-01-05', 101, 'Female', 24, 'Electronics', 1, 25000, 25000),
(2, '2026-01-08', 102, 'Male', 30, 'Clothing', 2, 1200, 2400),
(3, '2026-01-12', 103, 'Female', 27, 'Beauty', 3, 500, 1500),
(4, '2026-01-18', 104, 'Male', 35, 'Electronics', 1, 45000, 45000),
(5, '2026-02-02', 105, 'Female', 22, 'Clothing', 3, 800, 2400),
(6, '2026-02-10', 101, 'Female', 24, 'Beauty', 2, 650, 1300),
(7, '2026-02-15', 106, 'Male', 29, 'Electronics', 2, 15000, 30000),
(8, '2026-02-20', 107, 'Female', 32, 'Home', 1, 5000, 5000),
(9, '2026-03-03', 108, 'Male', 26, 'Clothing', 4, 1000, 4000),
(10, '2026-03-09', 103, 'Female', 27, 'Beauty', 2, 700, 1400),
(11, '2026-03-14', 109, 'Male', 40, 'Home', 2, 3500, 7000),
(12, '2026-03-22', 110, 'Female', 31, 'Electronics', 1, 32000, 32000),
(13, '2026-04-04', 102, 'Male', 30, 'Clothing', 1, 1500, 1500),
(14, '2026-04-11', 111, 'Female', 25, 'Home', 3, 2000, 6000),
(15, '2026-04-19', 112, 'Male', 28, 'Beauty', 4, 400, 1600);

select * from retail_sales ;
select COUNT(*) AS total_transactions
FROM retail_sales;

select sum(total_amount) as total_revenue
from retail_sales;

select sum(quantity) as total_quantity_sold
from retail_sales;

select round (avg(total_amount),2)as averge_sales
from retail_sales;

select 
product_category,
sum(total_amount) as category_revenue
from retail_sales 
group by product_category
order by category_revenue desc;

SELECT
    MONTH(sale_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY sales_month;

select * from retail_sales
order by total_amount desc 
limit 1;

select product_category,
sum(total_amount) as revenue 
from retail_sales 
group by product_category 
order by revenue desc 
limit 1;

select customer_id,
sum(total_amount) as total_spending
from retail_sales 
group by customer_id
order by total_spending desc;

select customer_id,
count(*) as purchase_count,
sum(total_amount) as total_spending
from retail_sales
group by customer_id 
having count(*) > 1 
order by purchase_count desc ;

select * from retail_sales 
where total_amount > 5000
order by total_amount desc;

select gender ,
count(*) as transactions,
sum(total_amount) as total_revenue
from retail_sales
group by gender ;

select product_category,
round(avg(total_amount),2) as average_sales
from retail_sales
group by product_category
order by average_sales desc ;

select monthname ( sale_date) as sales_month,
count(*) as tota_transactions
from retail_sales
group by month(sale_date),monthname(sale_date)
order by month(sale_date) ;

select transaction_id, count(*) as count_rows
from retail_sales
group by transaction_id
having count(*)>1 ; 

select * from retail_sales
where sale_date is null
or customer_id is null
or product_category is null
or quantity is null
or total_amount is null ;

select*from retail_sales
where total_amount <> quantity * price_per_unit ; 

select count(*) as transactions,
count(distinct customer_id) as unique_customers,
sum(quantity) as units_sold,
sum(total_amount) as revenue,
round(avg(total_amount),2)as avg_transaction_values
from retail_sales ;