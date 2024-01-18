Apple Inc. solution
Step 1: Identify and Understand Entities
Identify Entities:
● Customers
● Apple Accounts
● Mailshot Campaigns
● Orders
● Products
● Premises
● Employees
● Product Stock
● Mailshot Campaigns


Step 2: Define Relationships
Define Relationships:
● Establish relationships based on business rules.
● For example, a customer makes orders, products are associated with orders,
premises employ employees, etc.

Step 3: Design Database Schema
Design Database Schema:
● Create tables for each identified entity.
● Define primary and foreign keys.
● Capture attributes for each entity.

Step 4: Normalize the Database
Normalize the Database:
● Eliminate data redundancies.
● Remove anomalies and inconsistencies.
● Ensure the database is in the Third Normal Form (3NF).

Step 5: Create Tables
Create Tables:
● Implement the designed schema by creating tables in the database.
● Use appropriate data types for each attribute.


 Step 6: Implement Relationships
Implement Relationships:
● Set up foreign key constraints to enforce relationships.
● Ensure referential integrity.

Step 7: Populate Sample Data
Populate Sample Data:
● Insert sample data to test the database design.
● Ensure data integrity and consistency.


Step 8: Query Design
Query Design:
● Develop queries to extract information based on the given scenarios.
● Consider using SQL for querying.


Step 9: Scenario-based Queries
Scenario-based Queries:
● Create specific queries to address each scenario provided.

Step 10: Market Research Query
Market Research Query:
● Design a query to extract demographic information and preferences of customers
who bought the iPhone 12 series during the specified period.


Step 11: Returns Eligibility Query
Returns Eligibility Query:
● Design a query to identify customers eligible for returns based on the purchase
date.

Step 12: Testing and Optimization
Testing and Optimization:
● Test the queries with sample data.
● Optimize queries for performance.

 1. Let's identify and briefly explain each of the entities:
Customers:
● Description: Individuals who purchase Apple products, either in-store or online.
● Attributes: Customer ID, first name, surname, date of birth, gender, contact
number.

Apple Accounts:
● Description: User accounts created by customers for online purchases and
access to additional services.
● Attributes: Apple ID (unique, associated with an email address), customer ID,
password.

Mailshot Campaigns:
● Description: Marketing campaigns targeting a large group of Apple account users
to inform them about promotions.
● Attributes: Mailshot ID, mailshot name, start date, end date.

Orders:
● Description: Records of customer transactions, detailing the products purchased,
payment methods, and other order-related information.
● Attributes: Order ID, order date and time, customer ID, product ID, employee ID,
payment type, shipping option.

Products:
● Description: Apple's range of products available for purchase.
● Attributes: Product ID, name, price per unit, product category.

Premises:
● Description: Physical locations associated with Apple, including offices,
warehouses, and physical stores.
● Attributes: Premise ID, premise type (office, warehouse, store), premise address.

Employees:
● Description: Individuals working for Apple, assigned to different premises, with
roles and responsibilities.
● Attributes: Employee ID, name, gender, date of birth, contact, premise ID, date
hired, date resigned, position.

Product Stock:
● Description: Records of the quantity of each product in each physical store and
warehouse.
● Attributes: Product ID, premise ID, quantity.

 Mailshot Campaigns (again):
● Description: Reiterated for clarity, this entity represents marketing campaigns
targeting Apple account users.
● Attributes: Mailshot ID, mailshot name, start date, end date.

These entities form the foundation for creating a comprehensive database that meets Apple's business requirements.


2. Let's define relationships based on the business rules:
Relationship between Customers and Apple Accounts:
● Description: Each customer can own zero or many Apple accounts, establishing
a one-to-many relationship.
● Representation: One-to-Many (1:N)
● Key Attributes: Customer ID in Customers links to Customer ID in Apple
Accounts.

Relationship between Apple Accounts and Mailshot Campaigns:
● Description: Each Apple account is associated with zero or many mailshot
campaigns, forming a one-to-many relationship.
● Representation: One-to-Many (1:N)
● Key Attributes: Apple ID in Apple Accounts links to Apple ID in Mailshot
Campaigns.

Relationship between Customers and Orders:
● Description: Each customer can make zero or many orders, establishing a
one-to-many relationship.
● Representation: One-to-Many (1:N)
● Key Attributes: Customer ID in Customers links to Customer ID in Orders.

Relationship between Orders and Products:
● Description: Every order must be associated with at least one valid product,
forming a mandatory one-to-many relationship.
● Representation: One-to-Many (1:N)
● Key Attributes: Product ID in Products links to Product ID in Orders.

Relationship between Products and Premises:
● Description: Each product may be found in one or many premises, establishing a
many-to-many relationship.

● Representation: Many-to-Many (M:N) with an associative table.

 ● Key Attributes: Product ID in Products links to Product ID in Product Stock. Premise ID in Premises links to Premise ID in Product Stock.
Relationship between Premises and Employees:
● Description: Each premise employs one or many employees, forming a
one-to-many relationship.

● Representation: One-to-Many (1:N)
● Key Attributes: Premise ID in Premises links to Premise ID in Employees.

Relationship between Employees and Employees (Managerial):
● Description: Some employees manage zero or many employees, creating a
hierarchical relationship within the Employees entity.
● Representation: Recursive One-to-Many (1:N)
● Key Attributes: Employee ID (Manager) in Employees links to Employee ID
(Managed) in Employees.

Relationship between Employees and Orders (Processing):
● Description: Each employee processes zero or many orders, forming a
one-to-many relationship.
● Representation: One-to-Many (1:N)
● Key Attributes: Employee ID in Employees links to Employee ID in Orders.

Relationship between Orders and Ship_Details:
● Description: Each order has zero or one ship_details, forming a one-to-one
optional relationship.
● Representation: One-to-One (1:1)
● Key Attributes: Order ID in Orders links to Order ID in Ship_Details.

Relationship between Ship_Details and Orders (Inverse):
● Description: Each ship_details is associated with one order, creating the inverse
of the previous relationship.
● Representation: One-to-One (1:1)
● Key Attributes: Order ID in Ship_Details links to Order ID in Orders.

These relationships help establish the connections between different entities in the database.

 3. Let's design the database schema by creating tables for each identified entity, defining
primary and foreign keys, and capturing attributes for each entity.

Customers Table: ● Attributes:
● Customer ID (Primary Key)
● First Name
● Surname
● Date of Birth
● Gender
● Contact Number
● Primary Key: Customer ID

Apple Accounts Table:
● Attributes:
● Apple ID (Primary Key)
● Email Address
● Password
● Customer ID (Foreign Key)
● Primary Key: Apple ID
● Foreign Key: Customer ID references Customers(Customer ID)

Mailshot Campaigns Table:
● Attributes:
● Mailshot ID (Primary Key)
● Mailshot Name
● Start Date
● End Date
● Primary Key: Mailshot ID

Orders Table:
● Attributes:
● Order ID (Primary Key)
● Order Date and Time
● Customer ID (Foreign Key)
● Product ID (Foreign Key)
● Employee ID (Foreign Key)
● Payment Type
● Shipping Option
● Ship ID (Foreign Key, Optional)
● Primary Key: Order ID
● Foreign Keys: Customer ID references Customers(Customer ID), Product ID
references Products(Product ID), Employee ID references Employees(Employee ID), Ship ID references Ship_Details(Order ID)

 Products Table:
● Attributes:
● Product ID (Primary Key)
● Product Name
● Price per Unit
● Product Category
● Primary Key: Product ID

Premises Table: 
● Attributes:
● Premise ID (Primary Key)
● Premise Type
● Premise Address
● Primary Key: Premise ID

Employees Table:
● Attributes:
● Employee ID (Primary Key)
● Name
● Gender
● Birthdate
● Contact
● Premise ID (Foreign Key)
● Date Hired
● Date Resigned
● Position
● Person to Report To (Foreign Key, Recursive)
● Monthly Salary
● Primary Key: Employee ID
● Foreign Keys: Premise ID references Premises(Premise ID), Person to Report To
references Employees(Employee ID)

Product Stock Table:
● Attributes:
● Product ID (Primary Key, Foreign Key)
● Premise ID (Primary Key, Foreign Key)
● Quantity
● Primary Keys: Product ID, Premise ID
● Foreign Keys: Product ID references Products(Product ID), Premise ID
references Premises(Premise ID)

Mailshot Campaigns to Apple Accounts (Associative Table): ● Attributes:
● Mailshot ID (Primary Key, Foreign Key)
 ● Apple ID (Primary Key, Foreign Key)
● Primary Keys: Mailshot ID, Apple ID
● Foreign Keys: Mailshot ID references Mailshot Campaigns(Mailshot ID), Apple ID
references Apple Accounts(Apple ID)

Employees Hierarchy Table (Associative Table):
● Attributes:
● Manager Employee ID (Primary Key, Foreign Key)
● Managed Employee ID (Primary Key, Foreign Key)
● Primary Keys: Manager Employee ID, Managed Employee ID
● Foreign Keys: Manager Employee ID references Employees(Employee ID),
Managed Employee ID references Employees(Employee ID)

Ship_Details Table: 
● Attributes:
● Order ID (Primary Key, Foreign Key)
● Shipping Address
● City
● State
● Postcode
● Country
● Primary Key: Order ID
● Foreign Key: Order ID references Orders(Order ID)

These tables, along with their attributes and relationships, form the foundation of the database schema. Each table has a primary key to uniquely identify records, and foreign keys establish relationships between tables.

4. Normalizing the database involves organizing the tables and their relationships to eliminate data redundancies, remove anomalies, and ensure the database is in the Third Normal Form (3NF). 

Let's go through the normalization process:
First Normal Form (1NF):
Ensure that each column in a table contains atomic (indivisible) values.

Customers Table (1NF):
● No changes needed as attributes are atomic.
Apple Accounts Table (1NF): ● No changes needed.

 Mailshot Campaigns Table (1NF): ● No changes needed.
Orders Table (1NF):
● No changes needed.

Products Table (1NF):
● No changes needed.
Premises Table (1NF):
● No changes needed.

Employees Table (1NF):
● No changes needed.
Product Stock Table (1NF): 
● No changes needed.

Mailshot Campaigns to Apple Accounts (1NF): 
● No changes needed.

Employees Hierarchy Table (1NF): 
● No changes needed.
Ship_Details Table (1NF):
● No changes needed.
Second Normal Form (2NF):
Ensure that each non-prime attribute is fully functionally dependent on the primary key.

Customers Table (2NF):
● No changes needed as there are no composite primary keys.

Apple Accounts Table (2NF): 

● No changes needed.
Mailshot Campaigns Table (2NF): ● No changes needed.

Orders Table (2NF):
● No changes needed.
Products Table (2NF):

 ● No changes needed.
Premises Table (2NF):
● No changes needed.
Employees Table (2NF):
● No changes needed.
Product Stock Table (2NF): ● No changes needed.
Mailshot Campaigns to Apple Accounts (2NF): 

● No changes needed.
Employees Hierarchy Table (2NF): 

● No changes needed.
Ship_Details Table (2NF):
● No changes needed.

Third Normal Form (3NF):
Ensure that each non-prime attribute is not transitively dependent on the primary key.
Customers Table (3NF):
● No changes needed.

Apple Accounts Table (3NF): 
● No changes needed.

Mailshot Campaigns Table (3NF): 
● No changes needed.
Orders Table (3NF):
● No changes needed.
Products Table (3NF):
● No changes needed.
Premises Table (3NF):
● No changes needed.
Employees Table (3NF):
● No changes needed.

Product Stock Table (3NF): 
● No changes needed.
Mailshot Campaigns to Apple Accounts (3NF): 

● No changes needed.
Employees Hierarchy Table (3NF): 
● No changes needed.
Ship_Details Table (3NF):
● No changes needed.

The database is already in the Third Normal Form (3NF) since all tables are in 1NF and 2NF, and there are no transitive dependencies. 

The normalized database is now structured to minimize redundancies and ensure data consistency. 


5. Let's create the tables based on the designed schema and use appropriate data types for each attribute. I'll provide a brief explanation for each table:
Customers Table:
