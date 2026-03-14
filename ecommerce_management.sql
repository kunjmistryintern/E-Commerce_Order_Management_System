-- create database 

create database ecommerce_db;
use ecommerce_db;

--  ------------# first run query of "2. create categories table" then you able to run "1. create products table query"  #------------

-- 1. create products table

create table products (
    product_id int primary key auto_increment,
    name varchar(255),
    category_id int,
    price decimal(10,2),
    stock_quantity int,
    added_date date,
    foreign key (category_id) references categories(category_id)
);

-- 2. create categories table

create table categories (
    category_id int primary key auto_increment,
    category_name varchar(100)
);

-- 3. create customers table

create table customers (
    customer_id int primary key auto_increment,
    name varchar(255),
    email varchar(255),
    phone_number varchar(20),
    address text,
    registration_date date
);

-- 4. create orders table

create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    status enum('pending', 'shipped', 'delivered', 'cancelled'),
    foreign key (customer_id) references customers(customer_id)
);

-- 5. create order_item table

create table order_items (
    order_item_id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int,
    subtotal decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

-- 6. create payments table

create table payments (
    payment_id int primary key auto_increment,
    order_id int,
    payment_date date,
    payment_method enum('credit card', 'paypal', 'upi'),
    payment_status enum('paid', 'pending', 'failed'),
    foreign key (order_id) references orders(order_id)
);

-- 7. create shipping table 

create table shipping (
    shipping_id int primary key auto_increment,
    order_id int,
    shipping_date date,
    delivery_date date,
    shipping_status enum('dispatched', 'in transit', 'delivered'),
    foreign key (order_id) references orders(order_id)
);


-- categories (5 rows)

insert into categories (category_name) values 
('electronics'), ('clothing'), ('home decor'), ('books'), ('sports');

-- customers (15 rows)

insert into customers (name, email, phone_number, address, registration_date) values
('alice smith', 'alice@email.com', '1234567890', '123 pine st', '2022-05-10'),
('bob jones', 'bob@email.com', '2234567891', '456 oak ave', '2023-01-15'),
('charlie brown', null, '3234567892', '789 maple dr', '2021-11-20'),
('david lee', 'david@email.com', '4234567893', '101 birch ln', '2023-06-05'),
('eve white', 'eve@email.com', '5234567894', '202 cedar rd', '2022-12-30'),
('frank miller', 'frank@email.com', '6234567895', '303 elm st', '2024-01-10'),
('grace hooper', null, '7234567896', '404 walnut st', '2023-08-15'),
('hank pym', 'hank@email.com', '8234567897', '505 cherry st', '2021-05-12'),
('ivy rose', 'ivy@email.com', '9234567898', '606 spruce st', '2023-11-01'),
('jack sparrow', 'jack@email.com', '0234567899', '707 ocean dr', '2022-03-14'),
('kyle reese', 'kyle@email.com', '1122334455', '808 future rd', '2024-02-10'),
('lara croft', 'lara@email.com', '2233445566', '909 tomb way', '2022-09-09'),
('monica geller', 'monica@email.com', '3344556677', '123 central perk', '2023-10-25'),
('neo anderson', 'neo@matrix.com', '4455667788', '010 code blvd', '2021-12-31'),
('oscar wilde', 'oscar@email.com', '5566778899', '111 poet lane', '2023-04-12');

-- products (15 rows)

insert into products (name, category_id, price, stock_quantity, added_date) values
('laptop', 1, 80000.00, 10, '2023-01-01'),
('smartphone', 1, 45000.00, 0, '2023-02-15'),
('t-shirt', 2, 500.00, 100, '2023-03-10'),
('jeans', 2, 1200.00, 50, '2023-03-12'),
('lamp', 3, 1500.00, 20, '2023-04-01'),
('wall clock', 3, 800.00, 15, '2023-04-05'),
('sql guide', 4, 600.00, 30, '2023-05-10'),
('fiction novel', 4, 300.00, 60, '2023-05-15'),
('football', 5, 1000.00, 25, '2023-06-01'),
('yoga mat', 5, 700.00, 40, '2023-06-05'),
('headphones', 1, 3000.00, 15, '2023-07-01'),
('coffee mug', 3, 250.00, 80, '2023-07-10'),
('running shoes', 2, 2500.00, 25, '2023-08-01'),
('smart watch', 1, 12000.00, 12, '2023-08-15'),
('backpack', 5, 1800.00, 35, '2023-09-01');

-- orders (15 rows)
insert into orders (customer_id, order_date, total_amount, status) values
(1, '2024-01-10', 80500.00, 'delivered'),
(2, '2024-02-15', 1500.00, 'shipped'),
(4, '2023-11-05', 45000.00, 'delivered'),
(5, '2024-03-01', 1200.00, 'pending'),
(1, '2023-08-10', 2500.00, 'delivered'),
(2, '2023-09-12', 3000.00, 'delivered'),
(2, '2023-10-05', 600.00, 'delivered'),
(6, '2024-02-20', 250.00, 'shipped'),
(9, '2024-03-10', 1000.00, 'pending'),
(11, '2024-03-12', 12000.00, 'shipped'),
(1, '2023-12-25', 500.00, 'cancelled'),
(3, '2024-01-05', 800.00, 'delivered'),
(12, '2024-02-01', 300.00, 'delivered'),
(1, '2024-02-28', 1800.00, 'shipped'),
(15, '2024-03-14', 1500.00, 'pending');

-- order_items (15 rows)
insert into order_items (order_id, product_id, quantity, subtotal) values
(1, 1, 1, 80000.00), (1, 3, 1, 500.00),
(2, 5, 1, 1500.00),
(3, 2, 1, 45000.00),
(4, 4, 1, 1200.00),
(5, 13, 1, 2500.00),
(6, 11, 1, 3000.00),
(7, 7, 1, 600.00),
(8, 12, 1, 250.00),
(9, 9, 1, 1000.00),
(10, 14, 1, 12000.00),
(11, 3, 1, 500.00),
(12, 6, 1, 800.00),
(13, 8, 1, 300.00),
(14, 15, 1, 1800.00);

-- payments (10 rows)
insert into payments (order_id, payment_date, payment_method, payment_status) values
(1, '2024-01-10', 'credit card', 'paid'),
(2, '2024-02-15', 'upi', 'paid'),
(3, '2023-11-05', 'paypal', 'paid'),
(4, '2024-03-01', 'upi', 'pending'),
(5, '2023-08-10', 'credit card', 'paid'),
(6, '2023-09-12', 'paypal', 'paid'),
(8, '2024-02-20', 'upi', 'paid'),
(9, '2024-03-10', 'credit card', 'pending'),
(10, '2024-03-12', 'upi', 'paid'),
(12, '2024-01-05', 'paypal', 'paid');

-- shipping (10 rows)
insert into shipping (order_id, shipping_date, delivery_date, shipping_status) values
(1, '2024-01-11', '2024-01-15', 'delivered'),
(2, '2024-02-16', null, 'in transit'),
(3, '2023-11-06', '2023-11-10', 'delivered'),
(5, '2023-08-11', '2023-08-14', 'delivered'),
(6, '2023-09-13', '2023-09-18', 'delivered'),
(8, '2024-02-21', null, 'dispatched'),
(10, '2024-03-13', null, 'in transit'),
(12, '2024-01-06', '2024-01-10', 'delivered'),
(13, '2024-02-02', '2024-02-05', 'delivered'),
(14, '2024-03-01', null, 'dispatched');



-- *************************************************************************************************************************************************** --


-- Task and Functionalities


-- 1. implement CURD operations

-- 		Insert new products, customers, and orders into the database 

insert into products (name, category_id, price, stock_quantity, added_date)
values ('mouse', 1, 2500.00, 50, curdate());

insert into customers (name, email, phone_number, address, registration_date)
values ('kunj mistry', 'kunj.@gmail.com', '8799359762', 'Amalsad , Navsari', curdate());

insert into orders (customer_id, order_date, total_amount, status)
values (16, curdate(), 2500.00, 'pending');

-- 		Update stock when an order is placed.

update products
set stock_quantity = stock_quantity + 5
where product_id = 5;

-- 		Delete orders that were cancelled more than 30 days ago.

delete from order_items 
where order_id in (select order_id from orders 
where status = 'cancelled' and order_date < date_sub(curdate(), interval 30 day)
);


-- 2. Use SQL Clauses (WHERE, HAVING, LIMIT)

-- 		Find all orders placed in the last 6 months.

select * from orders 
where order_date > date_sub(curdate(), interval 6 month);

-- 		Get the top 5 highest-priced products.

select * from products 
order by price desc 
limit 5;

-- 		Find customers who have placed more than 3 orders.

select customer_id, count(order_id) as total_orders 
from orders 
group by customer_id 
having total_orders > 3;


-- 3. Apply SQL Operators (AND, OR, NOT)

-- 		Get all orders where status = 'Pending' AND payment_status = 'Paid'.

select o.* , p.* from orders o 
join payments p on o.order_id = p.order_id
where o.status = 'pending' or p.payment_status = 'paid';

-- 		Find all products that are NOT out of stock.

select * from products 
where not stock_quantity = 0;

-- 		Retrieve customers who registered after 2022 OR have made purchases above ₹10,000.

select distinct c.customer_id , c.name, c.email , c.phone_number , c.address , o.order_date , o.total_amount from customers c
left join orders o on c.customer_id = o.customer_id
where year(c.registration_date) > 2022 and o.total_amount > 10000;

-- 4. Sorting & Grouping Data (ORDER BY, GROUP BY)

-- 		List all products sorted by price in descending order.

select * from products 
order by price desc;

-- 		Display the number of orders placed by each customer.

select customer_id, count(order_id) as total_orders 
from orders 
group by customer_id;

-- 		Show total revenue generated per category.

select c.category_name, sum(oi.subtotal) as total_revenue 
from categories c 
join products p on c.category_id = p.category_id 
join order_items oi on p.product_id = oi.product_id 
group by c.category_name;

-- 5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT)

-- 		Find the total revenue generated by the store.

select sum(total_amount) as total_revenue from orders ;

-- 		Identify the most purchased product.

select product_id, sum(quantity) as total_sold 
from order_items 
group by product_id 
order by total_sold desc 
limit 1 ;

-- 		Calculate the average order value.

select avg(total_amount) as average_order_value from orders;

-- 6. Establish Primary & Foreign Key Relationships

-- 		Ensure orders are linked to customers and products.

alter table orders
add constraint f_key_customer_order
foreign key (customer_id) references customers(customer_id);

-- 		Establish relationships between payments and orders.

alter table payments
add constraint f_k_order_payment
foreign key (order_id) references orders(order_id);

-- 7. Implement Joins

-- 		Retrieve a list of products along with their category names using INNER JOIN.

select p.name as product_name, c.category_name from products p 
inner join categories c on p.category_id = c.category_id;

-- 		Get all orders with customer details using LEFT JOIN.

select o.order_id, o.order_date, o.total_amount, c.name as customer_name, c.email  from orders o 
left join customers c on o.customer_id = c.customer_id;

-- 		Find orders that haven't been shipped using RIGHT JOIN.

select o.order_id, o.status from shipping s 
right join orders o on s.order_id = o.order_id 
where s.shipping_id is null;

-- 		Show customers who have never placed an order using FULL OUTER JOIN.

select c.name as customer_name 
from customers c 
left join orders o on c.customer_id = o.customer_id 
where o.order_id is null

union

select c.name as customer_name 
from customers c 
right join orders o on c.customer_id = o.customer_id 
where c.customer_id is null;

-- 8. Use Subqueries

-- 		Find orders placed by customers who registered after 2022.

select * from orders 
where customer_id in (select customer_id from customers 
where year(registration_date) > 2022
);

-- 		Identify the customer who has spent the most.

select name from customers 
where customer_id = ( select customer_id from orders 
group by customer_id 
order by sum(total_amount) desc 
limit 1
);

-- 		Get products that have never been ordered.

select name from products 
where product_id not in ( select distinct product_id from order_items
);

-- 9. Implement Date & Time Functions

-- 		Extract the month from order_date to count orders per month.

select monthname(order_date) as order_month, count(order_id) as total_orders from orders
group by order_month;

-- 		Calculate the delivery time by finding the difference between shipping_date and delivery_date.

select order_id, shipping_date, delivery_date, 
datediff(delivery_date, shipping_date) as days_to_deliver from shipping
where delivery_date is not null;

-- 		Format order_date as DD-MM-YYYY.

select order_id, date_format(order_date, '%d-%m-%y') as formatted_date from orders;

-- 10. Use String Manipulation Functions

-- 		Convert all product names to uppercase.

select upper(name) as product_name_caps from products;

-- 		Trim whitespace from customer names.

select trim(name) as cleaned_customer_name from customers;

-- 		Replace missing email values with "Not Provided".

select name, coalesce(email, 'not provided') as contact_email  from customers;

-- 11. Implement Window Functions

-- 		Rank customers based on total spending.

select customer_id, sum(total_amount) as total_spent, rank() over 
(order by sum(total_amount) desc) as spending_rank from orders
group by customer_id;

-- 		Show the cumulative total revenue per month.

select monthname(order_date) as month, sum(total_amount) as monthly_revenue,
sum(sum(total_amount)) over (order by min(order_date)) as cumulative_revenue from orders
group by monthname(order_date);

-- 		Display the running total of orders placed.

select  order_id, order_date, total_amount, sum(total_amount) over 
(order by order_date, order_id) as running_total from orders;

-- 12. Apply SQL CASE Expressions

-- 		Assign a Loyalty_Status to customers:
-- 		  * "Gold" if they have spent above ₹50,000.
-- 		  * "Silver" if they have spent between ₹20,000 - ₹50,000.
-- 		  * "Bronze" otherwise

select c.name, sum(o.total_amount) as total_spent,
case 
when sum(o.total_amount) > 50000 then 'gold'
when sum(o.total_amount) between 20000 and 50000 then 'silver'
else 'bronze'
end as loyalty_status
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name
order by total_spent desc;

-- 		Categorize products:
-- 		  * "Best Seller" if sold more than 500 units.
-- 		  * "Popular" if sold between 200-500 units.
-- 		  * "Regular" otherwise.

select p.name, sum(oi.quantity) as total_units_sold,
case 
when sum(oi.quantity) > 500 then 'best seller'
when sum(oi.quantity) between 200 and 500 then 'popular'
else 'regular'
end as product_category from products p
left join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.name;