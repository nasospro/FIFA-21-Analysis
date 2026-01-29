FIFA 21 Data Analysis: Talent Scouting & Market Value Assessment

###  Project Overview
This repository contains an end-to-end data analysis project based on the FIFA 21 Player Dataset. The objective was to simulate a **"Moneyball" scouting approach** by identifying undervalued players and high-potential talents using data-driven metrics.

The project demonstrates a full ETL (Extract, Transform, Load) pipeline, data modeling, SQL querying, and interactive visualization.

---

###  Tech Stack & Workflow

The analysis follows a structured pipeline:

1.  **Data Cleaning & ETL (Python/Pandas):**
    * Processed raw data (mixed types, currency symbols, metric conversions).
    * Handled missing values and standardized categorical data to prepare the dataset for analysis.

2.  **Data Modeling (Power BI):**
    * Transformed the flat dataset into a **Star Schema** to optimize performance for the dashboard.
        * `Fact_Stats`: Performance metrics, Value, Wage, Release Clause.
        * `Dim_Player`: Player personal details (Name, Age, Nationality).
        * `Dim_Club`: Club information.

3.  **Database Analysis (SQLite & SQL):**
    * Loaded the comprehensive dataset into a local **SQLite database** (`fifa_database`).
    * Performed ad-hoc SQL queries (`SQL_Analysis_Tasks.sql`) on the full table to answer complex business questions (e.g., ranking clubs by average potential, identifying top scorers per nation).

4.  **Visualization (Power BI):**
    * Built a 3-page interactive dashboard focusing on **Talent Discovery** and **ROI Analysis**.
    * Implemented custom DAX measures (e.g., `ROI Index`, `Smart Scout Score`) to quantify value-for-money.
    * Utilized AI visuals (Decomposition Tree) for market segmentation.

---

###  Key Insights & Logic

#### 1. The "Moneyball" Logic (ROI Index)
To identify undervalued players, I created a custom metric called **ROI Index**.
* **Logic:** `(Player Skill / Market Value)`
* **Result:** This highlights players who deliver high performance (OVA/POT) relative to their transfer cost, filtering out overpriced superstars.

#### 2. Dashboard Pages
* **Talent Discovery:** Scatter plots correlating Age vs. Potential to identify "Wonderkids".
* **High ROI Analysis:** A list of cost-effective players suitable for mid-budget teams.
* **Market Intelligence:** A drill-down analysis of which countries and clubs produce the most efficient talent.

---

###  How to Run

1.  **Python ETL:**
    * Install dependencies: `pip install pandas numpy sqlite3`
    * Run `FIFA_Cleaning.ipynb` to process the raw data and generate the output files.

2.  **SQL Analysis:**
    * You can open `fifa_database` using any SQLite viewer (e.g., DB Browser for SQLite).
    * Run the queries found in `SQL_Analysis_Tasks.sql` to verify the insights.

3.  **Power BI:**
    * Open `FIFA_Market_Analysis_Dashboard.pbix` with Microsoft Power BI Desktop.
    * *Note: Ensure the data source paths in Power BI are pointed to the `data/` folder.*

---

*Author: Proestakis Nasos
*Connect on LinkedIn: https://www.linkedin.com/in/nasos-proestakis/
