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
