create database ASM_JAVA5;
use ASM_JAVA5;

CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY NOT NULL,
    password VARCHAR(15) NULL,
    name NVARCHAR(50) NULL,
    photo NVARCHAR(250) NULL,
    phone VARCHAR(10) NULL,
    email VARCHAR(50) NULL,
    role BIT DEFAULT 0 not null,
    activated BIT DEFAULT 1 not null
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY NOT NULL,
    product_name NVARCHAR(50) NULL,
    type BIT NULL,
    brand NVARCHAR(50) NULL,
    color NVARCHAR(50) NULL,
    image NVARCHAR(250) NULL,
    price FLOAT NULL,
    discounted_price FLOAT NULL,
    available BIT DEFAULT 1 not null,
    description NVARCHAR(MAX),
    create_date DATE
);

CREATE TABLE carts (
    cart_id INT IDENTITY PRIMARY KEY,
    product_id VARCHAR(10) NULL,
    product_name NVARCHAR(50) NULL,
	 type BIT NULL,
    image NVARCHAR(250) NULL,
    quantity INT DEFAULT 1 not null,
    discounted_price FLOAT NULL,
    total_payment FLOAT NULL
);

CREATE TABLE orders (
    order_id INT IDENTITY PRIMARY KEY,
    cart_id INT NULL,
    create_date DATE NULL,
    phone VARCHAR(10) NULL,
    email VARCHAR(50) NULL,
    address NVARCHAR(250) NULL,
    product_name NVARCHAR(50) NULL,
	 type BIT NULL,
    quantity INT DEFAULT 1 not null,
    discounted_price FLOAT NULL,
    total_payment FLOAT NULL
);

CREATE TABLE favorite_count (
    favorite_id INT IDENTITY PRIMARY KEY,
    user_id VARCHAR(10) NULL,
    product_id VARCHAR(10) NULL
);

CREATE TABLE number_of_visit (
    date_id DATE PRIMARY KEY,
    number_of_visitors INT NULL
);


ALTER TABLE carts
ADD CONSTRAINT fk_carts_products FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_carts FOREIGN KEY (cart_id) REFERENCES carts(cart_id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE favorite_count
ADD CONSTRAINT fk_favorite_count_users FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE favorite_count
ADD CONSTRAINT fk_favorite_count_products FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE CASCADE ON DELETE SET NULL;




CREATE TRIGGER trg_calculate_total_payment_carts
ON carts
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE carts
    SET total_payment = quantity * discounted_price
    WHERE cart_id IN (SELECT cart_id FROM inserted);
END;

CREATE TRIGGER trg_calculate_total_payment_orders
ON orders
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE orders
    SET total_payment = quantity * discounted_price
    WHERE order_id IN (SELECT order_id FROM inserted);
END;

----------------------------------------------------------
-------------------thêm d? li?u---------------------------
---------------------------------------------------------------
-- Start a transaction
BEGIN TRANSACTION;

-- Insert sample data into Users table
INSERT INTO Users 
VALUES 
    ('U001', 'pass123', 'John Doe', 'john.jpg', '1234567890', 'john@123.com', 1, 1),
    ('U002', 'pass234', 'Jane Smith', 'jane.jpg', '0987654321', 'jane@123.com', 1, 1),
    ('U003', 'pass345', 'Alice Johnson', 'alice.jpg', '1112223333', 'alice@123.com', 0, 1),
    ('U004', 'pass456', 'Bob Brown', 'bob.jpg', '4445556666', 'bob@123.com', 0, 1),
	('U005', 'pass678', 'Jordan Lawson', 'jordan.jpg', '1112223333', 'Jordan@123.com', 0, 1),
	('U006', 'pass890', 'White Ray', 'white.jpg', '1112223333', 'White@123.com', 0, 1);
	go

-- Insert sample data into Products table
INSERT INTO Products 
VALUES 
    ('P001', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN', 0, 'DELL', 'Black', 'lt1.png', 15000000, 7000000, 1, 'Dimensions: 14 inch, RAM: 16GB, CPU: Intel i5, SSD: 512GB', '2024-01-01'),
	('P002', 'Laptop ASUS TUF Gaming F15 FX507ZC4-HN074W', 1, 'Asus', 'Black', 'lt2.png', 8000000, 6000000, 1, 'Dimensions: 13 inch, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P003', 'Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP', 1, 'Acer', 'Black', 'lt3.png', 18000000, 14500000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P004', 'Laptop MSI Gaming GF63 12VE-460VN', 1, 'HP', 'Black', 'lt4.png', 7800000, 6000000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P005', 'Laptop ASUS VivoBook 15 OLED A1505VA-L1114W', 0, 'Asus', 'Black', 'lt5.png', 14000000, 10000000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P006', 'Laptop Lenovo IdeaPad Slim 3 14IAH8 83EQ0009VN', 0, 'HP', 'White', 'lt6.png', 12000000, 9000000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P007', 'Laptop ASUS Vivobook 14 X1404ZA-NK389W', 0, 'Asus', 'White', 'lt7.png', 10000000, 8400000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P008', 'Laptop Acer Aspire 3 A315-59-381E', 1, 'Acer', 'White', 'lt8.png', 16000000, 12000000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P009', 'Laptop Dell Vostro 3520 F0V0VI3', 0, 'DELL', 'Black', 'lt9.png', 20000000, 17000000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P010', 'Laptop Dell Inspiron 15 3520 D5N53', 0, 'DELL', 'Black', 'lt10.png', 17000000, 16300000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
	('P011', 'Laptop ASUS Gaming ROG ZEPHYRUS G16 GU605MI-QR116W', 1, 'ASUS', 'Black', 'lt11.png', 17000000, 16300000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01'),
    ('P012', 'Laptop MSI Pulse 17 AI C1VGKG-017VN', 1, 'HP', 'Black', 'lt12.png', 15000000, 12500000, 1, 'Dimensions: 40x20x30 cm, RAM: 8GB, CPU: Intel i5, SSD: 1TB', '2024-01-01');
	go
-- Insert sample data into Carts table
INSERT INTO Carts 
VALUES 
    ('P001', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN',0 ,'lt1.png', 2, 7000000, 14000000),
    ('P002', 'Laptop ASUS TUF Gaming F15 FX507ZC4-HN074W',1 ,'lt2.png', 1, 6000000, 6000000),
    ('P003', 'Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP',1 ,'lt3.png', 1, 14500000, 14500000),
	('P004', 'Laptop MSI Gaming GF63 12VE-460VN',1 ,'lt4.png', 3, 6000000, 18000000),
	('P005', 'Laptop ASUS VivoBook 15 OLED A1505VA-L1114W',0 ,'lt5.png', 1, 10000000, 10000000),
	('P006', 'Laptop Lenovo IdeaPad Slim 3 14IAH8 83EQ0009VN',0 ,'lt6.png', 2, 9000000, 18000000);
	go
	INSERT INTO Orders 
VALUES 
    (1, '2024-06-05', '1112223333', 'alice@123.com', '123 Main St', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN', 0,2, 7000000, 14000000),
    (2, '2024-06-05', '1112223333', 'alice@123.com', '456 Elm St', 'Laptop ASUS TUF Gaming F15 FX507ZC4-HN074W', 1,1, 6000000, 6000000),
    (3, '2024-06-05', '4445556666', 'bob@123.com', '789 Oak St', 'Laptop Gaming Acer Nitro 5 Tiger AN515 58 52SP',1 ,1, 14500000, 14500000),
    (4, '2024-06-05', '4445556666', 'bob@123.com', '321 Pine St', 'Laptop MSI Gaming GF63 12VE-460VN',1 ,3, 6000000, 18000000),
    (5, '2024-06-05', '1112223333', 'Jordan@123.com', '654 Maple St', 'Laptop ASUS VivoBook 15 OLED A1505VA-L1114W',0 ,1, 10000000, 10000000),
    (6, '2024-06-05', '1112223333', 'White@123.com', '987 Walnut St', 'Laptop Lenovo IdeaPad Slim 3 14IAH8 83EQ0009VN',0 ,2, 9000000, 18000000);
	go
	INSERT INTO favorite_count 
VALUES 
    ('U001', 'P001'),
    ('U001', 'P002'),
    ('U002', 'P001'),
    ('U003', 'P003'),
    ('U004', 'P001');
	go
	INSERT INTO number_of_visit 
VALUES 
    ('2024-06-01', 100),
    ('2024-06-02', 120),
    ('2024-06-03', 90),
    ('2024-06-04', 150),
    ('2024-06-05', 200);
	go


	INSERT INTO Carts 
VALUES 
    ('P001', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN',0 ,'lt1.png', 2, 7000000, 14000000);
	INSERT INTO Orders 
VALUES 
    (7, '2024-06-05', '1112223333', 'alice@123.com', '123 Main St', 'Laptop Lenovo LOQ 15IAX9 83GS001RVN', 0,2, 7000000, 14000000);
go
	CREATE PROCEDURE CreateSummaryTable
AS
BEGIN
    -- Create the summary table
    CREATE TABLE summary_table (
        gaming_count INT,
        standard_count INT,
        total_revenue FLOAT
    );

    -- Declare variables to hold the counts and total revenue
    DECLARE @gaming_count INT;
    DECLARE @standard_count INT;
    DECLARE @total_revenue FLOAT;

    -- Calculate the gaming count
    SELECT @gaming_count = COUNT(*)
    FROM orders
    WHERE type = 1;

    -- Calculate the standard count
    SELECT @standard_count = COUNT(*)
    FROM orders
    WHERE type = 0;

    -- Calculate the total revenue
    SELECT @total_revenue = SUM(total_payment)
    FROM orders;

    -- Insert the calculated values into the summary table
    INSERT INTO summary_table (gaming_count, standard_count, total_revenue)
    VALUES (@gaming_count, @standard_count, @total_revenue);
END;
EXEC CreateSummaryTable;
go
CREATE PROCEDURE ShowSummaryTable
AS
BEGIN
    -- Check if the summary_table exists
    IF OBJECT_ID('summary_table', 'U') IS NULL
    BEGIN
        PRINT 'The summary_table does not exist.';
        RETURN;
    END

    -- Select the content of the summary_table
    SELECT * FROM summary_table;
END;


-----------------------------------------------------------------------
---hang code de xóa khóa ngo?i ?? có gì h? d? li?u m?i ch?y ?? s?a
----------------------------------------------------------------------------
-- Dropping foreign key constraints from Carts table
-- Xóa các ràng buộc khóa ngoại
ALTER TABLE carts
DROP CONSTRAINT fk_carts_users;

ALTER TABLE carts
DROP CONSTRAINT fk_carts_products;

ALTER TABLE orders
DROP CONSTRAINT fk_orders_carts;

ALTER TABLE favorite_count
DROP CONSTRAINT fk_favorite_count_users;

ALTER TABLE favorite_count
DROP CONSTRAINT fk_favorite_count_products;

-- Xóa các bảng
DROP TABLE favorite_count;
DROP TABLE orders;
DROP TABLE carts;
DROP TABLE products;
DROP TABLE users;
DROP TABLE number_of_visit;
----------------------------------------------------
-----------------------hàm khác------------------------
-------------------------------------------------------




