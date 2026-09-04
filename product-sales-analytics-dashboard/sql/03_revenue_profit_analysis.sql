/*
03_revenue_profit_analysis.sql
Core management analysis. Country/Date columns must be confirmed from source schema.
*/

USE product_sales;
GO

-- Overall product economics
SELECT
    Category,
    Brand,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Gross_Profit) AS Gross_Profit,
    CAST(SUM(Gross_Profit) / NULLIF(SUM(Revenue),0) * 100 AS decimal(10,2)) AS Profit_Margin_Pct
FROM dbo.vw_product_sales_enriched
GROUP BY Category, Brand
ORDER BY Revenue DESC;
GO

-- Product ranking
SELECT TOP (20)
    Product,
    Category,
    Brand,
    SUM(Units_Sold) AS Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Gross_Profit) AS Gross_Profit,
    CAST(SUM(Gross_Profit) / NULLIF(SUM(Revenue),0) * 100 AS decimal(10,2)) AS Profit_Margin_Pct
FROM dbo.vw_product_sales_enriched
GROUP BY Product, Category, Brand
ORDER BY Revenue DESC;
GO
