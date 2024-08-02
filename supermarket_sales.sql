create database Walmart;
use Walmart;
select* from walmartsale;
desc walmartsale;

UPDATE walmartsale
SET Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');
ALTER TABLE walmartsale
MODIFY COLUMN Order_Date DATE;

UPDATE walmartsale
SET Ship_Date = STR_TO_DATE(Ship_Date, '%d-%m-%Y');
ALTER TABLE walmartsale
MODIFY COLUMN Ship_Date DATE;

-- 1 Which category have the highest sales?
create view category_sales as
SELECT Category, ceil(SUM(Sales)) AS total_sales
FROM walmartsale
GROUP BY Category
ORDER BY total_sales DESC;
select * from category_sales;

-- Which products generate the highest profit & sales?
create view product_profit as
SELECT Product_Name, ceil(SUM(Profit)) as total_profit, ceil(SUM(Sales)) AS total_sales
FROM walmartsale
GROUP BY Product_Name
ORDER BY total_profit DESC;
select * from product_profit;

-- 2 Which states have the highest sales volume?
create view state_sales as
SELECT State, CEIL(SUM(Sales)) AS total_sales
FROM walmartsale
GROUP BY State
ORDER BY total_sales DESC;
select * from state_sales;

-- 3 Which specific times of the year recorded the highest sale?
create view monthlySales as 
select month(Order_Date) as months, ceil(SUM(Sales)) AS total_sales
FROM walmartsale
GROUP BY months order by months;
select * from monthlySales;

-- 4 What is the average quantity of products ordered?
create view product_avgquantity as
select Product_Name, AVG(Quantity) as Avg_Quantity
FROM walmartsale
GROUP BY Product_Name 
ORDER BY Avg_Quantity DESC; 
select * from product_avgquantity;

-- 5 Which categories have the highest profits?
create view category_profit as
SELECT Category, CEIL(SUM(Profit)) AS total_profit
FROM walmartsale
GROUP BY Category
ORDER BY total_profit DESC;
select * from category_profit;



