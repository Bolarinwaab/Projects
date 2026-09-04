/*
02_product_sales_model.sql
Analytical fact view: product sales enriched with product economics.

IMPORTANT: confirm the schema from 01_data_validation.sql before running.
The screenshot confirms Product_ID, Product, Cost_Price, Sale_Price and Units_Sold.
*/

USE product_sales;
GO

CREATE OR ALTER VIEW dbo.vw_product_sales_enriched AS
SELECT
    s.Product,
    p.Product_ID,
    p.Category,
    p.Brand,
    p.Cost_Price,
    p.Sale_Price,
    s.Units_Sold,
    CAST(p.Sale_Price * s.Units_Sold AS decimal(19,2)) AS Revenue,
    CAST(p.Cost_Price * s.Units_Sold AS decimal(19,2)) AS Total_Cost,
    CAST((p.Sale_Price - p.Cost_Price) * s.Units_Sold AS decimal(19,2)) AS Gross_Profit,
    CAST(CASE WHEN p.Sale_Price = 0 THEN NULL
              ELSE (p.Sale_Price - p.Cost_Price) / p.Sale_Price
         END AS decimal(12,4)) AS Unit_Margin
FROM dbo.product_sales AS s
INNER JOIN dbo.product_data AS p
    ON p.Product_ID = s.Product;
GO

-- Base economic summary
SELECT
    SUM(Units_Sold) AS Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Gross_Profit) AS Gross_Profit,
    CAST(SUM(Gross_Profit) / NULLIF(SUM(Revenue),0) AS decimal(12,4)) AS Profit_Margin
FROM dbo.vw_product_sales_enriched;
GO
