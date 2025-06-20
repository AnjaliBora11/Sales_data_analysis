#🛍️ Sales Data Analysis Project
📌 Overview
This project demonstrates a complete data analytics pipeline using a Kaggle retail sales dataset. It covers data extraction, cleaning, transformation, loading into a PostgreSQL database, visualization in Python, and SQL-based business analysis.

#📁 Dataset
	• Source: Kaggle – Sales Dataset ( https://www.kaggle.com/datasets/shantanugarg274/sales-dataset )
	• Format: CSV
	• Contains: Order-level retail sales data including:
		○ Order_id, amount, profit
		○ Customer info
		○ Product category and subcategory
		○ Order date, quantity, and amount
		○ Payment mode and location (city/state)

#🧰 Tools & Technologies
Category	Tools Used
Programming	Python (pandas, matplotlib, seaborn)
Database	PostgreSQL, SQLAlchemy
Data Extraction	kaggle API
Visualization	Matplotlib, Seaborn
SQL Analysis	PostgreSQL with complex queries


#🧮 Project Structure
	1. Data Download & Preparation
		○ Download and extract dataset using Kaggle API
		○ Clean and standardize column names
		○ Calculate sale_price and format order_date
	2. Data Loading
		○ Load cleaned data into a PostgreSQL table df_orders using SQLAlchemy
	3. Data Visualization
		○ Bar charts: top-selling products, payment methods, top states
		○ Line chart: monthly sales trend (2023–2024)
	4. SQL Business Insights
		○ Top 10 revenue-generating products
		○ Most selling subcategories per city
		○ Month-over-month sales growth (2023 vs 2024)
		○ Peak month per category (24-month scale)
		○ Sub-category with highest year-over-year growth

#📊 Sample Visualizations
	• 📦 Top 10 Products by Revenue
	• 🏦 Most Used Payment Modes
	• 🌎 Top 2 States by Sales
	• 📈 Monthly Sales Trend

#🧠 Key Insights
	• Identified top-performing product combinations by revenue
	• Detected regional strengths by analyzing state-wise sales
	• Analyzed customer payment preferences
	• Compared year-over-year performance trends
	• Found the fastest-growing sub-category in 2024

