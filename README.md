# Data Analytics Power BI Report
The report will present a high-level business summary tailored for C-suite executives, and also give insights into the highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of the retail outlets across different territories.

### Table of Contents
* Project Description
* Data Set
* Import and Transform Data Set
* Data Model

### Project Description
The aim is to transform the data into actionable insights for better decision-making using Microsoft Power BI to design a comprehensive Quarterly report. 
This will involve extracting and transforming data from various origins, designing a robust data model rooted in a star-based schema, and then constructing a multi-page report.

### Data Set
Dataset consists of 4 tables: 
Fact Table : Orders
Dimension Tables : Products, Customers and Stores
Additional Tables to create Data MOdel : Date

### Import and Transform Data Set

#### Orders Table:  
The Orders table is your main fact table. It contains information about each order, including the order and shipping dates, the customer, store and product IDs for associating with dimension tables, and the amount of each product ordered. Each order in this table consists of an order of a single product type, so there is only one product code per order.
* ##### Instructions: 
  1. Connect to the Azure SQL Database and import the orders_powerbi table using the Import option in Power BI. You will need to use the Database credentials option.
  2. Navigate to the Power Query Editor and delete the column named [Card Number] to ensure data privacy
  3. Use the Split Column feature to separate the [Order Date] and [Shipping Date] columns into two distinct columns each: one for the date and another for the time
  4. Filter out and remove any rows where the [Order Date] column has missing or null values to maintain data integrity
  5. Rename the columns in your dataset to align with Power BI naming conventions, ensuring consistency and clarity in your report

#### Products Table: 
The Products table contains information about each product sold by the company, including the product code, name, category, cost price, sale price, and weight.
* ##### Instructions:
  1. Download the Products.csv file  and then use Power BI's Get Data option to import the file into your project
  2. In the Data view, use the Remove Duplicates function on the product_code column to ensure each product code is unique
  3. Rename the columns in your dataset to match Power BI naming conventions, ensuring a consistent and clear presentation in your report
 
#### Stores Table:
The Stores table contains information about each store, including the store code, store type, country, region, and address.
* ##### Instructions:
  1. Use Power BI's Get Data option to connect to Azure Blob Storage and import the Stores table into your project
  2. Rename the columns in your dataset to align with Power BI naming conventions, ensuring clarity and consistency in your report
 
#### Customers Table:
The Customers table contains data each of the regions in which the company operates.
* ##### Instructions:
  1. Use the Get Data option in Power BI to import the Customers folder into your project. You'll need to use the Folder data connector.
  2. Navigate to your folder, and then select Combine and Transform to import the data. Power BI will automatically append the three files into one query.
  3. Once the data are loaded into Power BI, create a Full Name column by combining the [First Name] and [Last Name] columns
  4. Delete any obviously unused columns (eg. index columns) and rename the remaining columns to align with Power BI naming conventions

 #### Data Model:

