Use master
GO
DROP DATABASE Online_Order_For_Digital_Photo_Printing
GO
CREATE DATABASE Online_Order_For_Digital_Photo_Printing
GO
Use Online_Order_For_Digital_Photo_Printing
GO
CREATE TABLE Administrator (
	UserName varchar(20) PRIMARY KEY,
	[Password] varchar(30)
)
GO
CREATE TABLE Customer (
	CustomerID int PRIMARY KEY IDENTITY(1,1),
	UserName varchar(15) UNIQUE,
	[Password] varchar(30),
	CustomerName ntext,
	DoB datetime,
	Gender int,
	Email varchar(50),
	PhoneNumber numeric,
	[Address] ntext
)
GO
CREATE TABLE Price (
	RES varchar(15) PRIMARY KEY,
	[Money] numeric
)
GO
CREATE TABLE PaymentMethods (
	PaymentMethodID int PRIMARY KEY IDENTITY(1,1),
	PaymentMethod varchar(20)
)
GO
CREATE TABLE Orders (
	OrderID int PRIMARY KEY,
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
	PaymentMethodID int FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID),
	OrderTime datetime,
	ShippingAddress varchar(50),
	PaymentDetail varchar(50),
	OrderStatus int
)
GO
CREATE TABLE OrderDetails (
	OrderDetailsID int PRIMARY KEY IDENTITY(1,1),
	OrderID int FOREIGN KEY REFERENCES Orders(OrderID),
	RES varchar(15) FOREIGN KEY REFERENCES Price(RES),
	Quantity int
)

