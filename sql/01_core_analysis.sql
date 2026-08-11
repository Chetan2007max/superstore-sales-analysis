-- Monthly sales & profit trend
SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM sales
GROUP BY month
ORDER BY month;

-- Top 10 products by profit
SELECT product_name, SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- Avg discount & total profit by region
SELECT region, AVG(discount) AS avg_discount, SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_profit DESC;