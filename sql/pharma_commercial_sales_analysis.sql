-- ============================================================
-- PROJECT: Pharma Commercial Sales & Performance Analytics
-- TOOL: MySQL
-- DATASET: Educational / Synthetic Pharmaceutical Sales Data
-- ROWS: 1,000
-- ============================================================


-- ============================================================
-- 1. DATABASE
-- ============================================================

USE pharma_sales;


-- ============================================================
-- 2. DATA VALIDATION
-- ============================================================

-- Check total number of records
SELECT COUNT(*) AS total_records
FROM pharma_sales_data;


-- Preview the dataset
SELECT *
FROM pharma_sales_data
LIMIT 10;


-- ============================================================
-- 3. OVERALL BUSINESS KPIs
-- ============================================================

-- KPI 1: Total Revenue
SELECT
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) AS total_revenue
FROM pharma_sales_data;


-- KPI 2: Total Units Sold
SELECT
    SUM(`Units Sold`) AS total_units_sold
FROM pharma_sales_data;


-- KPI 3: Total Transactions
SELECT
    COUNT(*) AS total_transactions
FROM pharma_sales_data;


-- KPI 4: Average Revenue per Transaction
SELECT
    AVG(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS avg_revenue_per_transaction
FROM pharma_sales_data;


-- ============================================================
-- 4. REVENUE BY DRUG
-- Business Question:
-- Which drugs generate the highest revenue?
-- ============================================================

SELECT
    `Drug Name`,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY `Drug Name`
ORDER BY total_revenue DESC;


-- ============================================================
-- 5. UNITS SOLD BY DRUG
-- Business Question:
-- Which drugs have the highest sales volume?
-- ============================================================

SELECT
    `Drug Name`,
    SUM(`Units Sold`) AS total_units_sold
FROM pharma_sales_data
GROUP BY `Drug Name`
ORDER BY total_units_sold DESC;


-- ============================================================
-- 6. REVENUE BY REGION
-- Business Question:
-- Which regions generate the highest revenue?
-- ============================================================

SELECT
    Region,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY Region
ORDER BY total_revenue DESC;


-- ============================================================
-- 7. REVENUE BY MANUFACTURER
-- Business Question:
-- Which manufacturers generate the highest revenue?
-- ============================================================

SELECT
    Manufacturer,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY Manufacturer
ORDER BY total_revenue DESC;


-- ============================================================
-- 8. REVENUE BY CUSTOMER TYPE
-- Business Question:
-- Which customer types contribute the most revenue?
-- ============================================================

SELECT
    `Customer Type`,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY `Customer Type`
ORDER BY total_revenue DESC;


-- ============================================================
-- 9. TOP 10 SALES REPRESENTATIVES
-- Business Question:
-- Which sales representatives generate the highest revenue?
-- ============================================================

SELECT
    `Sales Representative`,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY `Sales Representative`
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 10. MONTHLY REVENUE TREND
-- Business Question:
-- How does revenue change over time?
-- ============================================================

SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Sale Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS sales_month,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY sales_month
ORDER BY sales_month;


-- ============================================================
-- 11. HIGHEST-REVENUE MONTH
-- ============================================================

SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Sale Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS sales_month,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY sales_month
ORDER BY total_revenue DESC
LIMIT 1;


-- ============================================================
-- 12. LOWEST-REVENUE MONTH
-- ============================================================

SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Sale Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS sales_month,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY sales_month
ORDER BY total_revenue ASC
LIMIT 1;


-- ============================================================
-- 13. REVENUE BY DOSAGE FORM
-- Business Question:
-- Which dosage forms generate the highest revenue?
-- ============================================================

SELECT
    `Dosage Form`,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY `Dosage Form`
ORDER BY total_revenue DESC;


-- ============================================================
-- 14. REVENUE BY REGION AND CUSTOMER TYPE
-- Business Question:
-- Which customer segments generate revenue within each region?
-- ============================================================

SELECT
    Region,
    `Customer Type`,
    SUM(CAST(REPLACE(Revenue, '$', '') AS DECIMAL(12,2))) 
        AS total_revenue
FROM pharma_sales_data
GROUP BY Region, `Customer Type`
ORDER BY total_revenue DESC;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================