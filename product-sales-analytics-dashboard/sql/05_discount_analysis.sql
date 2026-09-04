/*
05_discount_analysis.sql
Discount-band analysis template.

The screenshot confirms dbo.discount_data with Month, Discount_Band and Discount.
Join this table to the sales model using the confirmed business key/date mapping.
Do not join on Month alone unless Month is the intended grain.
*/

USE product_sales;
GO

-- Inspect discount bands first
SELECT
    Discount_Band,
    MIN(Discount) AS Min_Discount,
    MAX(Discount) AS Max_Discount,
    COUNT_BIG(*) AS Records
FROM dbo.discount_data
GROUP BY Discount_Band
ORDER BY Min_Discount;
GO

/*
After confirming the date/month key in product_sales, expose:

Revenue by Discount Band
SELECT
    d.Discount_Band,
    SUM(e.Revenue) AS Revenue,
    SUM(e.Gross_Profit) AS Gross_Profit,
    CAST(SUM(e.Revenue) * 100.0 / NULLIF(SUM(SUM(e.Revenue)) OVER (),0) AS decimal(10,2)) AS Revenue_Share_Pct
FROM dbo.vw_product_sales_enriched e
JOIN dbo.discount_data d ON ...
GROUP BY d.Discount_Band
ORDER BY Revenue DESC;
*/
