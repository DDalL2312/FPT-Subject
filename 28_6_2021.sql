--Insert into Categories(CategoryName, [Description])
--VALUES ('Demo 3', 'Des 3'),('Demo 4', 'Des 4')

--Select CategoryName, Description
--From Categories

--Delete from Categories
--where CategoryID = '11'

--Delete from Categories
--where CategoryID between 12 and 15

--Update Categories
--Set CategoryName = 'Demo3'
--Where CategoryID = 10

--Select p.ProductID, P.ProductName 
--from Products p
--where p.ProductID not in
--(
--	Select distinct od.ProductID
--	from [Order Details] od
--)
Begin Try
	Begin transaction 
		--Thực hiện chèn dữ liệu vào Orders
		Insert into Orders(CustomerID, EmployeeID, OrderDate, RequiredDate)
		values ('AlFKI', 2, GETDATE(), GETDATE() + DAY(3))

		--Thực hiện chèn vào Order Details
		--Lấy dữ liệu của OrderID trong Orders - Có thể dùng LastInserted

		Declare @LastOrderID int
		Set @LastOrderID = (select max(OrderID) from Orders)

		Insert into [Order Details] (OrderID, ProductID, UnitPrice, Quantity)
		values (@LastOrderID, 1, 18, 5)

		Update Products
		Set UnitsInStock = UnitsInStock - 5, UnitsOnOrder = UnitsOnOrder + 5
		Where ProductID = 1

	commit transaction
	print 'Transaction success'
End Try
Begin Catch
	rollback transaction
	print 'Transaction fail'
End Catch






