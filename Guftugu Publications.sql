Update books
set [Book Name]=REPLACE([Book Name], '?', '')
where [Book Name] is not null

Select *
From books
Where LEN("Book Name")=0;

Delete from books
Where LEN("Book Name") = 0

Select Count("Order Date") as total
From books
Group by [Order Number]
Order by total desc

EXEC sp_rename 'books.[Book Name]' , 'Book_Name', 'COLUMN';
EXEC sp_rename 'books.[Order Status]' , 'Order_Status', 'COLUMN';
EXEC sp_rename 'books.[City (Billing)]' , 'City', 'COLUMN';


Select *
From books

Select Order_Date, SUM(OrderCounts)as Total_Orders
From (
	Select Order_Date, Count(*) as Number_Of_Books_Sold
	From books
	Group by Order_Date) As OrderCounts
Group by Order_Date
Order by Order_Date DESC

Select *, Count(Order_Status) as books_returned
From books
Where Order_Status= 'Returned'

Select *
From books

Create Table Cleaned (
	Order_Number INT,
	Order_Status [VARCHAR](15),
	Book_Name [VARCHAR](255),
	Order_Date DATETIME,
	City [VARCHAR](255)
)
Insert into Cleaned (Order_Number, Order_Status, Book_Name, Order_Date, City)
Select Order_Number, Order_Status, Book_Name, Order_Date, City
From books

