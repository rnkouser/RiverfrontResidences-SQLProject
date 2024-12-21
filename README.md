## Overview
This project involves cleaning and organizing data in the Riverfront_Residences table using various SQL queries. Below is a detailed description of each step involved.

## SQL Skills Used
- Basic SQL Queries: Retrieving all rows and columns from a table.
- Data Type Conversion: Using CONVERT() to change data types.
- Data Updates: Using UPDATE statements to modify data in the table.
- Table Alterations: Adding new columns with ALTER TABLE.
- Conditional Logic: Using CASE statements for conditional updates.
- String Functions: Using SUBSTRING(), CHARINDEX(), and PARSENAME() for string manipulation.
- Handling NULL Values: Using ISNULL() to manage null values.
- Joining Tables: Using JOIN to combine data from the same table.
- Common Table Expressions (CTEs): Using WITH for removing duplicates.
- Grouping and Aggregating: Using GROUP BY and COUNT() for aggregating data.
- Ordering Results: Using ORDER BY to sort query results.
## Software requirements:
- SQL Server Management Studio (SSMS): To run SQL queries and manage the database.
## Queries and Analysis

1. Retrieving All Data

![Screenshot 2024-12-20 223807](https://github.com/user-attachments/assets/edd24dd2-a04a-4bfd-a94d-929b1b53c98a)

2. Standardize Date Format
-  Converts SaleDate to Date format

![image](https://github.com/user-attachments/assets/317c4a5f-1487-4df2-b15f-8691888b53ca)

- Updates the SaleDate column to its Date format for all records

 ![image](https://github.com/user-attachments/assets/d055b308-07cf-4c3f-b331-962b33af5f12)

3. Populate Property Address Data

![image](https://github.com/user-attachments/assets/be8e1d26-76be-490c-a1ca-18094c745cf4)

-  Using Join to Fill Null Values:

![image](https://github.com/user-attachments/assets/e46041c5-b8b5-4f74-aa08-09c1a8a3e7a1)

-  Fills null PropertyAddress values by joining on ParcelID
-  Updates PropertyAddress with non-null values.

![image](https://github.com/user-attachments/assets/814ae50a-ad65-49b7-a4cf-b607ab06bf02)

4. Breaking Out Address into Individual Columns (Address, City, State), Retrieve PropertyAddress values.

![image](https://github.com/user-attachments/assets/ca9fbe86-a71a-4303-af43-dc9a437a87a8)

- Splitting Address:

  ![image](https://github.com/user-attachments/assets/35ed68b4-e26f-4e2a-93de-63098c09607a)

- Adding and Updating Split Columns:
- Adds and updates PropertySplitAddress.

![image](https://github.com/user-attachments/assets/987e89c4-bd0c-4fbf-8d9e-13a3bc9a1e1e)

- Splitting Owner Address:
- Adding and Updating Split Owner Address. Split OwnerAddress into three parts.

![image](https://github.com/user-attachments/assets/0ab57db2-024a-4477-9d89-653d40479394)


- Adds and updates OwnerSplitAddress

  ![image](https://github.com/user-attachments/assets/3437d9c4-c9d1-44f0-a22b-72888943379e)

- Add and updates OwnerSplitCity, Add and updates OwnerSplitState.

![image](https://github.com/user-attachments/assets/bfda677c-5bb5-4f43-98c4-b36d1609fd2f)

5. Change Y and N to Yes and No in "Sold as Vacant" Field.Counts distinct SoldAsVacant values and orders by count

 ![image](https://github.com/user-attachments/assets/ee284753-2e7c-4e7c-88e5-7b532b7d5a29)

6. Remove Duplicates

![image](https://github.com/user-attachments/assets/2129e59b-1176-4e6e-84c8-99c5eda0c670)

7. Delete Unused Columns

![image](https://github.com/user-attachments/assets/d5602c84-d728-4424-9a03-b2154fda70eb)


![image](https://github.com/user-attachments/assets/534e808e-a6d8-4cd2-ba72-1b6af5acb019)






