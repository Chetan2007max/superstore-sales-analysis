-- Month-over-month sales growth using window function LAG()
WITH monthly_sales AS (
  SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month, SUM(sales) AS total_sales
  FROM sales
  GROUP BY month
)
SELECT month, total_sales,
       LAG(total_sales) OVER (ORDER BY month) AS prev_month_sales,
       ROUND(100.0 * (total_sales - LAG(total_sales) OVER (ORDER BY month))
             / LAG(total_sales) OVER (ORDER BY month), 2) AS mom_growth_pct
FROM monthly_sales
ORDER BY month;


-- Customer cohort retention: how many customers from each cohort year stay active in later years
WITH first_purchase AS (
  SELECT customer_id, MIN(YEAR(order_date)) AS cohort_year
  FROM sales
  GROUP BY customer_id
)
SELECT f.cohort_year, YEAR(s.order_date) AS order_year,
       COUNT(DISTINCT s.customer_id) AS active_customers
FROM sales s
JOIN first_purchase f ON s.customer_id = f.customer_id
GROUP BY f.cohort_year, order_year
ORDER BY f.cohort_year, order_year;


-- Profit leakage: sub-categories with heavy average discounting and their resulting profit
SELECT sub_category, AVG(discount) AS avg_discount, SUM(profit) AS total_profit
FROM sales
GROUP BY sub_category
HAVING AVG(discount) > 0.20
ORDER BY total_profit ASC;