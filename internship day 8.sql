
use E_commerce
select * from Customers
select * from Orders

-- procedure to find average sales by city

create procedure Avg_sales @city varchar(210)
as
Begin
select c.city,Avg(amount) avg_sales from Customers c join Orders o 
on c.CustomerID=o.CustomerID
where c.City = @city
group by c.City
End

exec Avg_sales @city = 'Mumbai'


-- Procedure to Add new customer

create procedure add_customer 
@CustomerID int,@Name varchar(210), @city varchar(210)
as
begin
	insert into Customers(CustomerID,Name,City)
	values(@CustomerID,@Name,@city)
end

exec add_customer @customerID = 25, @Name="Nandu", @city="Hyderabad"

--Procedure to delete data based on orderID

create procedure del_order @OrderID int 
as 
	begin 
		begin try
			delete from Orders where OrderID=@OrderID
		end try
		BEGIN CATCH
			PRINT 'Error occurred: ' + ERROR_MESSAGE();
		END CATCH

	end

exec del_order @OrderID = 101

drop procedure del_order


--Function to find month sales

CREATE FUNCTION month_sales()
RETURNS TABLE
AS
RETURN (
    SELECT *
    FROM Orders
    WHERE MONTH(OrderDate)=6
);

select * from month_sales()

-- Function to find order type

CREATE FUNCTION Sale_Type(@amt INT)
RETURNS VARCHAR(20)
AS
BEGIN
    RETURN 
        CASE 
            WHEN @amt > 2000 THEN 'Big_order'
            WHEN @amt > 1000 THEN 'Avg_order'
            ELSE 'Small_order'
        END
END;

select OrderID, dbo.Sale_Type(Amount) as order_type
from Orders