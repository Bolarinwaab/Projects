# Data Dictionary

## Confirmed from the provided SQL Server screenshot

### dbo.product_data
- Product_ID — product identifier used to relate product records to sales.
- Product — product name.
- Category — product category.
- Cost_Price — product cost price.
- Sale_Price — selling price.
- Brand — product brand.
- Description — product description.

### dbo.product_sales
- Product — visible sales-side product key used in the screenshot join.
- Units_Sold — visible measure used to calculate revenue and cost.

### dbo.discount_data
- Month — month field.
- Discount_Band — discount category.
- Discount — discount value.

## Fields still requiring schema confirmation

Country, transaction/sales date, year derivation and the exact discount-to-sales key must be confirmed from the actual database/export before final dashboard numbers are published.
