CREATE TABLE Product_Sub (
    Product_Name CHAR(20),
    Description VARCHAR(300),
    Category CHAR(20),
    PRIMARY KEY(Product_Name)
);

CREATE TABLE Product (
    Product_ID INTEGER,
    Product_Name CHAR(20),
    PRIMARY KEY(Product_ID),
    FOREIGN KEY(Product_Name) REFERENCES Product_Sub(Product_Name) ON DELETE CASCADE
);

CREATE TABLE Stock_Count (
    Stock_ID INTEGER,
    Stock_Count INTEGER,
    Product_ID INTEGER,
    PRIMARY KEY(Stock_ID, Product_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
);

CREATE TABLE Stock_Color_Size (
    Stock_ID INTEGER,
    Pro_Color CHAR(20),
    Pro_Size INTEGER,
    PRIMARY KEY(Stock_ID)
);

SELECT DISTINCT c.Customer_ID, c.First_Name, c.Last_Name
FROM Customer c
JOIN Pro_Order po ON c.Customer_ID = po.Customer_ID
JOIN Order_Items oi ON po.Order_ID = oi.Order_ID
WHERE oi.Product_ID IN (
    SELECT Product_ID
    FROM Product
    WHERE Product_Name = 'html product name here'
);


CREATE TABLE Stock_Price (
    Stock_ID INTEGER,
    Product_ID INTEGER,
    Pro_Price REAL,
    PRIMARY KEY(Stock_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID) ON DELETE CASCADE
);

CREATE TABLE Staff (
    Staff_ID INTEGER,
    First_Name CHAR(20),
    Last_Name CHAR(20),
    Address VARCHAR(200),
    Phone_Number INTEGER,
    Role CHAR(20),
    PRIMARY KEY(Staff_ID)
);

CREATE TABLE Customer (
    Customer_ID INTEGER,
    First_Name CHAR(20),
    Last_Name CHAR(20),
    Address VARCHAR(200),
    Phone_Number INTEGER,
    Shipping_Address VARCHAR(200),
    PRIMARY KEY(Customer_ID)
);

CREATE TABLE Shopping_Cart (
    Cart_ID INTEGER,
    Product_ID INTEGER,
    Stock_ID INTEGER,
    Customer_ID INTEGER,
    PRIMARY KEY(Cart_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY(Stock_ID) REFERENCES Stock_Color_Size(Stock_ID),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID)
);

CREATE TABLE Pro_Order(
	Order_ID INTEGER,
	Order_Status CHAR(20),
	Order_Total_Price REAL,
	Customer_ID INTEGER,
	PRIMARY KEY(Order_ID),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
	
);


CREATE TABLE Order_Items (
	Order_ID INTEGER,
	Product_ID INTEGER,
	FOREIGN KEY (Order_ID) REFERENCES Pro_Order(Order_ID)
		ON DELETE CASCADE,
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
		ON DELETE SET NULL
);


CREATE TABLE Payment(
	Payment_ID INTEGER,
	Payment_Type CHAR(20),
	Payment_Amount REAL,
	Payment_Date VARCHAR(20),
	Order_ID INTEGER,
	PRIMARY KEY(Payment_ID),
	FOREIGN KEY (Order_ID) REFERENCES Pro_Order(Order_ID)
	ON DELETE CASCADE
);


CREATE TABLE Shipping_Company (
    Company_ID INTEGER,
    Comp_Name CHAR(20),
    Comp_Address VARCHAR(100),
    Phone_Number VARCHAR(15),
    PRIMARY KEY(Company_ID)
);

CREATE TABLE Shipping_Order(
	Tracking_Number VARCHAR(25),
	Estimated_Shipping_Time CHAR(10),
	Order_ID INTEGER, 
	Company_ID INTEGER, 
	PRIMARY KEY(Tracking_Number),
	FOREIGN KEY(Order_ID) REFERENCES Pro_Order(Order_ID) ON DELETE CASCADE,
	FOREIGN KEY(Company_ID) REFERENCES Shipping_Company(Company_ID)
	ON DELETE CASCADE
);

DELIMITER //
CREATE TRIGGER Update_Stock_Count
AFTER INSERT ON Order_Items
FOR EACH ROW
BEGIN
    UPDATE Stock_Count
    SET Stock_Count = Stock_Count - 1
    WHERE Product_ID = NEW.Product_ID;
END;
//
DELIMITER;
