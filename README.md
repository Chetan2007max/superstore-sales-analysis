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

## Day 2: Python Data Cleaning & Feature Engineering
- Loaded raw CSV with proper encoding, standardized column names
- Converted date columns to proper datetime types; verified no missing values
- Engineered two new features: `profit_margin` (profit/sales) and `shipping_days` (ship_date - order_date)
- Plotted 3-month rolling revenue trend — shows strong Q4 seasonality and consistent year-over-year growth (2014-2017)
- Exported cleaned dataset to `data/superstore_cleaned.csv`

## Status
🚧 In progress — more days/analysis to be added.