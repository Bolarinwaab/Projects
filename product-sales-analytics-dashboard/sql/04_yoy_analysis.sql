/*
04_yoy_analysis.sql
Year-over-year analysis template.

Replace Sales_Date with the confirmed date column from dbo.product_sales.
*/

USE product_sales;
GO

/*
CREATE OR ALTER VIEW dbo.vw_product_sales_yearly AS
SELECT
    YEAR(Sales_Date) AS Sales_Year,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Gross_Profit) AS Gross_Profit
FROM dbo.vw_product_sales_enriched
GROUP BY YEAR(Sales_Date);
GO

WITH yearly AS (
    SELECT * FROM dbo.vw_product_sales_yearly
), yoy AS (
    SELECT
        Sales_Year,
        Units_Sold,
        Revenue,
        Gross_Profit,
        LAG(Units_Sold) OVER (ORDER BY Sales_Year) AS Prior_Units_Sold,
        LAG(Revenue) OVER (ORDER BY Sales_Year) AS Prior_Revenue,
        LAG(Gross_Profit) OVER (ORDER BY Sales_Year) AS Prior_Gross_Profit
    FROM yearly
)
SELECT
    Sales_Year,
    Units_Sold,
    Revenue,
    Gross_Profit,
    CAST((Units_Sold - Prior_Units_Sold) * 100.0 / NULLIF(Prior_Units_Sold,0) AS decimal(10,2)) AS Units_Sold_YoY_Pct,
    CAST((Revenue - Prior_Revenue) * 100.0 / NULLIF(Prior_Revenue,0) AS decimal(10,2)) AS Revenue_YoY_Pct,
    CAST((Gross_Profit - Prior_Gross_Profit) * 100.0 / NULLIF(Prior_Gross_Profit,0) AS decimal(10,2)) AS Profit_YoY_Pct
FROM yoy
ORDER BY Sales_Year;
*/
