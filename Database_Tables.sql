-- Create Customers Table
CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    c_firstname VARCHAR(50),
    c_surname VARCHAR(50),
    c_birthdate DATE,
    c_gender CHAR(1) CHECK (c_gender IN ('F', 'M')),
    c_contact VARCHAR(15)
);

-- Create Product Table
CREATE TABLE product (
    prod_id SERIAL PRIMARY KEY,
    prod_name VARCHAR(100),
    prod_unit_price DECIMAL(10,2),
    prod_category VARCHAR(50)
);

-- Create Premise Table
CREATE TABLE premise (
    premise_id SERIAL PRIMARY KEY,
    premise_type VARCHAR(50) CHECK (premise_type IN ('Office', 'Store', 'Warehouse')),
    premise_address VARCHAR(255),
    loc_city VARCHAR(50),
    loc_state VARCHAR(50),
    loc_postcode VARCHAR(10),
    loc_country VARCHAR(50)
);

-- Create Mailshot Campaign Table
CREATE TABLE mailshot_campaign (
    mailshot_id SERIAL PRIMARY KEY,
    mailshot_name VARCHAR(100),
    mailshot_start_date DATE,
    mailshot_end_date DATE
);

-- Create Shipping Details Table
CREATE TABLE ship_details (
    ship_id SERIAL PRIMARY KEY,
    ship_addressline VARCHAR(255),
    ship_city VARCHAR(50),
    ship_state VARCHAR(50),
    ship_postcode VARCHAR(10),
    ship_country VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_firstname VARCHAR(50),
    emp_surname VARCHAR(50),
    emp_gender CHAR(1) CHECK (emp_gender IN ('F', 'M')),
    emp_birthdate DATE,
    emp_contact VARCHAR(15),
    emp_workplace_id INT REFERENCES premise(premise_id),
    date_hired DATE,
    date_resigned DATE,
    emp_position VARCHAR(50),
    reports_to INT NULL,
    mth_salary DECIMAL(10, 2)
);

-- Create Apple Account Table
CREATE TABLE apple_account (
    apple_id SERIAL PRIMARY KEY,
    cust_id INT REFERENCES customers(cust_id),
    password VARCHAR(255)
);

-- Create Product Stock Table
CREATE TABLE product_stock (
    prod_id INT REFERENCES product(prod_id),
    premise_id INT REFERENCES premise(premise_id),
    stock INT,
    PRIMARY KEY (prod_id, premise_id)
);

-- Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_datetime TIMESTAMP,
cust_id INT REFERENCES customers(cust_id),
emp_id INT REFERENCES employee(emp_id),
pay_type VARCHAR(50),
shipping_option VARCHAR(50),
ship_id INT REFERENCES ship_details(ship_id)
);

-- Create Mailshot Customer Table
CREATE TABLE mailshot_customer (
mailshot_id INT REFERENCES mailshot_campaign(mailshot_id),
apple_id INT REFERENCES apple_account(apple_id),
outcome VARCHAR(50),
PRIMARY KEY (mailshot_id, apple_id)
);

-- Create Order Details Table
CREATE TABLE order_details (
order_id INT REFERENCES orders(order_id),
prod_id INT REFERENCES product(prod_id),
quantity INT,
discount DECIMAL(10, 2),
PRIMARY KEY (order_id, prod_id)
);

-- Add self-referencing foreign key to Employee Table
ALTER TABLE employee ADD CONSTRAINT fk_reports_to FOREIGN KEY (reports_to) REFERENCES employee(emp_id);
