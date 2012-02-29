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
	Gender varchar(10),
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
	OrderID int PRIMARY KEY IDENTITY(1, 1),
	CustomerID int FOREIGN KEY REFERENCES Customer(CustomerID),
	PaymentMethodID int FOREIGN KEY REFERENCES PaymentMethods(PaymentMethodID),
	OrderTime datetime,
	ShippingAddress varchar(50),
	PaymentDetail varchar(50),
	TotalPrice numeric,
	OrderStatus varchar(10)
)
GO
CREATE TABLE OrderDetails (
	OrderDetailsID int PRIMARY KEY IDENTITY(1,1),
	OrderID int FOREIGN KEY REFERENCES Orders(OrderID),
	ImgUrl text,
	RES varchar(15) FOREIGN KEY REFERENCES Price(RES),
	Quantity int,
	TPrice numeric
)


INSERT INTO Administrator VALUES ('admin', 'admin')
GO
INSERT INTO Customer VALUES ('longnh', '123456', 'Nguyen Hoang Long', '04/07/1988', 'Male', 'longnh@aptech.com.vn', 0979371098, 'Hoan Kiem - Ha Noi')
GO
INSERT INTO Customer VALUES ('hunglv', '123456', 'Le Viet Hung', '10/20/1989', 'Male', 'hunglv@aptech.com.vn', 123456789, 'Hoan Kiem - Ha Noi')
GO
INSERT INTO Customer VALUES ('tungpt', '123456', 'Pham Thanh Tung', '11/20/1989', 'Male', 'tungpt@aptech.com.vn', 0987654321, 'Hoan Kiem - Ha Noi')
GO
INSERT INTO Customer VALUES ('tienvv', '123456', 'Vu Van Tien', '08/03/1991', 'Female', 'tienvv@aptech.com.vn', 019284756, 'Hoan Kiem - Ha Noi')


INSERT INTO Price VALUES ('800x600', 100)
GO
INSERT INTO Price VALUES ('1024x768', 200)
GO
INSERT INTO Price VALUES ('1400x900', 300)
GO
INSERT INTO Price VALUES ('1920x1080', 1000)


INSERT INTO PaymentMethods VALUES ('Online')
GO
INSERT INTO PaymentMethods VALUES ('Direct')

