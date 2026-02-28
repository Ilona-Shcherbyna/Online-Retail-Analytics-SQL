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
    * **Date/Time Functions** (`DATE_TRUNC`, `EXTRACT`, `TO_CHAR`) for temporal analysis.

## 📂 Project Structure
The analysis script is organized into 5 distinct analytical stages:

### 1. Monthly Revenue Dynamics
* Analyzed sales trends over time using `DATE_TRUNC` to identify growth patterns and monthly performance.

### 2. Sales Performance by Country
* Identified Top-10 geographical markets by total revenue.
* Calculated **Average Order Value (AOV)** to understand purchasing power across different regions.

### 3. Daily Sales Activity
* Determined peak shopping days of the week using `EXTRACT(DOW)` and `TO_CHAR`.
* Provided insights into operational loading and customer behavior patterns.

### 4. Advanced Customer Behavior
* Utilized **Window Functions** to identify the first and last purchase dates for every unique customer.
* Analyzed customer order frequency to measure engagement and lifespan within the store's ecosystem.

### 5. Strategic Customer Segmentation
* Implemented a custom segmentation model based on total monetary contribution:
    * **VIP:** High-value customers (> 5,000 total spending).
    * **Regular:** Consistent customers (1,000 - 5,000 total spending).
    * **Low Value/New:** Customers with < 1,000 in total spending.

## 🗄️ Database & Data Source
* **Source Dataset:** [Online Retail II UCI](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) — contains 1M+ transactions.
