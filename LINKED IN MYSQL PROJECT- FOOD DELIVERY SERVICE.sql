CREATE DATABASE FOODCO;
USE FOODCO;
CREATE TABLE CUSTOMERS(
	customer_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    phone_number BIGINT,
    address VARCHAR(100));
    
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone_number, address) VALUES
('C0001', 'Isabella', 'Anderson', 'isabella.anderson@example.com', 9988776655, '808 Sunset Boulevard, Chicago, IL'),
('C0002', 'Liam', 'Thomas', 'liam.thomas@example.com', 1010101010, '909 Lakeview Drive, Oak Park, IL'),
('C0003', 'Mason', 'Jackson', 'mason.jackson@example.com', 2020202020, '1001 Brookside Road, Bloomington, IL'),
('C0004', 'Charlotte', 'White', 'charlotte.white@example.com', 3030303030, '1102 Pinewood Street, Normal, IL'),
('C0005', 'Lucas', 'Harris', 'lucas.harris@example.com', 4040404040, '1203 Cedar Ridge, Rockford, IL'),
('C0006', 'Amelia', 'Martin', 'amelia.martin@example.com', 5050505050, '1304 Rose Avenue, Peoria, IL'),
('C0007', 'Ethan', 'Lee', 'ethan.lee@example.com', 6060606060, '1405 Oakwood Lane, Carbondale, IL'),
('C0008', 'Harper', 'Walker', 'harper.walker@example.com', 7070707070, '1506 Maple Court, Urbana, IL'),
('C0009', 'Sebastian', 'Young', 'sebastian.young@example.com', 8080808080, '1607 Birchwood Drive, Champaign, IL'),
('C0010', 'Zoe', 'King', 'zoe.king@example.com', 9090909090, '1708 Elmwood Avenue, Decatur, IL');

# update CUSTOMERS set phone_number=NULL where customer_id='C0008';
SELECT * FROM CUSTOMERS;
CREATE TABLE RESTAURANTS(
	restaurant_id VARCHAR(10) PRIMARY KEY,
    restaurant_name VARCHAR(50),
    cuisine_type VARCHAR(30),
    address  VARCHAR(100));

INSERT INTO RESTAURANTS (restaurant_id, restaurant_name, cuisine_type, address) VALUES
('R0001', 'The Italian Bistro', 'Italian', '123 Pasta Lane, Rome, Italy'),
('R0002', 'Sushi World', 'Japanese', '456 Fish Street, Tokyo, Japan'),
('R0003', 'Taco Haven', 'Mexican', '789 Salsa Blvd, Mexico City, Mexico'),
('R0004', 'Curry Palace', 'Indian', '101 Spice Road, New Delhi, India'),
('R0005', 'Parisian Delight', 'French', '202 Croissant Ave, Paris, France'),
('R0006', 'Chopsticks & Wok', 'Chinese', '303 Noodle Drive, Beijing, China'),
('R0007', 'Steakhouse Grill', 'American', '404 Beef Street, Texas, USA'),
('R0008', 'Le Sushi Bar', 'Japanese', '505 Ocean View, Kyoto, Japan'),
('R0009', 'Pasta Primavera', 'Italian', '606 Tomato Lane, Florence, Italy'),
('R0010', 'Burgers & Fries', 'American', '707 Burger Blvd, Los Angeles, USA');


INSERT INTO RESTAURANTS (restaurant_id, restaurant_name, cuisine_type, address) VALUES
('R0011', 'Savor India', 'Indian', '808 Curry Circle, Seattle, WA'),
('R0012', 'The Sushi Spot', 'Japanese', '909 Ocean Drive, Orlando, FL'),
('R0013', 'Café de Paris', 'French', '101 Rue Parisienne, Las Vegas, NV'),
('R0014', 'BBQ Heaven', 'American', '202 BBQ Street, Denver, CO'),
('R0015', 'Mediterranean Delights', 'Mediterranean', '303 Olive Avenue, San Diego, CA');


SELECT * FROM RESTAURANTS;

# FETCH UNIQUE CUISINES OFFERED BY RESTAURANTS
	SELECT DISTINCT cuisine_type FROM RESTAURANTS;

# LIST ALL CUSTOMERS AND ASSIGN ALIAS FOR first_name AND last_name
	SELECT first_name AS 'CUSTOMER FIRST NAME', last_name AS 'CUSTOMER LAST NAME' FROM CUSTOMERS;
 
# SEARCH CUSTOMER WITH CUSTOMER_ID C0005 
	SELECT * FROM CUSTOMERS WHERE customer_id='C0005';

CREATE TABLE MENU_ITEMS(
	item_id VARCHAR(10) PRIMARY KEY,
    restaurant_id VARCHAR(10),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANTS(restaurant_id),
    item_name VARCHAR(50),
    price FLOAT);

INSERT INTO MENU_ITEMS (item_id, restaurant_id, item_name, price) VALUES
	('MI001', 'R0001', 'Cheeseburger', 5.99),
	('MI002', 'R0001', 'Veggie Burger', 6.49),
	('MI003', 'R0001', 'Chicken Sandwich', 7.99),
	('MI004', 'R0001', 'French Fries', 2.99),
	('MI005', 'R0001', 'Milkshake', 3.99),
	('MI006', 'R0002', 'Pepperoni Pizza', 8.99),
	('MI007', 'R0002', 'Margherita Pizza', 7.99),
	('MI008', 'R0002', 'BBQ Chicken Pizza', 9.99),
	('MI009', 'R0002', 'Hawaiian Pizza', 8.49),
	('MI010', 'R0002', 'Garlic Bread', 4.99),
	('MI011', 'R0003', 'Spaghetti Carbonara', 10.99),
	('MI012', 'R0003', 'Fettuccine Alfredo', 11.49),
	('MI013', 'R0003', 'Lasagna', 12.99),
	('MI014', 'R0003', 'Penne Arrabbiata', 9.49),
	('MI015', 'R0003', 'Garlic Knots', 3.49),
	('MI016', 'R0004', 'Grilled Salmon', 15.99),
	('MI017', 'R0004', 'Caesar Salad', 8.49),
	('MI018', 'R0004', 'Chicken Caesar Salad', 10.99),
	('MI019', 'R0004', 'Seared Tuna', 17.49),
	('MI020', 'R0004', 'Vegetable Stir-Fry', 7.49),
	('MI021', 'R0005', 'Sushi Roll', 14.99),
	('MI022', 'R0005', 'Tempura Shrimp', 12.99),
	('MI023', 'R0005', 'California Roll', 11.49),
	('MI024', 'R0005', 'Spicy Tuna Roll', 13.49),
	('MI025', 'R0005', 'Miso Soup', 4.99),
	('MI026', 'R0006', 'Pad Thai', 9.99),
	('MI027', 'R0006', 'Green Curry', 10.49),
	('MI028', 'R0006', 'Massaman Curry', 11.49),
	('MI029', 'R0006', 'Tom Yum Soup', 6.99),
	('MI030', 'R0006', 'Spring Rolls', 5.99),
	('MI032', 'R0007', 'Hummus Plate', 6.99),
	('MI033', 'R0007', 'Tabbouleh', 5.49),
	('MI034', 'R0007', 'Baba Ghanoush', 6.49),
	('MI035', 'R0007', 'Shawarma Plate', 10.99),
	('MI036', 'R0008', 'Chicken Tikka Masala', 13.49),
	('MI037', 'R0008', 'Butter Chicken', 12.99),
	('MI038', 'R0008', 'Naan Bread', 2.99),
	('MI039', 'R0008', 'Lamb Vindaloo', 14.99),
	('MI040', 'R0008', 'Saag Paneer', 11.49),
	('MI041', 'R0009', 'Ramen', 11.99),
	('MI042', 'R0009', 'Gyoza', 6.49),
	('MI043', 'R0009', 'Pork Bao', 5.99),
	('MI044', 'R0009', 'Tonkotsu Ramen', 12.99),
	('MI045', 'R0009', 'Edamame', 4.99),
	('MI046', 'R0010', 'BBQ Ribs', 15.99),
	('MI047', 'R0010', 'Grilled Chicken Wings', 9.99),
	('MI048', 'R0010', 'Pulled Pork Sandwich', 8.99),
	('MI049', 'R0010', 'Mac and Cheese', 6.49),
	('MI050', 'R0010', 'Coleslaw', 3.49);

SELECT * FROM MENU_ITEMS;

CREATE TABLE ORDERS(
	order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    restaurant_id VARCHAR(10),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANTS(restaurant_id),
    order_date DATE NOT NULL,
    total_price FLOAT );

Drop table  orders;
INSERT INTO ORDERS (order_id, customer_id, restaurant_id, order_date, total_price) VALUES
	('O001', 'C0001', 'R0001', '2024-11-01', 22),
    ('O002', 'C0001', 'R0002', '2024-11-02', 35),
    ('O003', 'C0001', 'R0003', '2024-11-03', 15),
    ('O004', 'C0001', 'R0004', '2024-11-04', 28),
    ('O005', 'C0001', 'R0005', '2024-11-05', 14);
/*    */
INSERT INTO ORDERS (order_id, customer_id, restaurant_id, order_date, total_price) VALUES
    ('O006', 'C0001', 'R0006', '2024-11-06', 35),
    ('O007', 'C0001', 'R0007', '2024-11-07', 37),
    ('O008', 'C0001', 'R0008', '2024-11-08', 23),
    ('O009', 'C0001', 'R0009', '2024-11-09', 57),
    ('O010', 'C0001', 'R0010', '2024-11-10', 18),
    ('O011', 'C0002', 'R0001', '2024-11-11', 15),
    ('O012', 'C0002', 'R0002', '2024-11-12', 23),
    ('O013', 'C0002', 'R0003', '2024-11-13', 38),
    ('O014', 'C0002', 'R0004', '2024-11-14', 42),
    ('O015', 'C0002', 'R0005', '2024-11-15', 53),
    ('O016', 'C0002', 'R0006', '2024-11-16', 12),
    ('O017', 'C0002', 'R0007', '2024-11-17', 22),
    ('O018', 'C0002', 'R0008', '2024-11-18', 32),
    ('O019', 'C0002', 'R0009', '2024-11-19', 42),
    ('O020', 'C0002', 'R0010', '2024-11-20', 13),
    ('O021', 'C0003', 'R0001', '2024-11-21', 23),
    ('O022', 'C0003', 'R0002', '2024-11-22', 13),
    ('O023', 'C0004', 'R0003', '2024-11-23', 33),
    ('O024', 'C0004', 'R0004', '2024-11-24', 43),
    ('O025', 'C0005', 'R0005', '2024-11-25', 53);


SELECT * FROM ORDER_ITEMS;
CREATE TABLE ORDER_ITEMS(
	order_item_id VARCHAR(10) PRIMARY KEY,
    Order_id VARCHAR(10),
    FOREIGN KEY (Order_id) REFERENCES ORDERS(Order_id),
    item_id VARCHAR(10),
    FOREIGN KEY (item_id) REFERENCES MENU_ITEMS(item_id),
    quantity INT);
    

INSERT INTO ORDER_ITEMS (order_item_id, Order_id, item_id, quantity) VALUES
('OI001', 'O001', 'MI001', 2),
('OI002', 'O001', 'MI002', 3),
('OI003', 'O002', 'MI003', 1),
('OI004', 'O003', 'MI004', 4),
('OI005', 'O004', 'MI005', 2),
('OI006', 'O005', 'MI006', 1);

CREATE TABLE DELIVERY_AGENTS(
	agent_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number BIGINT);
    
INSERT INTO DELIVERY_AGENTS (agent_id, first_name, last_name, phone_number) VALUES
('A0001', 'John', 'Doe', 1234567890),
('A0002', 'Alice', 'Smith', 2345678901),
('A0003', 'Robert', 'Johnson', 34567809012),
('A0004', 'Emily', 'Davis', 4567890123),
('A0005', 'Michael', 'Martinez', 5678901234),
('A0006', 'Sarah', 'Wilson', 6789012345),
('A0007', 'James', 'Brown', 7890123456),
('A0008', 'Olivia', 'Taylor', 8901234567),
('A0009', 'David', 'Anderson', 9012345678),
('A0010', 'Sophia', 'Thomas', 1234509876);

INSERT INTO DELIVERY_AGENTS (agent_id, first_name, last_name, phone_number) VALUES
('A0011', 'Matthew', 'Jackson', 2345612345),
('A0012', 'Charlotte', 'White', 3456723456),
('A0013', 'Benjamin', 'Harris', 4567834567),
('A0014', 'Amelia', 'Clark', 5678945678),
('A0015', 'Lucas', 'Lewis', 6789056789),
('A0016', 'Grace', 'Walker', 7890167890),
('A0017', 'Ethan', 'Allen', 8901278901),
('A0018', 'Mia', 'Young', 9012389012),
('A0019', 'Noah', 'King', 1234990123),
('A0020', 'Isabella', 'Scott', 2345101234);

CREATE TABLE DELIVERIES(
	delivery_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    FOREIGN KEY (Order_id) REFERENCES ORDERS(Order_id),
    agent_id VARCHAR(10),
    FOREIGN KEY (agent_id) REFERENCES DELIVERY_AGENTS(agent_id));

INSERT INTO DELIVERIES (delivery_id, order_id, agent_id) VALUES 
	('D0001', 'O001', 'A0001'), 
	('D0002', 'O002', 'A0002'), 
	('D0003', 'O003', 'A0003'), 
	('D0004', 'O004', 'A0004'), 
	('D0005', 'O005', 'A0005'), 
	('D0006', 'O006', 'A0006'), 
	('D0007', 'O007', 'A0007'), 
	('D0008', 'O008', 'A0008'), 
	('D0009', 'O009', 'A0009'), 
	('D0010', 'O010', 'A0010');


# Retreive orders with a total price greater than $25.
SELECT * FROM ORDERS WHERE total_price>25;

# Find orders where the quantity of items is less than 3 but greater than 1.
SELECT * FROM ORDER_ITEMS WHERE quantity=2;
SELECT * FROM ORDER_ITEMS WHERE quantity>1 and quantity<3;

-- DAY 33	# Concepts: IS NULL, IS NOT NULL, IN, NOT IN	###################################################
SELECT * FROM CUSTOMERS;
# Find customers with a missing phone number.  --  IS NULL
	SELECT * FROM CUSTOMERS WHERE phone_number IS NULL ;
# Find customers with phone number.   --  IS NOT NULL
	SELECT * FROM CUSTOMERS WHERE phone_number IS NOT NULL ;


SELECT * FROM RESTAURANTS;    
# List all restaurants not serving Italian or Japanese cuisine.   --  IN
	SELECT * FROM RESTAURANTS WHERE cuisine_type NOT IN ('Italian','Japanese');
# List all restaurants serving Italian or Japanese cuisine.   --  NOT IN
	SELECT * FROM RESTAURANTS WHERE cuisine_type IN ('Italian','Japanese');
    
-- #####     DAY 34   Concepts: BETWEEN, NOT BETWEEN, LIKE, NOT LIKE	###################################################
SELECT * FROM ORDERS;
# Retrieve all orders placed between 2024-01-01 and 2000-01-07.
	SELECT * FROM ORDERS WHERE order_date BETWEEN '2000-01-07' and '2024-01-01';
# Retrieve all orders not placed between 2024-01-01 and 2000-01-07.
	SELECT * FROM ORDERS WHERE order_date NOT BETWEEN '2000-01-07' and '2024-01-01';
    
SELECT * FROM CUSTOMERS;
# Find customers whose first name starts with ‘L’ and ends with ‘s’.    
	SELECT * FROM CUSTOMERS WHERE first_name like 'L%s';
# Find customers whose first name does not starts with ‘J’ and does not ends with ‘n’.   
	SELECT * FROM CUSTOMERS WHERE first_name not like 'L%s';
# Find customers whose last name has ‘h’ as second alphabet
	SELECT * FROM CUSTOMERS WHERE last_name like '_h%';
    
    
    
-- #####     DAY 35   Concepts: ORDER BY, LIMIT    ###################################################
# List the 5 most expensive menu items.
	SELECT * FROM MENU_ITEMS ORDER BY price DESC limit 5;
# Retrieve the top 3 customers who placed the highest number of orders.
	SELECT customer_id AS "CUSTOMER" ,COUNT(*) AS "TOTAL ORDERS"  FROM ORDERS GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 3;


-- #####     DAY 36   Concepts: Aggregate Functions (COUNT, SUM, AVG)	###################################################
    SELECT * FROM ORDERS;
    SELECT * FROM MENU_ITEMS;

# Count the total number of orders.
	SELECT COUNT(*) as "Total Orders"  FROM ORDERS;

# Find the sum of total sale done in Restaurant 'R0003'
    SELECT restaurant_id,SUM(total_price) as "Total Sales" FROM ORDERS where restaurant_id='R0003';
    
# Calculate the average price of menu items in Restaurant 'R0003'.    
	SELECT restaurant_id,ROUND(AVG(price),2) as "Average Price" FROM MENU_ITEMS where restaurant_id='R0003';


-- #####     DAY 37   Concepts: GROUP BY, HAVING  ###################################################
    SELECT * FROM ORDERS;

# Group orders by restaurant and calculate total sales per restaurant.
	SELECT  restaurant_id,sum(total_price) as "Total Sales"  FROM ORDERS GROUP BY restaurant_id;

# Find restaurants with sales greater than $50.
    SELECT  restaurant_id,sum(total_price) as "Total Sales"  FROM ORDERS GROUP BY restaurant_id HAVING sum(total_price)>50;
    

-- #####     DAY 38   Concepts: INNER JOIN	###################################################
	SELECT * FROM ORDERS;
    SELECT * FROM CUSTOMERS;
    SELECT * FROM RESTAURANTS;
# List all orders along with the customer and restaurant details using an inner join.
	SELECT O.*,C.*,R.* FROM ORDERS O
    INNER JOIN CUSTOMERS C ON O.customer_id=C.customer_id
    INNER JOIN RESTAURANTS R ON O.restaurant_id=R.restaurant_id ORDER BY O.order_id;


-- #####     DAY 39   Concepts: LEFT JOIN, RIGHT JOIN	###################################################
	SELECT * FROM RESTAURANTS;
    SELECT * FROM ORDERS;
    SELECT * FROM DELIVERY_AGENTS;
    SELECT * FROM DELIVERIES;

# Fetch all restaurants and include orders (even if they don’t have any orders using LEFT JOIN
	SELECT R.*,O.* FROM RESTAURANTS R
    LEFT JOIN ORDERS O ON O.restaurant_id=R.restaurant_id ORDER BY O.order_id;

# Use RIGHT JOIN to display deliveries, even if agents haven't made any deliveries.
	SELECT D.*, DA.* FROM DELIVERIES D
    RIGHT JOIN DELIVERY_AGENTS DA ON D.agent_id=DA.agent_id;


-- #####     DAY 40   Concepts: UNION, UNION ALL	###################################################

# Combine customer and delivery agent names into a single list using UNION.
	SELECT first_name FROM DELIVERY_AGENTS
    UNION 
    SELECT first_name  FROM CUSTOMERS 
    ORDER BY first_name ;
    
# Use UNION ALL to include duplicate values from two queries.
	SELECT first_name FROM DELIVERY_AGENTS
    UNION ALL
    SELECT first_name  FROM CUSTOMERS
    ORDER BY first_name ;

    
-- #####     DAY 41   Concepts: Mathematical Functions	################################################### 
# Use mathematical functions to apply a 10% discount on all menu items.   
    SELECT *,ROUND((PRICE*1/100),2) AS DISCOUNT,round(PRICE-(PRICE*1/100),2) AS DISCOUNTED_PRICE FROM MENU_ITEMS;
    CREATE TABLE MENU_ITEM AS (SELECT * FROM MENU_ITEMS);
    SELECT *,ROUND((PRICE*1/100),2) AS DISCOUNT,round(PRICE-(PRICE*1/100),2) AS DISCOUNTED_PRICE FROM MENU_ITEM;
    UPDATE MENU_ITEM SET PRICE=round(PRICE-(PRICE*1/100),2);
    DESC MENU_ITEM;
    
-- #####     DAY 42   Concepts: String Functions	################################################### 
    SELECT * FROM CUSTOMERS;
    SELECT CONCAT(first_name," ",last_name) as 'CUSTOMER',email,LENGTH(email) FROM CUSTOMERS;		# CONCAT AND LENGTH FUNCTIONS
    SELECT upper(first_name),lower(last_name) FROM CUSTOMERS;										# UPPER AND LOWER FUNCTIONS
    SELECT email,REPLACE(email,'example','gmail') as 'REPLACED GMAIL ID' FROM CUSTOMERS;			# REPLACE FUNCTION
    SELECT email,REVERSE(email) as 'REVERSED EMAIL ID' FROM CUSTOMERS;								# REVERSE FUNCTION
    SELECT email,INSTR(email,'@') as 'POSITION OF @ SYMBOL' FROM CUSTOMERS;							# INSTR FUNCTION 
    SELECT email,SUBSTR(email,1,5)  FROM CUSTOMERS;													# extract first 5 characters from email	
    SELECT TRIM("    NIVED SUDHINDRAN    ") ;														# remove leading and trailing spaces
    
   
    ALTER TABLE DELIVERIES ADD delivery_date DATE;
    ALTER TABLE DELIVERIES ADD delivery_status VARCHAR(1) DEFAULT 'N';
    SELECT * FROM DELIVERIES;
    SELECT * FROM ORDERS;
    UPDATE DELIVERIES SET delivery_date='2024-11-15' where order_id='O010';
    UPDATE DELIVERIES SET delivery_status='Y' ;
    
    
    -- #####     DAY 43   Concepts: Date Functions	################################################### 
   
   # Calculate the duration between order date and delivery date.
    SELECT * FROM ORDERS;
    SELECT * FROM DELIVERIES ;
    
    SELECT O.ORDER_ID,O.ORDER_DATE,D.DELIVERY_DATE, DATEDIFF(D.DELIVERY_DATE,O.ORDER_DATE) AS "DAYS TOOK FOR DELIVERY"
    FROM ORDERS O 
    INNER JOIN DELIVERIES D ON O.ORDER_ID=D.ORDER_ID;


    -- #####     DAY 44   Concepts: Subqueries, Views	################################################### 
   
   # Use a subquery to find customers with more than 1 order.
	SELECT * FROM ORDERS;
    SELECT * FROM CUSTOMERS;
    SELECT customer_id,concat(first_name," ",last_name) as "Customer Name" from CUSTOMERS
    where customer_id in (SELECT CUSTOMER_ID FROM ORDERS GROUP BY CUSTOMER_ID HAVING COUNT(*)>1);
    
   # Create a view that shows the top 3 highest spending customers.
   # UPDATE ORDERS SET TOTAL_PRICE=500 WHERE ORDER_ID='O025';
    /* 
		CREATE OR REPLACE VIEW TOP_3_CUSTOMERS AS 
		SELECT customer_id,concat(first_name," ",last_name) as "Customer Name" from CUSTOMERS
        where customer_id in (SELECT CUSTOMER_ID FROM ORDERS GROUP BY CUSTOMER_ID ORDER BY SUM(total_price) desc LIMIT 3 ) ;
	*/
	
    CREATE OR REPLACE VIEW TOP_3_CUSTOMERS AS 
    SELECT C.customer_id ,concat(first_name," ",last_name) as "Customer Name", SUM(total_price) from CUSTOMERS C
    JOIN ORDERS O ON C.customer_id=O.customer_id
    GROUP BY O.customer_id,first_name,last_name
    ORDER BY SUM(total_price) desc LIMIT 3;
    
    SELECT * FROM TOP_3_CUSTOMERS;
    
	-- #####     DAY 45   Concepts: Stored Procedures, Triggers	################################################### 
    #Write a stored procedure to update the delivery status.
    DELIMITER $$
    CREATE PROCEDURE UPDATE_DELIVERY_STATUS(IN O_ID VARCHAR(10))
    BEGIN
		UPDATE DELIVERIES SET delivery_status='Y' WHERE order_id=O_ID;
    END $$
    DELIMITER ;
    
    CALL UPDATE_DELIVERY_STATUS('O010');
        UPDATE DELIVERIES SET delivery_status='N' WHERE ORDER_ID='O010';
    SELECT * FROM DELIVERIES WHERE ORDER_ID='O010';
    
    #Create a trigger to update total price when an order item is added.
    SELECT * FROM ORDER_ITEMS;
    SELECT * FROM ORDERS;
    SELECT * FROM MENU_ITEMS;
    SELECT SUM(OI.QUANTITY*MI.PRICE) 
        FROM ORDER_ITEMS OI JOIN MENU_ITEMS MI ON OI.ITEM_ID=MI.ITEM_ID WHERE OI.ORDER_ID='O005';
    DELIMITER $$
    CREATE TRIGGER UPDATE_TOTAL_PRICE
    AFTER INSERT ON ORDER_ITEMS
    FOR EACH ROW
    BEGIN
		DECLARE MY_TOTAL FLOAT(8.2);
        SELECT SUM(OI.QUANTITY*MI.PRICE) INTO MY_TOTAL
        FROM ORDER_ITEMS OI JOIN MENU_ITEMS MI ON OI.ITEM_ID=MI.ITEM_ID WHERE OI.ORDER_ID=NEW.ORDER_ID;
    UPDATE ORDERS SET TOTAL_PRICE=MY_TOTAL WHERE ORDER_ID=NEW.ORDER_ID;
    END $$
    DELIMITER ;
    
    INSERT INTO ORDER_ITEMS (order_item_id, Order_id, item_id, quantity) VALUES
    ('OI009', 'O005', 'MI025', 10);
    
    ############  PROJECT COMPLETED  ###################################################################