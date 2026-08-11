# Superstore Sales Analysis

An end-to-end sales analysis project using the Kaggle Superstore dataset, covering Excel modeling, Python data cleaning, SQL analytics, and a Power BI dashboard.

## Project Structure
- `data/` — raw and cleaned datasets
- `excel/` — Excel pivot analysis and freight cost sensitivity model
- `notebooks/` — Python data cleaning (Jupyter)
- `sql/` — SQL analysis scripts
- `dashboards/` — Power BI dashboard and screenshot
- `docs/` — business insights summary

## Day 1: Excel Sanity Check & What-If Model
- Verified raw data: ~9,994 rows, ~$2.3M total sales
- Built pivot tables for Category → Sub-Category and Region → Ship Mode breakdowns
- Built a freight cost sensitivity model with Goal Seek to calculate the price increase needed to preserve margin under 5%, 10%, and 15% freight cost increases

## Day 2: Python Data Cleaning & Feature Engineering & SQL Analysis (Core + Advanced)
- Loaded raw CSV with proper encoding, standardized column names
- Converted date columns to proper datetime types; verified no missing values
- Engineered two new features: `profit_margin` (profit/sales) and `shipping_days` (ship_date - order_date)
- Plotted 3-month rolling revenue trend — shows strong Q4 seasonality and consistent year-over-year growth (2014-2017)
- Exported cleaned dataset to `data/superstore_cleaned.csv`

- **SQL Analysis** (Core + Advanced)
- Set up a MySQL database (`sales_db`) and loaded the cleaned dataset (9,994 rows) via `LOAD DATA LOCAL INFILE`
- Verified data integrity: total sales and profit match the Day 1 Excel baseline exactly
- **Core analysis** (`sql/01_core_analysis.sql`):
  - Monthly sales & profit trend
  - Top 10 products by profit — Canon imageCLASS 2200 Advanced Copier leads at $25.2K
  - Regional discount vs. profit — West has the lowest avg discount (10.9%) and highest profit ($108K); Central has the highest avg discount (24%) and lowest profit ($39.7K)
- **Advanced analysis** (`sql/02_advanced_analytics.sql`):
  - Month-over-month growth using `LAG()` window function
  - Customer cohort retention via CTEs — new customer acquisition has dropped sharply since 2014 (595 → 136 → 51 → 11 new customers/year), though retention of the original 2014 cohort remains strong
  - Profit leakage by sub-category — Tables and Bookcases lose money even at moderate discounts, while Binders stays highly profitable even at 37% avg discount, suggesting some categories simply can't absorb discounting the way others can

## Status
🚧 In progress — more days/analysis to be added..