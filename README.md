# Hotel Booking Trends Dashboard

## Overview
This project analyzes hotel booking data to uncover trends in **cancellations**, **booking lead times**, and **customer behavior**. Using **R** for data cleaning and analysis, and **Tableau** for visualization, the project demonstrates an end-to-end workflow from raw data to an interactive dashboard.

---

## Dataset
- Source: [Hotel Booking Demand Dataset](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand)  
- Size: ~119,000 records  
- Key fields: arrival_date, hotel, is_canceled, lead_time, customer_type, market_segment, country

---

## Tools & Technologies
- **R** (tidyverse, lubridate, ggplot2): data cleaning and analysis  
- **Tableau**: interactive visualizations and dashboard  
- **Git & GitHub**: version control
- 
---

## Key Steps

### 1. Data Cleaning & Analysis (R)
- Removed missing values and corrected data types  
- Created summary statistics:
  - Total bookings  
  - Cancellations by country, hotel type, and time of year  
  - Average lead time by hotel  
- Exported cleaned dataset for Tableau visualization  

### 2. Interactive Dashboard (Tableau)
- **Map**: cancellation rates by country  
- **Bar Chart**: cancellations by hotel type  
- **Line Chart**: bookings over time (total vs cancellations)  
- Added filters for hotel type, customer segment, and market segment  
- [View Dashboard](https://public.tableau.com/views/HotelBookingTrendsDashboard/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Key Insights
- Portugal shows the highest cancellation volume, signaling a need for targeted retention strategies or deeper analysis of regional booking behavior.
- City Hotels face nearly 3× more cancellations than Resort Hotels, suggesting higher churn in urban markets.
- Bookings peaked in 2016 across both hotel types, marking a high point in travel demand. The diverging trends afterward (decline in City Hotels, rise in Resort Hotels) suggest a shift toward leisure travel and changing customer preferences.

---

## How to Run
1. Open `scripts/clean_and_analyze.R` in RStudio  
2. Run the script to clean the data and generate summary statistics  
3. Exported `cleaned_data/hotel_bookings_clean.csv` can be loaded into Tableau to recreate the dashboard  

---

## Author
Aya Nor Elyakine
