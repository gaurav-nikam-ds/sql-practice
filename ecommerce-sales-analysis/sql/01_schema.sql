-- E-Commerce Sales & Customer Analysis
-- Database: PostgreSQL

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE,
    customer_segment VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    order_date DATE,
    quantity INT,
    discount DECIMAL(5,2),
    payment_method VARCHAR(30),
    order_status VARCHAR(20)
);

INSERT INTO customers VALUES
(101,'Aarav Sharma','Male',24,'Pune','Maharashtra','2025-01-12','Regular'),
(102,'Priya Patil','Female',29,'Nashik','Maharashtra','2025-01-18','Premium'),
(103,'Rahul Joshi','Male',31,'Mumbai','Maharashtra','2025-02-03','Regular'),
(104,'Sneha Kulkarni','Female',26,'Pune','Maharashtra','2025-02-15','Premium'),
(105,'Vikas More','Male',35,'Nashik','Maharashtra','2025-03-02','Regular'),
(106,'Neha Deshmukh','Female',28,'Aurangabad','Maharashtra','2025-03-11','Regular'),
(107,'Rohan Shah','Male',30,'Mumbai','Maharashtra','2025-03-19','Premium'),
(108,'Anjali Pawar','Female',23,'Pune','Maharashtra','2025-04-05','Regular'),
(109,'Siddharth Jadhav','Male',27,'Nashik','Maharashtra','2025-04-17','Regular'),
(110,'Kavya Mehta','Female',32,'Mumbai','Maharashtra','2025-05-01','Premium'),
(111,'Akash Wagh','Male',25,'Pune','Maharashtra','2025-05-14','Regular'),
(112,'Pooja Salve','Female',34,'Aurangabad','Maharashtra','2025-06-02','Regular'),
(113,'Nikhil Bhosale','Male',29,'Pune','Maharashtra','2025-06-18','Premium'),
(114,'Isha Chavan','Female',27,'Nashik','Maharashtra','2025-07-09','Regular'),
(115,'Manish Sable','Male',38,'Mumbai','Maharashtra','2025-07-21','Premium');

INSERT INTO products VALUES
(201,'Wireless Mouse','Electronics','Accessories',799,450),
(202,'Keyboard','Electronics','Accessories',1299,750),
(203,'Laptop Stand','Electronics','Accessories',1599,950),
(204,'USB Hub','Electronics','Accessories',999,560),
(205,'Headphones','Electronics','Audio',2499,1500),
(206,'Running Shoes','Fashion','Footwear',2999,1800),
(207,'Backpack','Fashion','Bags',1799,1050),
(208,'T-Shirt','Fashion','Clothing',899,500),
(209,'Coffee Maker','Home','Kitchen',3499,2200),
(210,'Desk Lamp','Home','Furniture',1199,700);

INSERT INTO orders VALUES
(1001,101,201,'2025-01-20',2,0.00,'UPI','Delivered'),
(1002,102,205,'2025-01-25',1,0.10,'Card','Delivered'),
(1003,103,206,'2025-02-08',1,0.05,'Card','Delivered'),
(1004,104,209,'2025-02-20',1,0.00,'UPI','Delivered'),
(1005,105,202,'2025-03-06',2,0.05,'Cash','Delivered'),
(1006,106,207,'2025-03-15',1,0.00,'UPI','Cancelled'),
(1007,107,205,'2025-03-22',2,0.15,'Card','Delivered'),
(1008,108,208,'2025-04-09',3,0.00,'UPI','Delivered'),
(1009,109,203,'2025-04-23',1,0.10,'Cash','Delivered'),
(1010,110,209,'2025-05-05',2,0.05,'Card','Delivered'),
(1011,111,204,'2025-05-19',2,0.00,'UPI','Delivered'),
(1012,112,210,'2025-06-07',1,0.00,'Cash','Returned'),
(1013,113,206,'2025-06-21',2,0.10,'Card','Delivered'),
(1014,114,201,'2025-07-12',3,0.05,'UPI','Delivered'),
(1015,115,205,'2025-07-25',1,0.00,'Card','Delivered'),
(1016,101,202,'2025-08-03',1,0.00,'UPI','Delivered'),
(1017,102,207,'2025-08-11',2,0.05,'Card','Delivered'),
(1018,104,205,'2025-08-19',1,0.10,'UPI','Delivered'),
(1019,107,206,'2025-09-02',2,0.00,'Card','Delivered'),
(1020,110,209,'2025-09-15',1,0.05,'UPI','Delivered'),
(1021,113,203,'2025-09-24',2,0.00,'Card','Delivered'),
(1022,115,207,'2025-10-06',1,0.10,'UPI','Delivered'),
(1023,103,205,'2025-10-18',1,0.00,'Card','Delivered'),
(1024,108,208,'2025-10-27',2,0.05,'UPI','Delivered'),
(1025,109,210,'2025-11-04',2,0.00,'Cash','Delivered'),
(1026,101,201,'2025-11-16',3,0.10,'UPI','Delivered'),
(1027,102,209,'2025-11-28',1,0.00,'Card','Delivered'),
(1028,104,206,'2025-12-05',1,0.05,'UPI','Delivered'),
(1029,107,205,'2025-12-12',2,0.10,'Card','Delivered'),
(1030,110,202,'2025-12-20',1,0.00,'UPI','Delivered');
