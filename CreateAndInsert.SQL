DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Shopping_Cart;
DROP TABLE IF EXISTS Pro_Order;
DROP TABLE IF EXISTS Shipping_Order;
DROP TABLE IF EXISTS Stock_Price;
DROP TABLE IF EXISTS Stock_Count;
DROP TABLE IF EXISTS Stock_Color_Size;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Shipping_Company;
DROP TABLE IF EXISTS Product_Sub;

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

INSERT INTO Product_Sub (Product_Name, Description, Category) VALUES ('Shoe 1', 'Running Shoes One', 'Running');
INSERT INTO Product_Sub (Product_Name, Description, Category) VALUES ('Shoe 2', 'Casual Shoes One', 'Casual');
INSERT INTO Product_Sub (Product_Name, Description, Category) VALUES ('Shoe 3', 'Training Shoes One', 'Training’');
INSERT INTO Product_Sub (Product_Name, Description, Category) VALUES ('Shoe 4', 'Running Shoes Two', 'Running');
INSERT INTO Product_Sub (Product_Name, Description, Category) VALUES ('Shoe 5', 'Running Shoes Three', 'Running');

INSERT INTO Product (Product_ID, Product_Name) VALUES (1, 'Shoe 1');
INSERT INTO Product (Product_ID, Product_Name) VALUES (2, 'Shoe 2');
INSERT INTO Product (Product_ID, Product_Name) VALUES (3, 'Shoe 3');
INSERT INTO Product (Product_ID, Product_Name) VALUES (4, 'Shoe 4');
INSERT INTO Product (Product_ID, Product_Name) VALUES (5, 'Shoe 5');

INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address, Phone_Number, Shipping_Address) VALUES (1001, 'John', 'Doe', '123 Main St', 11112222, '123 Main St');
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address, Phone_Number, Shipping_Address) VALUES (1002, 'Alice', 'Johnson', '456 Elm St', 22223333, '456 Elm St');
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address, Phone_Number, Shipping_Address) VALUES (1003, 'Bob', 'Smith', '789 Oak St', 33334444, '789 Oak St');
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address, Phone_Number, Shipping_Address) VALUES (1004, 'Eva', 'Williams', '101 Pine St', 44445555, '101 Pine St');
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address, Phone_Number, Shipping_Address) VALUES (1005, 'David', 'Lee', '222 Cedar St', 55556666, '222 Shipping Ln');

INSERT INTO Stock_Count (Stock_ID , Stock_Count, Product_ID) VALUES (1, 10, 1);
INSERT INTO Stock_Count (Stock_ID , Stock_Count, Product_ID) VALUES (2, 7, 2);
INSERT INTO Stock_Count (Stock_ID , Stock_Count, Product_ID) VALUES (3, 6, 3);
INSERT INTO Stock_Count (Stock_ID , Stock_Count, Product_ID) VALUES (4, 11, 4);
INSERT INTO Stock_Count (Stock_ID , Stock_Count, Product_ID) VALUES (5, 3, 5);

INSERT INTO Stock_Color_Size (Stock_ID, Pro_Color, Pro_Size) VALUES (1, 'White', 42);
INSERT INTO Stock_Color_Size (Stock_ID, Pro_Color, Pro_Size) VALUES (2, 'Black', 40);
INSERT INTO Stock_Color_Size (Stock_ID, Pro_Color, Pro_Size) VALUES (3, 'Blue', 37);
INSERT INTO Stock_Color_Size (Stock_ID, Pro_Color, Pro_Size) VALUES (4, 'Purple', 38);
INSERT INTO Stock_Color_Size (Stock_ID, Pro_Color, Pro_Size) VALUES (5, 'Grey', 40);

INSERT INTO Stock_Price (Stock_ID, Product_ID, Pro_Price) VALUES (1, 5, 159.99);
INSERT INTO Stock_Price (Stock_ID, Product_ID, Pro_Price) VALUES (2, 3, 139.99);
INSERT INTO Stock_Price (Stock_ID, Product_ID, Pro_Price) VALUES (3, 1, 139.99);
INSERT INTO Stock_Price (Stock_ID, Product_ID, Pro_Price) VALUES (4, 4, 149.99);
INSERT INTO Stock_Price (Stock_ID, Product_ID, Pro_Price) VALUES (5, 2, 159.99);

INSERT INTO Pro_Order (Order_ID, Order_Status, Order_Total_Price, Customer_ID) VALUES (1, 'shipped', 159.99, 1001);
INSERT INTO Pro_Order (Order_ID, Order_Status, Order_Total_Price, Customer_ID) VALUES (2, 'shipped', 299.98, 1002);
INSERT INTO Pro_Order (Order_ID, Order_Status, Order_Total_Price, Customer_ID) VALUES (3, 'returned', 439.97, 1003);
INSERT INTO Pro_Order (Order_ID, Order_Status, Order_Total_Price, Customer_ID) VALUES (4, 'delivered', 749.95, 1004);
INSERT INTO Pro_Order (Order_ID, Order_Status, Order_Total_Price, Customer_ID) VALUES (5, 'closed', 149.99, 1005);

INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (1, 1);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (2, 2);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (2, 1);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (3, 3);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (3, 4);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (3, 5);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (4, 1);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (4, 2);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (4, 3);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (4, 4);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (4, 5);
INSERT INTO Order_Items(Order_ID, Product_ID) VALUES (5, 5);

INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Address, Phone_Number, Role) VALUES (10001, 'Bobbie', 'Vazquez', '1234 Laker Road', 11111111, 'Manager');
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Address, Phone_Number, Role) VALUES (10002, 'Deidre', 'Parks', '5558 Mountain Road', 22222222, 'CEO');
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Address, Phone_Number, Role) VALUES (10003, 'Mandy', 'Camacho', '5768 Cambie', 33333333, 'Sales Associate');
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Address, Phone_Number, Role) VALUES (10004, 'Nathaniel', 'Daniels', '2327 River Road', 44444444, 'Sales Associate');
INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Address, Phone_Number, Role) VALUES (10005, 'Gilberto', 'Fuller', '2345 Ontarian Rd', 55555555, 'Sales Associate');

INSERT INTO Payment (Payment_ID, Payment_Type, Payment_Amount, Payment_Date, Order_ID) VALUES (1, 'Credit Card', 100, '10-25-2023', 1);
INSERT INTO Payment (Payment_ID, Payment_Type, Payment_Amount, Payment_Date, Order_ID) VALUES (2, 'Paypal', 80, '10-26-2023', 2);
INSERT INTO Payment (Payment_ID, Payment_Type, Payment_Amount, Payment_Date, Order_ID) VALUES (3, 'Credit Card', 120, '10-27-2023', 3);
INSERT INTO Payment (Payment_ID, Payment_Type, Payment_Amount, Payment_Date, Order_ID) VALUES (4, 'Debit Card', 100, '10-27-2023', 4);
INSERT INTO Payment (Payment_ID, Payment_Type, Payment_Amount, Payment_Date, Order_ID) VALUES (5, 'Credit Card', 90, '10-28-2023', 5);

INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1001, 3, 2, 1001);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1002, 2, 5, 1002);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1003, 3, 2, 1003);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1004, 1, 3, 1004);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1005, 4, 4, 1005);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1006, 2, 5, 1004);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1007, 3, 2, 1004);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1008, 4, 4, 1004);
INSERT INTO Shopping_Cart (Cart_ID, Product_ID, Stock_ID, Customer_ID) VALUES (1009, 5, 1, 1004);

INSERT INTO SHIPPING_COMPANY(Company_ID, Comp_Name, Comp_Address, Phone_Number ) VALUES (001, 'Swift Shipping', '3312 Lake City Way Burnaby, BC, V5A 2Z6', '604-619-6973');
INSERT INTO SHIPPING_COMPANY(Company_ID, Comp_Name, Comp_Address, Phone_Number) VALUES (002, 'Precision Logistics', '146 Nootka Street Vancouver, British Columbia(BC), V5M 3M5', '778-836-3719');
INSERT INTO SHIPPING_COMPANY(Company_ID, Comp_Name, Comp_Address, Phone_Number) VALUES (003, 'TransGlobal Express', '4569 Northumberland Street New Dundee, Ontario(ON), N0B 2E0', '519-696-9574');
INSERT INTO SHIPPING_COMPANY(Company_ID, Comp_Name, Comp_Address, Phone_Number) VALUES (004, 'Fast Track', ' 735 River Street Brights Grove, Ontario(ON), N0N 1C0', '519-869-4954');
INSERT INTO SHIPPING_COMPANY(Company_ID, Comp_Name, Comp_Address, Phone_Number) VALUES (005, 'Efficient Cargo’', ' 1048 Baker Street London, Ontario(ON), N0N 0N0','519-435-1768');

INSERT INTO SHIPPING_ORDER (Tracking_Number, Estimated_Shipping_Time, Order_ID, Company_ID) VALUES('RH208258887CN', '10 days', 1, 2);
INSERT INTO SHIPPING_ORDER (Tracking_Number, Estimated_Shipping_Time, Order_ID, Company_ID) VALUES('RH784480682CN', '14 days', 3, 3);
INSERT INTO SHIPPING_ORDER (Tracking_Number, Estimated_Shipping_Time, Order_ID, Company_ID) VALUES('RH054047575CN', '9 days', 2, 1);
INSERT INTO SHIPPING_ORDER (Tracking_Number, Estimated_Shipping_Time, Order_ID, Company_ID) VALUES('RH099302260CN', '12 days', 4, 1);
INSERT INTO SHIPPING_ORDER (Tracking_Number, Estimated_Shipping_Time, Order_ID, Company_ID) VALUES('RH250307386CN', '10 days', 5, 4);
