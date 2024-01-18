1. The Apple Company would like to know the Apple product with the highest number of sales in June, as well as the total sales of the product during this month.

Problem 1: Apple Product with Highest Sales in June
Assumption:

There's a column in orders or order_details that specifies if a product is an Apple product, or the product table has a column like brand_name.
The order_details table includes order_id, prod_id, quantity.

SELECT p.prod_name, SUM(od.quantity) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.prod_id = p.prod_id
WHERE p.brand_name = 'Apple'
AND EXTRACT(MONTH FROM o.order_datetime) = 6
AND EXTRACT(YEAR FROM o.order_datetime) = 2023 -- Replace with the year you're interested in
GROUP BY p.prod_name
ORDER BY total_sales DESC
LIMIT 1;


2. With the increasing amount of positive responses to Apple products, the Apple Company would like to have a report that displays the product name and product stock of each warehouse and store to keep track of product stock. Only products that are labeled as MacBook Air and premise type is store and warehouse should be listed in this report. The record must be sorted by premise ID.

Problem 2: MacBook Air Stock in Warehouses and Stores
Assumption:

The product_stock table includes prod_id, premise_id, stock.
The premise table has premise_id, premise_type.

SQL Query:

SELECT p.prod_name, ps.stock, ps.premise_id
FROM product p
JOIN product_stock ps ON p.prod_id = ps.prod_id
JOIN premise pr ON ps.premise_id = pr.premise_id
WHERE p.prod_name = 'MacBook Air'
AND pr.premise_type IN ('Store', 'Warehouse')
ORDER BY ps.premise_id;


3. Apple released the new iPhone 12 series on the 13th of October 2020. On account of the Covid-19 pandemic, many consumers were affected financially. Therefore, the company has plans to help consumers in need, such as students and young adults, by providing them discounts.
However, before that, the company needs to have a better understanding of its consumers’ needs. As such, the company would like to know about the demographic information and preferences of consumers who bought at least one of the iPhone 12 series during the pandemic. The company wants a report that lists the ordered iPhone 12 model name, order date, customer’s age, customer’s gender, customer’s shipping option, and shipping to country. This market research only targets customers who are aged between 18 and 23 and bought at least one of the iPhone 12 series between the 13th of October 2021 and the 12th of July 2021.

Problem 3: Demographic Information and Preferences of iPhone 12 Buyers
Assumptions:

The customers table includes cust_id, c_birthdate, c_gender.
The orders table includes order_id, cust_id, shipping_option, order_datetime.
The ship_details table includes ship_id, ship_country.

SQL Query:
SELECT p.prod_name, o.order_datetime, EXTRACT(YEAR FROM AGE(c.c_birthdate)) AS customer_age, c.c_gender, o.shipping_option, sd.ship_country
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.prod_id = p.prod_id
JOIN ship_details sd ON o.ship_id = sd.ship_id
WHERE p.prod_name LIKE 'iPhone 12%'
AND o.order_datetime BETWEEN '2021-10-13' AND '2021-07-12'
AND EXTRACT(YEAR FROM AGE(c.c_birthdate)) BETWEEN 18 AND 23;



4. Customers who are not satisfied and/or have purchased a faulty product have a maximum of 30 days to return their products. The Apple Company would like to have a clear table to see the customer IDs with the product purchased, and the days they have bought the specific product. Customers with purchase days for more than 30 days will not be eligible to return their products.

Problem 4: Customer Eligibility for Product Return
Assumptions:

The orders table includes order_id, cust_id, order_datetime.

SQL Query:

SELECT o.cust_id, p.prod_name, CURRENT_DATE - o.order_datetime AS days_since_purchase
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN product p ON od.prod_id = p.prod_id
WHERE CURRENT_DATE - o.order_datetime <= 30;

