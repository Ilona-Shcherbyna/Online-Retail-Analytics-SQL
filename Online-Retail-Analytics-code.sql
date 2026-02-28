-- Create a cleaned view for further analysis
-- This view filters out noise and prepares data for business reporting
CREATE OR REPLACE VIEW retail_results.v_cleaned_retail AS
SELECT
    invoice AS invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    price AS unit_price,
    customer_id,
    country,
    (quantity * price) AS line_total
FROM retail_analysis.online_retail_raw
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND price > 0;

-- 1. Monthly Revenue Dynamics
-- Analyzing how total sales change over time
SELECT
    DATE_TRUNC('month', invoice_date) AS sales_month,
    ROUND(SUM(line_total)::numeric, 2) AS monthly_revenue,
    COUNT(DISTINCT invoice_no) AS total_orders
FROM retail_results.v_cleaned_retail
GROUP BY 1
ORDER BY 1;

-- 2. Sales Performance by Country
-- Identifying top-performing geographical markets
SELECT
    country,
    ROUND(SUM(line_total)::numeric, 2) AS total_revenue,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND((SUM(line_total) / COUNT(DISTINCT invoice_no))::numeric, 2) AS avg_order_value
FROM retail_results.v_cleaned_retail
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Daily Sales Activity
-- Understanding which day of the week is the busiest
SELECT
    TO_CHAR(invoice_date, 'Day') AS day_of_week,
    COUNT(DISTINCT invoice_no) AS order_count
FROM retail_results.v_cleaned_retail
GROUP BY 1, EXTRACT(DOW FROM invoice_date)
ORDER BY EXTRACT(DOW FROM invoice_date);

-- 4. Customer Behavior (Window Functions)
-- Analyzing first and last purchase dates to understand customer lifespan
SELECT DISTINCT
    customer_id,
    MIN(invoice_date) OVER(PARTITION BY customer_id) AS first_purchase_date,
    MAX(invoice_date) OVER(PARTITION BY customer_id) AS last_purchase_date,
    COUNT(invoice_no) OVER(PARTITION BY customer_id) AS total_customer_orders
FROM retail_results.v_cleaned_retail
ORDER BY total_customer_orders DESC;

-- 5. Customer Segmentation (Business Logic)
-- Categorizing customers by their total spending level
SELECT
    customer_id,
    ROUND(SUM(line_total)::numeric, 2) AS total_spent,
    COUNT(DISTINCT invoice_no) AS total_orders,
    MAX(invoice_date) AS last_purchase_date,
    CASE
        WHEN SUM(line_total) > 5000 THEN 'VIP Customer'
        WHEN SUM(line_total) BETWEEN 1000 AND 5000 THEN 'Regular Customer'
        ELSE 'Low Value / New'
    END AS customer_category
FROM retail_results.v_cleaned_retail
GROUP BY customer_id
ORDER BY total_spent DESC;