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

 ### Data Model:
 In order to make use of Power BI's time intelligence functions, continuous date table is created, covering the entire time period of our data.
* ##### Instructions:
  * ### Date Table : 
  1. Calendar function is used to create a date table running from the start of the year containing the earliest date in the Orders['Order Date'] column to the end of             the year containing the latest date in the Orders['Shipping Date'] column.
     ##### DAX formula used : Date = CALENDAR(min(Orders[Order Date]), max(Orders[Shipping Date]))
  2. Following columns added to date table which were created using the corresponding DAX formula:
     ##### Day of Week = WEEKDAY('Date'[Date],2)
     ##### Month Number = MONTH('Date'[Date])
     ##### Month Name = FORMAT('Date'[Date],"MMM")
     ##### Quarter = QUARTER('Date'[Date])
     ##### Year = YEAR('Date'[Date]) 
     ##### Start of Year = STARTOFYEAR('Date'[Date])
     ##### Start of Quarter = STARTOFQUARTER('Date'[Date])
     ##### Start of Month = STARTOFMONTH('Date'[Date])
     ##### Start of Week = 'Date'[Date] - WEEKDAY('Date'[Date],2) + 1

  * ### Build Star Schema Data Model
    1. To form a star schema following relationships between the tables were created. all relationships are one-to-many, with a single filter direction flowing from the 
       dimension table side to the fact table side.
        ##### Products[product_code] to Orders[product_code]
        ##### Stores[store code] to Orders[Store Code]
        ##### Customers[User UUID] to Orders[User ID]
        ##### Date[date] to Orders[Order Date]
        ##### Date[date] to Orders[Shipping Date]
    ![image](https://github.com/user-attachments/assets/41276da6-37ee-435f-a682-2d3998973375)


    * ### Measures Table with Key Measures
      1. From the Model view, select Enter Data from the Home tab of the ribbon: Measures Table was created
      2. Following Key measures were created:
         1. Total Orders that counts the number of orders in the Orders table :
            ##### DAX Formula : Total Orders = COUNTROWS(Orders)
         2. Total Revenue that multiplies the Orders[Product Quantity] column by the Products[Sale_Price] column for each row, and then sums the result
            ##### Dax Formula : Total Revenue = SUMX(Orders,Orders[Product Quantity] * RELATED(Products[Sale Price]))
         3. Total Profit, For each row, subtract the Products[Cost_Price] from the Products[Sale_Price], and then multiply the result by the Orders[Product Quantity] then               Sums the result of all rows
            ##### Dax Formula : Total Profit = SUMX(Orders,Orders[Product Quantity] * (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])))
         4. Total Customers that counts the number of unique customers in the Orders table.
            ##### Dax Formula : Total Customers = DISTINCTCOUNT(Orders[User ID])
         5. Total Quantity that counts the number of items sold in the Orders table
            ##### Dax Formula : Total Quantity = Sum(Orders[Product Quantity])
         6. Profit YTD that calculates the total profit for the current year
            ##### Dax Formula : Profit YTD = TOTALYTD([Total Profit],Orders[Order Date])
         7. Revenue YTD that calculates the total revenue for the current year
            ##### DAX Frmula : Revenue YTD = TOTALYTD([Total Revenue],Orders[Order Date])

      * ### Hierarchies - Date and Geography
          * ##### Date Hierarchy
            1. Date hierarchy created using the following levels:Right click on the top most level of the hierarchy to create a date hirerachy then add the rest of levels
            Start of Year
            Start of Quarter
            Start of Month
            Start of Week
            Date
        * ##### Geography Hierarchy
          1. Create a new calculated column in the Stores table called Country that creates a full country name for each row, based on the Stores[Country Code] column,     
            according to the following scheme:
            GB : United Kingdom
            US : United States
            DE : Germany
          2. Create a new calculated column in the Stores table called Geography that creates a full geography name for each row, based on the Stores[Country Region], and               Stores[Country] columns, separated by a comma and a space.
          3. Assigned Data category, as follows:
            World Region : Continent
            Country : Country
            Country Region : State or Province
          4. Create a Geography hierarchy using the following levels:
            World Region
            Country
            Country Region




  
       


 

