

# 1. Total sales, profit, quantity

select 
    sum(Sales) as Total_Sales,
    sum(Profit) as Total_Profit,
    sum(Quantity) as Total_Quantity
from superstore;

# 2. Monthly sales trend

select
    strftime('%Y-%m',"Order Date") as YearMonth,
    sum(Sales) as Monthly_Sales
from superstore
group by YearMonth
order by YearMonth;

# 3. Year-over-Year Sales Comparison

select
    strftime('%Y',"Order Date") as Year,
    sum(Sales) as Total_Sales
from superstore
group by Year
order by Year;

# 4. Top 10 Products by Sales

select 
    "Product Name", 
    sum(Sales) as Total_Sales
from superstore
group by "Product Name"
order by Total_Sales DESC
limit 10;

# 5. Top 10 Customers by Revenue

select
    "Product Name", 
    sum(Sales) as Total_Sales
from superstore
group by "Product Name"
order by Total_Sales DESC
limit 10;

# 6. Category-wise Profit Margin

select 
    Category,
    sum(Profit)/sum(Sales) * 100 as Profit_Margin_Percent
from superstore
geoup by Category;

# 7. Region Performance

select
    Region,
    sum(Sales) as Total_Sales,
    sum(Profit) as Total_Profit
from superstore
group by Region
order by Total_Sales DESC;

# 8. Discount Impact on Profitability

select
    Discount,
    sum(Sales) as Total_Sales,
    sum(Profit) as Total_Profit
from superstore
group by Discount
order by Discount;

# 9. Profit-Loss Analysis

select *
from superstore
where profit < 0
order by profit ASC;

# 10. Segment Contribution %

select
    Segment,
    sum(Sales) as Segment_Sales,
    round(sum(Sales) * 100.0/(select sum(Sales) from superstore),2) as Sales_Percent
from superstore
group by Segment;

# 11. Shipping Time Calculation

select 
    "Order ID",
    "Order Date",
    "Ship Date",
    julianday("Ship Date") - julianday("Order Date") as Shipping_Days
from superstore
order by Shipping_Days DESC;

# 12. Outlier Orders

select 
    "Order ID",
    "Product Name",
    Sales,
    Profit
from superstore
where Sales > 1000 or Profit < 0
order by Sales DESC, Profit ASC
