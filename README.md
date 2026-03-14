# 🛒 E-Commerce Order Management System

## 🧑‍💻 Author Information

- **Name:** Kunj Mistry  
- **GR ID:** 12078  
- **Branch:** RW6  
- **Project Type:** Data Analysis Project  
- **Date:** 14-03-2026
- 
## 📌 Project Overview
The **E-Commerce Order Management System** is a MySQL-based database project designed to manage the core operations of an online store. It allows administrators to handle products, categories, customers, orders, payments, and shipping details efficiently.

This project demonstrates practical implementation of SQL concepts such as **CRUD operations, joins, subqueries, aggregation, window functions, and CASE expressions** to manage and analyze e-commerce data.

---

## 🎯 Objective
The objective of this project is to build a relational database system using **MySQL** that supports the following:

- Managing **Products and Categories**
- Storing **Customer information**
- Handling **Orders and Order Items**
- Tracking **Payments and Shipping**
- Performing **sales analysis using SQL queries**

The system also demonstrates the use of **advanced SQL features** including filtering, grouping, sorting, joins, and analytical functions.

---

## 📊 Problem Statement
Design an **E-Commerce Order Management System** that allows an administrator to:

1. Manage **Products and Categories** (add, update, delete, search)
2. Manage **Customers** and maintain their order history
3. Handle **Orders** including placement, tracking, and cancellation
4. Manage **Payments and Shipping** details
5. Perform **Sales Analysis** such as most sold products, revenue tracking, and customer spending

---

# 🗄️ Database Schema

The system consists of **7 main tables**.

## 1. Products
| Column | Description |
|------|-------------|
| product_id | Primary Key |
| name | Product name |
| category_id | Foreign Key referencing Categories |
| price | Product price |
| stock_quantity | Available stock |
| added_date | Product added date |

---

## 2. Categories
| Column | Description |
|------|-------------|
| category_id | Primary Key |
| category_name | Name of category |

---

## 3. Customers
| Column | Description |
|------|-------------|
| customer_id | Primary Key |
| name | Customer name |
| email | Customer email |
| phone_number | Contact number |
| address | Customer address |
| registration_date | Date of registration |

---

## 4. Orders
| Column | Description |
|------|-------------|
| order_id | Primary Key |
| customer_id | Foreign Key referencing Customers |
| order_date | Date of order |
| total_amount | Total order amount |
| status | Pending / Shipped / Delivered / Cancelled |

---

## 5. Order_Items
| Column | Description |
|------|-------------|
| order_item_id | Primary Key |
| order_id | Foreign Key referencing Orders |
| product_id | Foreign Key referencing Products |
| quantity | Quantity ordered |
| subtotal | Total price of item |

---

## 6. Payments
| Column | Description |
|------|-------------|
| payment_id | Primary Key |
| order_id | Foreign Key referencing Orders |
| payment_date | Payment date |
| payment_method | Credit Card / PayPal / UPI |
| payment_status | Paid / Pending / Failed |

---

## 7. Shipping
| Column | Description |
|------|-------------|
| shipping_id | Primary Key |
| order_id | Foreign Key referencing Orders |
| shipping_date | Date of shipment |
| delivery_date | Date of delivery |
| shipping_status | Dispatched / In Transit / Delivered |

---

# ⚙️ Features & SQL Functionalities

## CRUD Operations
- Insert new products, customers, and orders
- Update product stock when an order is placed
- Delete orders cancelled for more than 30 days

---

## SQL Clauses
- Retrieve orders placed in the **last 6 months**
- Find **top 5 highest priced products**
- Identify customers who placed **more than 3 orders**

---

## SQL Operators
- Retrieve orders where  
  `status = 'Pending' AND payment_status = 'Paid'`
- Find products that are **not out of stock**
- Retrieve customers registered after **2022 OR spending above ₹10,000**

---

## Sorting & Grouping
- Sort products by **price in descending order**
- Display **total orders per customer**
- Calculate **revenue generated per category**

---

## Aggregate Functions
The project uses:

- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`
- `COUNT()`

Examples include:
- Calculating **total store revenue**
- Identifying **most purchased product**
- Computing **average order value**

---

## Primary & Foreign Key Relationships
- Customers → Orders
- Orders → Order_Items
- Products → Order_Items
- Orders → Payments
- Orders → Shipping

These relationships ensure **data integrity and consistency**.

---

## SQL Joins
Different types of joins are implemented:

- **INNER JOIN** → Products with category names
- **LEFT JOIN** → Orders with customer details
- **RIGHT JOIN** → Orders that haven't been shipped
- **FULL OUTER JOIN** → Customers who never placed orders

---

## Subqueries
Examples include:

- Orders placed by customers registered after 2022
- Customer with the **highest spending**
- Products that have **never been ordered**

---

## Date & Time Functions
- Extract **month from order_date**
- Calculate **delivery time**
- Format dates as **DD-MM-YYYY**

---

## String Manipulation Functions
- Convert product names to **UPPERCASE**
- Trim extra spaces from customer names
- Replace missing emails with `"Not Provided"`

---

## Window Functions
- Rank customers based on total spending
- Display cumulative monthly revenue
- Calculate running total of orders

---

## CASE Expressions

### Customer Loyalty Status
| Loyalty Level | Condition |
|---------------|-----------|
| Gold | Spending above ₹50,000 |
| Silver | ₹20,000 – ₹50,000 |
| Bronze | Below ₹20,000 |

### Product Categories
| Category | Condition |
|----------|-----------|
| Best Seller | Sold more than 500 units |
| Popular | Sold between 200–500 units |
| Regular | Otherwise |

---

# 📂 Project Structure

```
Ecommerce-Order-Management-System
│
├── ecommerce_management.sql
├── README.md
```

---

# 🛠️ Technologies Used
- **MySQL**
- **SQL**
- **Relational Database Design**

---

# 🚀 How to Run the Project

1. Install **MySQL Server**
2. Create a new database
3. Import the SQL file:

```sql
SOURCE ecommerce_management.sql;
```

4. Execute queries to manage and analyze the data.

---

** All data and README file is created from ChatGPT **

---

⭐ If you found this project helpful, consider giving it a **star** on GitHub!
