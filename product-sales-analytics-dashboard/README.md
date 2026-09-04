# Product Sales Analytics Dashboard

## Executive Objective

This project converts management's request for a one-page Product Analytics Dashboard into a production-ready SQL analytics layer and dashboard specification.

### Management questions answered

1. Which countries generate the most revenue?
2. How does revenue trend by date and year?
3. How are profit and unit sales changing year over year?
4. How is revenue distributed across discount bands?
5. What are revenue and profit by country and year?
6. What additional KPIs should management monitor?

## KPI Framework

- **Revenue** = Sale Price × Units Sold
- **Total Cost** = Cost Price × Units Sold
- **Gross Profit** = Revenue − Total Cost
- **Profit Margin** = Gross Profit ÷ Revenue
- **Units Sold** = Sum of units sold
- **Average Selling Price** = Revenue ÷ Units Sold
- **YoY % Change** = (Current Year − Prior Year) ÷ Prior Year

## Architecture

The SQL layer separates raw source data from reusable analytical views. Validation checks are included before executive metrics are consumed by a BI tool such as Power BI or Tableau.

```text
Product Data ─────┐
                  ├──> Validated Sales Model ──> KPI Views ──> Dashboard
Sales Data ───────┤                                  │
                  └──> Data Quality Checks            └──> Management Insights
Discount Data ────────────────────────────────────────────────┘
```

## Repository Structure

```text
product-sales-analytics-dashboard/
├── README.md
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_product_sales_model.sql
│   ├── 03_revenue_profit_analysis.sql
│   ├── 04_yoy_analysis.sql
│   ├── 05_discount_analysis.sql
│   └── 06_dashboard_views.sql
├── dashboard/
│   ├── dashboard_requirements.md
│   └── kpi_definitions.md
├── analysis/
│   └── management_insights.md
└── documentation/
    └── data_dictionary.md
```

## Important data note

The screenshots establish the SQL Server environment and the visible product fields, but they do not expose the complete underlying sales rows. Therefore this repository contains the complete analytical implementation and validation framework without fabricating business results. Once the source sales table/export is available, the views produce the actual management figures.

## Recommended dashboard layout

- Top row: Revenue | Gross Profit | Profit Margin | Units Sold | YoY Revenue
- Left: Revenue by Country
- Centre: Revenue Trend by Year/Date
- Right: Revenue by Discount Band
- Bottom: Profit and Units Sold YoY
- Detail section: Country × Year Revenue, Cost, Profit and Margin

## Data-quality principles

The solution explicitly checks for null keys, invalid prices, non-positive units, unmatched products, duplicate records and invalid dates. Records failing validation should be investigated rather than silently excluded.

## Portfolio value

This project demonstrates SQL analytics, dimensional modelling, KPI design, data quality, YoY analysis, dashboard requirements gathering and management-focused storytelling.
