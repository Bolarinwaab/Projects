/*
06_dashboard_views.sql
Reusable BI views. Date/country fields are intentionally left for schema-confirmed implementation.
*/

USE product_sales;
GO

CREATE OR ALTER VIEW dbo.vw_product_kpi AS
SELECT
    SUM(Units_Sold) AS Units_Sold,
    CAST(SUM(Revenue) AS decimal(19,2)) AS Revenue,
    CAST(SUM(Total_Cost) AS decimal(19,2)) AS Total_Cost,
    CAST(SUM(Gross_Profit) AS decimal(19,2)) AS Gross_Profit,
    CAST(SUM(Gross_Profit) / NULLIF(SUM(Revenue),0) * 100 AS decimal(10,2)) AS Profit_Margin_Pct,
    CAST(SUM(Revenue) / NULLIF(SUM(Units_Sold),0) AS decimal(19,2)) AS Avg_Selling_Price
FROM dbo.vw_product_sales_enriched;
GO

CREATE OR ALTER VIEW dbo.vw_product_performance AS
SELECT
    Product,
    Category,
    Brand,
    SUM(Units_Sold) AS Units_Sold,
    CAST(SUM(Revenue) AS decimal(19,2)) AS Revenue,
    CAST(SUM(Total_Cost) AS decimal(19,2)) AS Total_Cost,
    CAST(SUM(Gross_Profit) AS decimal(19,2)) AS Gross_Profit,
    CAST(SUM(Gross_Profit) / NULLIF(SUM(Revenue),0) * 100 AS decimal(10,2)) AS Profit_Margin_Pct
FROM dbo.vw_product_sales_enriched
GROUP BY Product, Category, Brand;
GO
