# Data Analytics Power BI Report
The report will present a high-level business summary tailored for C-suite executives, and also give insights into the highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of the retail outlets across different territories.

### Table of Contents
* Project Description
* Data Loading and Preparation
* Import and Transform Data

### Project Description
The aim is to transform the data into actionable insights for better decision-making using Microsoft Power BI to design a comprehensive Quarterly report. 
This will involve extracting and transforming data from various origins, designing a robust data model rooted in a star-based schema, and then constructing a multi-page report.

### Data Loading and Preparation
Dataset consists of 4 tables: 
Fact Table : Orders
Dimension Tables : Products, Customers and Stores
Additional Tables to create Data MOdel : Date

### Import and Transform Data
* #### Load and Transform: Orders Table:  
The Orders table is your main fact table. It contains information about each order, including the order and shipping dates, the customer, store and product IDs for associating with dimension tables, and the amount of each product ordered. Each order in this table consists of an order of a single product type, so there is only one product code per order.
##### Connection Instruction: 
1. Connect to the Azure SQL Database and import the orders_powerbi table using the Import option in Power BI. You will need to use the Database credentials option.

