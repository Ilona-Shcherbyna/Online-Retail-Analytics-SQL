# E-commerce Data Analysis Project (Online Retail II)

## 📌 Project Overview
This project demonstrates a professional data analysis workflow using a large-scale e-commerce dataset (over 1 million rows). The primary objective was to transform raw transactional data into actionable business insights by applying data cleaning, calculating key performance indicators (KPIs), and performing customer segmentation using advanced SQL techniques in **PostgreSQL**.

## 🛠 Tech Stack & Skills
* **RDBMS:** PostgreSQL
* **Analytical Tool:** JetBrains DataGrip
* **SQL Techniques:**
    * **Database Views** for creating a clean and consistent data abstraction layer.
    * **Window Functions** (`MIN/MAX OVER PARTITION BY`) for behavioral analysis.
    * **Data Transformation & Type Casting** (`::numeric`) for precise financial calculations.
    * **Conditional Logic** (`CASE WHEN`) for strategic business segmentation.
    * **Date/Time Functions** (`DATE_TRUNC`, `EXTRACT`) for temporal analysis.

## 📂 Project Structure
The analysis script is organized into 4 distinct analytical stages:

### 1. Data Cleaning & Transformation
* Developed a **Golden View** (`v_cleaned_retail`) to serve as a reliable source for all subsequent queries.
* Implemented strict filters to ensure data quality:
    * Removed records with missing `customer_id`.
    * Excluded cancellations and returns (quantity < 0).
    * Filtered out non-commercial entries, such as zero-price items.

### 2. Business KPI Analysis
* **Monthly Revenue:** Analyzed sales dynamics over time using `DATE_TRUNC` to identify growth trends.
* **Market Performance:** Identified Top-10 countries by total revenue and calculated **Average Order Value (AOV)** per country.
* **Operational Insights:** Determined peak sales activity by day of the week to understand customer shopping patterns.

### 3. Advanced Customer Behavior
* Utilized **Window Functions** to identify the first and last purchase dates for every unique customer.
* Analyzed customer order frequency to measure engagement and lifespan within the store's ecosystem.

### 4. Strategic Customer Segmentation
* Implemented a custom segmentation model based on total monetary contribution:
    * **VIP:** High-value customers (> 5,000 total spending).
    * **Regular:** Consistent customers (1,000 - 5,000 total spending).
    * **Low Value/New:** Customers with < 1,000 in total spending.

## 🗄️ Database & Data Source
* **Source Dataset:** [Online Retail II UCI](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) — contains 1M+ transactions.
