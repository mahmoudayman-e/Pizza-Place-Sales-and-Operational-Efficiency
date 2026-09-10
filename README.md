# Pizza Place Sales & Operational Efficiency - End-to-End Analytics Project

## 📌 Project Overview
This repository features an enterprise-grade, end-to-end **Pizza Place Sales & Operational Efficiency Analytics** solution. This project demonstrates a full data engineering and analysis pipeline: utilizing **SQL** for relational database querying, multi-table joins, and backend transactional auditing, combined with **Power BI** to deliver an interactive executive dashboard.

The primary commercial objective of this project is to analyze transaction-level restaurant records to optimize supply chain pipelines, understand customer purchasing habits, balance daily staffing schedules, and engineer high-value menus.

---

## 🛠️ Technical Toolkit & Skills Demonstrated
* **Database Analytics & Querying (SQL):** Authored performant scripts leveraging multi-table relations (`JOIN`), data formatting (`strftime`), analytical aggregates, and subqueries to audit restaurant transactions.
* **Business Intelligence (Power BI Desktop):** Structured a clean, modern user interface incorporating corporate brand-driven visual consistency and layout balance.
* **Analytical Modeling (DAX):** Formulated foundational metrics including dynamic averages (`Average Items per Order`), transaction counts (`Number of Orders`), and volumetric data formatting.

---

## 🗄️ SQL Data Auditing & Transactional Querying
Before developing the visual dashboard layer, backend relational query routines were executed to establish a verified baseline of corporate KPIs and operational thresholds.

```sql
-- 1. Calculating Basket Size: Average Pizzas Per Order (Subqueries)
SELECT 
    AVG(pizza_count) AS avg_pizzas_per_order
FROM (
    SELECT order_id, SUM(quantity) AS pizza_count
    FROM order_details
    GROUP BY order_id
);

-- 2. Menu Engineering: Top 5 Highest Revenue Contributors (Multi-Table Joins)
SELECT
    pt.name,
    SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id 
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 5;

-- 3. Temporal Performance: Monthly Sales Seasonality Analysis
SELECT
    strftime('%m', o.order_date) AS month,
    SUM(od.quantity * p.price) AS total_revenue
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY month
ORDER BY month;
```

---

## 📊 Dashboard Architecture & Analytical Features
<img width="947" height="538" alt="pizza" src="https://github.com/user-attachments/assets/2dfde456-959d-4ed6-9efb-b5f1a156c363" />

### 1. Executive Operational KPIs
* **Top-Line Revenue:** Summarizes absolute gross sales achievement standing at **$817.86K**.
* **Volume Metrics:** Monitors absolute operational output tracking **50K Total Pizzas Sold** across **21K Independent Orders**.
* **Basket Analysis:** Computes a consolidated customer basket size averaging **2.32 Items per Order**.

### 2. Temporal & Operational Bottleneck Analysis
* **Monthly Revenue (Seasonality):** Tracks seasonal consumer behavior, exposing peak sales performance during July ($72.6K) against low volume cycles in September ($4.2K).
* **Peak Hour Workflow:** Isolates ordering spikes across daily business hours, clearly identifying intense operational rush periods at **12:00 PM - 1:00 PM (Lunch Rush)** and **5:00 PM - 6:00 PM (Dinner Rush)**.

### 3. Product Line & Menu Performance
* **Orders by Pizza Category:** Features a high-density donut chart grouping volume sales by style verticals: **Classic (27%)**, **Supreme (25%)**, **Veggie (24%)**, and **Chicken (24%)**.
* **Menu Engineering Matrix:** Side-by-side horizontal bar charts benchmark the highest and lowest revenue contributors to optimize product inventories.




---

## 🚀 Execution Instructions
1. Navigate to the SQL script file to execute business query metrics on your database instance.
2. Open the compiled project framework using **Power BI Desktop**.
3. Utilize the dark left-hand navigation panel to cross-filter across specific sizes or categories to observe dynamic visual modifications instantly.
