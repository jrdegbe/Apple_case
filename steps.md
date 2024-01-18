

1. Step 1: Copy the CSV Files into the Docker Container
First, copy the CSV files from your host system into the Docker container. You'll need to do this for each CSV file you want to import.

- docker cp /Users/jrdegbe/Desktop/Apple_case/customer.csv postgres_container:/customer.csv
# Repeat for other CSV files


1. Step 2: Access the PostgreSQL Command Line
Next, access the PostgreSQL command line interface within your Docker container:

docker exec -it postgres_container bash


Step 3: Log in to PostgreSQL
Once you're inside the container, connect to PostgreSQL with psql:

psql -U admin -d postgres_db


Step 4: Import the CSV Files
Now use the COPY or \copy command to import the data from the CSV files. Start with tables that have no foreign key dependencies and move to those that do.

Here's an example of the \copy command to import data into the customers table:

- \copy customers(cust_id, c_firstname, c_surname, c_birthdate, c_gender, c_contact) FROM '/customer.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');


Step 5: Verify the Data
After each import, you can verify that the data has been loaded correctly by querying the table:

SELECT * FROM customers LIMIT 10;

This will show the first 10 entries in the customers table.



Step 6: Repeat for Each Table
Go through the same process for each table, following the foreign key dependencies:

Import into customers, premise, product, mailshot_campaign, ship_details, and employee.
Then import into apple_account, product_stock, and orders.
Lastly, import into mailshot_customer and order_details.
Remember to change file paths and table/column names as necessary for each table's CSV file.

Step 7: Exit PostgreSQL
Once you've

imported all the data, you can exit the psql command-line interface:

\q
Then, you can exit the Docker container's bash shell:


exit

Step 8: Additional Checks
After exiting, it's a good idea to perform additional checks:

Ensure that the number of rows in the CSV files matches the number of rows in each table.
Check for any errors or warnings that might have occurred during the import process.

Confirm the integrity of the data by running a few test queries that involve joins across the tables to make sure foreign keys are working as expected.

For the actual data import, ensure the CSV files are correctly formatted and do not contain more columns than the tables expect, and that the data types match the columns in your tables. If you encounter permission issues or the files are not found, double-check the file paths you've specified and the permissions of the files inside the Docker container.




OTHER STEPS: 

Option 1: Change the Date Format in the CSV File
You can modify the CSV file to have dates in the YYYY-MM-DD format. This may be done through a script, a text editor with find-and-replace functionality, or a spreadsheet program where you can change the cell format.

Option 2: Adjust the DateStyle Setting in PostgreSQL
You can set the DateStyle parameter in PostgreSQL to interpret the dates correctly:

Before running the \copy command, set the DateStyle to DMY which stands for day-month-year.


SET DateStyle = "ISO, DMY";


- Run the \copy command again:
\copy customers(cust_id, c_firstname, c_surname, c_birthdate, c_gender, c_contact) FROM '/customer.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

After setting the DateStyle or modifying the CSV file, PostgreSQL should be able to import the dates correctly.

Remember to reset the DateStyle back to its original setting after the import if it is necessary for your application.