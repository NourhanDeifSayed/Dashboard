
-- SELECT
--   SUM(CASE WHEN "is amazon seller" = 'Y' THEN 1 ELSE 0 END) AS AmazonSellerCount,
--   SUM(CASE WHEN "is amazon seller" != 'Y' OR "is amazon seller" IS NULL THEN 1 ELSE 0 END) AS NotAmazonSellerCount
-- FROM db_data;


-- UPDATE db_data
-- SET Quantity = 'new_data'
-- WHERE Quantity IS NULL
--   AND ROWID IN (SELECT ROWID FROM db_data WHERE Quantity IS NULL LIMIT 200);



-- -- Step 1: Add a new column 'Profit' to db_data table
-- ALTER TABLE db_data ADD COLUMN Profit INTEGER;

-- -- Step 2: Update the 'Profit' column with 200 records (you may adjust the logic based on your data)
-- UPDATE db_data
-- SET Profit = ABS(RANDOM() % 1000);  -- Example: Assign a random profit value (between 0 and 999) to each record



-- SELECT
--     category,
--     COUNT(*) AS product_count
-- FROM
--     db_data
-- GROUP BY
--     category;


  
-- SELECT "Product Name", "Selling Price"
-- FROM db_data
-- GROUP BY "Product Name", "Selling Price"
-- LIMIT 5;


-- CREATE TABLE Products (
--     ProductID INTEGER PRIMARY KEY,
--     ProductName TEXT NOT NULL,
--     Category TEXT,
--     Price REAL,
--     StockQuantity INTEGER
-- );

-- INSERT INTO Products (ProductName, Category, Price, StockQuantity)
-- VALUES
--     ('Laptop', 'Technology', 1200.00, 50),
--     ('Smartphone', 'Technology', 800.00, 30),
--     ('Tablet', 'Technology', 400.00, 20),
--     ('Smartwatch', 'Technology', 150.00, 25),
--     ('Headphones', 'Technology', 80.00, 40),
--     ('Desktop Computer', 'Technology', 1500.00, 15),
--     ('Digital Camera', 'Technology', 300.00, 30),
--     ('Bluetooth Speaker', 'Technology', 50.00, 50),
--     ('Gaming Console', 'Technology', 400.00, 10),
--     ('Wireless Mouse', 'Technology', 20.00, 60),
--     -- Duplicate entries for redundancy
--     ('Laptop', 'Technology', 1200.00, 50),
--     ('Smartphone', 'Technology', 800.00, 30),
--     ('Tablet', 'Technology', 400.00, 20),
--     ('Smartwatch', 'Technology', 150.00, 25),
--     ('Headphones', 'Technology', 80.00, 40),
--     ('Desktop Computer', 'Technology', 1500.00, 15),
--     ('Digital Camera', 'Technology', 300.00, 30),
--     ('Bluetooth Speaker', 'Technology', 50.00, 50),
--     ('Gaming Console', 'Technology', 400.00, 10),
--     ('Wireless Mouse', 'Technology', 20.00, 60),
--     -- Add more entries as needed
--     ('VR Headset', 'Technology', 200.00, 15),
--     ('External Hard Drive', 'Technology', 100.00, 25),
--     ('Graphics Card', 'Technology', 300.00, 10),
--     ('Fitness Tracker', 'Technology', 60.00, 35),
--     ('USB Flash Drive', 'Technology', 15.00, 50),
--     ('Network Router', 'Technology', 80.00, 20),
--     ('Printer', 'Technology', 120.00, 15),
--     -- Add more entries as needed
--     ('Smart TV', 'Technology', 600.00, 12),
--     ('Wireless Keyboard', 'Technology', 40.00, 30),
--     ('Bluetooth Earbuds', 'Technology', 30.00, 40),
--     ('Smart Thermostat', 'Technology', 100.00, 18),
--     ('Computer Monitor', 'Technology', 200.00, 22),
--     -- Add more entries as needed
--     ('Webcam', 'Technology', 50.00, 25),
--     ('Projector', 'Technology', 300.00, 8),
--     ('Portable Charger', 'Technology', 25.00, 45),
--     ('Digital Scale', 'Technology', 20.00, 20),
--     ('Security Camera', 'Technology', 120.00, 15);



-- SELECT ProductName, SUM(Price) AS TotalSales
-- FROM Products
-- GROUP BY ProductName
-- ORDER BY TotalSales DESC
-- LIMIT 5;

-- CREATE TABLE Customers (
--     CustomerID INT PRIMARY KEY,
--     FirstName VARCHAR(50),
--     LastName VARCHAR(50),
--     Email VARCHAR(100),
--     Address VARCHAR(255),
--     PhoneNumber VARCHAR(15)
-- );


-- CREATE TABLE Orders (
--     OrderID INT PRIMARY KEY,
--     CustomerID INT,
--     OrderDate DATE,
--     TotalAmount DECIMAL(10, 2),
--     Status VARCHAR(20),
--     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
-- );


-- INSERT INTO Customers (CustomerID,FirstName, LastName, Email, Address, PhoneNumber) VALUES
--     (1, 'John', 'Doe', 'john.doe@email.com', 'Africa Address 1', '123-456-7890'),
--     (2, 'Jane', 'Smith', 'jane.smith@email.com', 'Africa Address 2', '987-654-3210'),
--     (3, 'David', 'Williams', 'david.williams@email.com', 'Asia Address 1', '456-789-0123'),
--     (4, 'Emily', 'Johnson', 'emily.johnson@email.com', 'Asia Address 2', '789-012-3456'),
--     (5, 'Michael', 'Brown', 'michael.brown@email.com', 'Europe Address 1', '234-567-8901'),
--     (6, 'Emma', 'Jones', 'emma.jones@email.com', 'Europe Address 2', '567-890-1234'),
--     (7, 'Christopher', 'Davis', 'christopher.davis@email.com', 'North America Address 1', '345-678-9012'),
--     (8, 'Olivia', 'Miller', 'olivia.miller@email.com', 'North America Address 2', '678-901-2345'),
--     (9, 'Daniel', 'Martinez', 'daniel.martinez@email.com', 'South America Address 1', '789-012-3456'),
--     (10, 'Ava', 'Rodriguez', 'ava.rodriguez@email.com', 'South America Address 2', '890-123-4567'),
--     (11, 'Liam', 'Garcia', 'liam.garcia@email.com', 'Oceania Address 1', '901-234-5678'),
--     (12, 'Sophia', 'Lopez', 'sophia.lopez@email.com', 'Oceania Address 2', '123-456-7890'),
--     (13, 'Mia', 'Taylor', 'mia.taylor@email.com', 'Africa Address 3', '987-654-3210'),
--     (14, 'Noah', 'Hernandez', 'noah.hernandez@email.com', 'Africa Address 4', '456-789-0123'),
--     (15, 'Isabella', 'Smith', 'isabella.smith@email.com', 'Asia Address 3', '789-012-3456'),
--     (16, 'Ethan', 'Jackson', 'ethan.jackson@email.com', 'Asia Address 4', '234-567-8901'),
--     (17, 'Aiden', 'White', 'aiden.white@email.com', 'Europe Address 3', '567-890-1234'),
--     (18, 'Amelia', 'Taylor', 'amelia.taylor@email.com', 'Europe Address 4', '678-901-2345'),
--     (19, 'Lily', 'Harris', 'lily.harris@email.com', 'North America Address 3', '890-123-4567'),
--     (20, 'Logan', 'Clark', 'logan.clark@email.com', 'North America Address 4', '901-234-5678'),
--     (21, 'Lucas', 'Martin', 'lucas.martin@email.com', 'South America Address 3', '123-456-7890'),
--     (22, 'Sophie', 'King', 'sophie.king@email.com', 'South America Address 4', '987-654-3210'),
--     (23, 'Benjamin', 'Lee', 'benjamin.lee@email.com', 'Oceania Address 3', '456-789-0123'),
--     (24, 'Ava', 'Ward', 'ava.ward@email.com', 'Oceania Address 4', '789-012-3456'),
--     (25, 'Elijah', 'Cooper', 'elijah.cooper@email.com', 'Asia Address 5', '345-678-9012'),
--     (26, 'Aria', 'Perez', 'aria.perez@email.com', 'Europe Address 5', '678-901-2345'),
--     (27, 'Henry', 'Turner', 'henry.turner@email.com', 'North America Address 5', '890-123-4567'),
--     (28, 'Avery', 'Gonzalez', 'avery.gonzalez@email.com', 'South America Address 5', '901-234-5678'),
--     (29, 'Jackson', 'Fisher', 'jackson.fisher@email.com', 'Oceania Address 5', '123-456-7890'),
--     (30, 'Scarlett', 'Baker', 'scarlett.baker@email.com', 'Africa Address 5', '987-654-3210'),
--     (31, 'Aiden', 'Sullivan', 'aiden.sullivan@email.com', 'Asia Address 6', '456-789-0123'),
--     (32, 'Chloe', 'Adams', 'chloe.adams@email.com', 'Europe Address 6', '789-012-3456'),
--     (33, 'Mason', 'Ward', 'mason.ward@email.com', 'North America Address 6', '234-567-8901'),
--     (34, 'Ella', 'Fisher', 'ella.fisher@email.com', 'South America Address 6', '567-890-1234'),
--     (35, 'Carter', 'Fletcher', 'carter.fletcher@email.com', 'Oceania Address 6', '678-901-2345'),
--     (36, 'Penelope', 'Cooper', 'penelope.cooper@email.com', 'Africa Address 6', '890-123-4567'),
--     (37, 'Grayson', 'Martin', 'grayson.martin@email.com', 'Asia Address 7', '901-234-5678'),
--     (38, 'Luna', 'Clark', 'luna.clark@email.com', 'Europe Address 7', '123-456-7890'),
--     (39, 'Lucas', 'Turner', 'lucas.turner@email.com', 'North America Address 7', '987-654-3210'),
--     (40, 'Stella', 'Fisher', 'stella.fisher@email.com', 'South America Address 7', '456-789-0123'),
--     (41, 'Ethan', 'Ward', 'ethan.ward@email.com', 'Oceania Address 7', '789-012-3456'),
--     (42, 'Aria', 'Sullivan', 'aria.sullivan@email.com', 'Africa Address 7', '234-567-8901'),
--     (43, 'Liam', 'Baker', 'liam.baker@email.com', 'Asia Address 8', '567-890-1234'),
--     (44, 'Ava', 'Adams', 'ava.adams@email.com', 'Europe Address 8', '678-901-2345'),
--     (45, 'Noah', 'Ward', 'noah.ward@email.com', 'North America Address 8', '890-123-4567'),
--     (46, 'Mia', 'Fletcher', 'mia.fletcher@email.com', 'South America Address 8', '901-234-5678'),
--     (47, 'Oliver', 'Martin', 'oliver.martin@email.com', 'Oceania Address 8', '123-456-7890'),
--     (48, 'Emma', 'Turner', 'emma.turner@email.com', 'Africa Address 8', '987-654-3210'),
--     (49, 'Liam', 'Sullivan', 'liam.sullivan@email.com', 'Asia Address 9', '456-789-0123'),
--     (50, 'Sophia', 'Fisher', 'sophia.fisher@email.com', 'Europe Address 9', '789-012-3456');


-- INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
--     (1, 1, '2023-01-01', 150.50, 'Processing'),
--     (2, 2, '2023-01-02', 200.75, 'Shipped'),
--     (3, 3, '2023-01-03', 75.99, 'Delivered'),
--     (4, 4, '2023-01-04', 120.25, 'Processing'),
--     (5, 5, '2023-01-05', 80.50, 'Shipped'),
--     (6, 6, '2023-01-06', 300.00, 'Processing'),
--     (7, 7, '2023-01-07', 150.00, 'Delivered'),
--     (8, 8, '2023-01-08', 250.75, 'Processing'),
--     (9, 9, '2023-01-09', 100.50, 'Shipped'),
--     (10, 10, '2023-01-10', 180.25, 'Delivered'),
--     (11, 11, '2023-01-11', 90.99, 'Processing'),
--     (12, 12, '2023-01-12', 130.75, 'Shipped'),
--       (13, 13, '2023-01-13', 110.25, 'Processing'),
--     (14, 14, '2023-01-14', 95.50, 'Shipped'),
--     (15, 15, '2023-01-15', 200.00, 'Delivered'),
--     (16, 16, '2023-01-16', 150.75, 'Processing'),
--     (17, 17, '2023-01-17', 120.00, 'Shipped'),
--     (18, 18, '2023-01-18', 180.50, 'Processing'),
--     (19, 19, '2023-01-19', 300.25, 'Delivered'),
--     (20, 20, '2023-01-20', 250.99, 'Processing'),
--     (21, 21, '2023-01-21', 130.75, 'Shipped'),
--     (22, 22, '2023-01-22', 160.50, 'Delivered'),
--     (23, 23, '2023-01-23', 90.25, 'Processing'),
--     (24, 24, '2023-01-24', 140.00, 'Shipped'),
--      (25, 25, '2023-01-25', 175.25, 'Delivered'),
--     (26, 26, '2023-01-26', 220.50, 'Processing'),
--     (27, 27, '2023-01-27', 90.99, 'Shipped'),
--     (28, 28, '2023-01-28', 130.75, 'Processing'),
--     (29, 29, '2023-01-29', 200.00, 'Delivered'),
--     (30, 30, '2023-01-30', 150.25, 'Shipped'),
--     (31, 31, '2023-01-31', 180.50, 'Processing'),
--     (32, 32, '2023-02-01', 300.99, 'Delivered'),
--     (33, 33, '2023-02-02', 125.75, 'Processing'),
--     (34, 34, '2023-02-03', 160.00, 'Shipped'),
--     (35, 35, '2023-02-04', 220.25, 'Delivered'),
--     (36, 36, '2023-02-05', 90.99, 'Processing'),
--     (37, 37, '2023-02-06', 135.50, 'Shipped'),
--     (38, 38, '2023-02-07', 180.00, 'Processing'),
--     (39, 39, '2023-02-08', 250.25, 'Delivered'),
--     (40, 40, '2023-02-09', 120.50, 'Processing'),
--     (41, 41, '2023-02-10', 190.75, 'Shipped'),
--     (42, 42, '2023-02-11', 200.00, 'Delivered'),
--     (43, 43, '2023-02-12', 110.25, 'Processing'),
--     (44, 44, '2023-02-13', 140.50, 'Shipped'),
--     (45, 45, '2023-02-14', 170.75, 'Processing'),
--     (46, 46, '2023-02-15', 300.00, 'Delivered'),
--     (47, 47, '2023-02-16', 125.25, 'Processing'),
--     (48, 48, '2023-02-17', 160.50, 'Shipped'),
--     (49, 49, '2023-02-18', 180.99, 'Processing'),
--     (50, 50, '2023-02-19', 220.75, 'Delivered');

-- SELECT
--     Customers.CustomerID,
--     Customers.FirstName,
--     Customers.LastName,
--     COUNT(Orders.OrderID) AS OrderCount,
--     SUM(Orders.TotalAmount) AS TotalAmountSpent
-- FROM
--     Customers
-- JOIN
--     Orders ON Customers.CustomerID = Orders.CustomerID
-- GROUP BY
--     Customers.CustomerID
-- ORDER BY
--     OrderCount DESC, TotalAmountSpent DESC



        SELECT
            Status,
            COUNT(*) AS order_count
        FROM
            Orders
        GROUP BY
            Status;