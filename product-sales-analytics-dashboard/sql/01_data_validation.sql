/*
01_data_validation.sql
Purpose: profile and validate source tables before dashboard consumption.
Run in SQL Server Management Studio against product_sales.
*/

USE product_sales;
GO

-- 1. Inspect source schemas
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('product_data', 'product_sales', 'discount_data')
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO

-- 2. Basic row counts
SELECT 'product_data' AS table_name, COUNT_BIG(*) AS row_count FROM dbo.product_data
UNION ALL
SELECT 'product_sales', COUNT_BIG(*) FROM dbo.product_sales
UNION ALL
SELECT 'discount_data', COUNT_BIG(*) FROM dbo.discount_data;
GO

-- 3. Product-key coverage. Adjust b.Product if your sales key has a different name.
SELECT
    COUNT_BIG(*) AS sales_rows,
    SUM(CASE WHEN a.Product_ID IS NULL THEN 1 ELSE 0 END) AS missing_product_key,
    SUM(CASE WHEN b.Product IS NULL THEN 1 ELSE 0 END) AS unmatched_product_rows
FROM dbo.product_data a
LEFT JOIN dbo.product_sales b
    ON a.Product_ID = b.Product;
GO

-- 4. Validate source numeric fields.
SELECT
    SUM(CASE WHEN Cost_Price IS NULL OR Cost_Price < 0 THEN 1 ELSE 0 END) AS invalid_cost_price,
    SUM(CASE WHEN Sale_Price IS NULL OR Sale_Price < 0 THEN 1 ELSE 0 END) AS invalid_sale_price
FROM dbo.product_data;
GO

/*
NOTE: Complete validation of Units_Sold, Date, Country and Discount requires
those exact source columns. Confirm the schema output above before enabling
field-specific checks. This prevents fabricated column assumptions.
*/
