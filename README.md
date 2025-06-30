# Netflix-Content-Trends-Analysis
Beyond the Red Curtain: Mapping Netflix’s Global Content DNA with SQL &amp; Python. Using Python for cleaning and MySQL for exploration, I mapped Netflix’s global content trends—by genre, runtime, region, and more. Discover what drives the catalog behind your favorite binge, and how data tells the story behind the red curtain.


## 🔍 Overview
Netflix has revolutionized how the world consumes content. Behind the screens lies a treasure trove of data waiting to be decoded.  
In this project, I analyzed Netflix’s global content catalog to identify viewer trends, content distribution, and strategic opportunities using **Python** and **MySQL**.

---

## 📁 The Data
- **Source:** Netflix Movies & TV Shows (Kaggle)
- **Raw Format:** CSV (~8800 rows, 12 columns)
- **Cleaned With:** Python (Pandas, WordCloud)
- **Analyzed With:** SQL (22 real business problems)

---

## 📊 Input Data Preview

| Column Name   | Description                                  |
|---------------|----------------------------------------------|
| show_id       | Unique ID for each title                     |
| type          | Movie or TV Show                             |
| title         | Name of the content                          |
| director      | Director(s) of the title                     |
| country       | Country of production                        |
| date_added    | When it was added to Netflix                 |
| release_year  | Original release year                        |
| rating        | Maturity rating (TV-MA, PG, etc.)            |
| duration      | Length (minutes or seasons)                  |
| listed_in     | Genre categories                             |

---

## 🧼 Python Data Cleaning Highlights

Before running any analysis, I used Python to:
- Handle missing values (director, country, etc.)
- Parse date_added into year_added and month_added
- Extract numeric values from the duration column
- also created a genre WordCloud to visualize dominant content types.
- and more ....

See the detailed notebook here  

---

## Why Python first ❓ 
Python allowed fast exploration and cleanup. With structured, accurate data, SQL could then be used to efficiently answer key business questions.

---

## Business Problems Solved (SQL)

22 real-world problems answered using SQL — including:

🎯 What's the content mix? → ~70% Movies

🎯 What rating dominates? → TV-MA rules

🎯 What’s the longest movie? → Black Mirror (312 mins)

🎯 Which countries work with the most directors? → US, India, UK

🎯 Which directors span multiple genres? → Martin Scorsese, Steven Spielberg, etc.

See the detailed problem and solutins in - 

---

## 📌 Key Insights Delivered
- Movies outnumber Shows: Netflix focuses more on single-session entertainment.
- TV-MA dominates: Mature content rules.
- 2010s content > older decades: Streaming thrives on recent material.
- International Movies + Drama are winning genres.
- Licensed content has metadata gaps (directors, etc.).
- Shorter show runs (1–2 seasons) dominate – quick-viewing behavior.

---

## 🌟 Impact

This project doesn't just analyze data — it uncovers meaningful insights that can directly drive decisions at Netflix across multiple departments.

By combining robust data cleaning in Python with real-world SQL business logic, the project simulates how real data teams operate inside global tech companies. Each insight is tied to a metric that helps refine strategy, uncover inefficiencies, or prioritize investments.

---

## 🌍 Real-World Impact (If This Were Live)

🎯 Content Strategy:
- Identify the most in-demand genres by country or rating.
- Balance the content mix between bingeable short shows and high-engagement long-format films.

🛠️ Product & Engineering:
- Refine recommendation systems using cleaned duration, genre, and rating data.
- Support UI/UX decisions with insights on popular formats, genres, and runtimes.

📈 Growth & Marketing
- Promote titles with universal appeal (e.g., international dramas, comedy + romance crossovers).
- Plan regional campaigns based on high-output or high-diversity countries.

📦 Content Acquisition & Licensing
- Target partnerships with directors working across genres and countries.
- Flag incomplete or missing metadata (e.g., 2500+ titles without directors) to improve catalog quality.

🔮 Forecasting & Planning
- Analyze year-over-year trends in content addition and release.
- Predict which genres or regions will trend next based on growth patterns and past investments.

---

## 🛠️ Tools & Skills Used

Python:  Pandas, NumPy, Matplotlib, WordCloud

SQL:   Joins, Aggregates, CTEs, Date Functions

Data Cleaning & Feature Engineering

Business-Driven Data Analysis

---
