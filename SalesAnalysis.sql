use company;
select * from sales;
-- find all orders shipped via 'Economy' mode with a total amount greater than 25000.alter
select * from sales 
where ship_mode = 'Economy' and total_amount > 25000;
-- Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
select * from sales 
where Category = 'Technology' and Country = 'Ireland' and Order_Date > '01-01-2020';
-- List the top 10 most profitable sales transactions in descending order.
select * from sales
order by Unit_Profit desc
limit 10;

-- Find all customers whose name starts with 'J' and ends with 'n';
select order_id,customer_name from sales 
where customer_name like 'J%n';
-- Retrieve all product names that contain 'Acco' anywhere in the name.
select Order_Id,Product_Name from sales
where Product_Name like '%Acco%';

-- Get the top 5 cities with the highest total sales amount.
select city,sum(total_amount) as total_sales from sales 
group by city
order by total_sales desc
limit 5;

-- Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order.
select Customer_Name,Total_Amount from sales 
order  by Total_amount desc
limit 10, 10;

-- Find the total revenue,average unit cost, and total number of orders.
select sum(Total_Amount) as `TOTAL REVENUE`,
       avg(Unit_Cost) as `average_unit_cost`,
       count(Order_Id) as `total number of orders`
from sales;

-- count unique number of regions
select  count(distinct(Region)) as uniq_reg from sales;

-- Find the number of orders placed by each customer.
select Customer_Name,COUNT(Order_ID) AS Order_Count
from sales
group by Customer_Name
order by Order_Count desc; 

-- Rank 5 products based on total sales using RANK().
select Product_Name,sum(Total_Amount) as Total_Sales,
       Rank() over (order by sum(Total_Amount) desc) as Sales_Rank
from sales
group by Product_Name;
       

