-- 1. Returns all rows from Product table.
select [Name], ProductNumber, ListPrice as Price from Production.Product order by Price desc

-- 2. Returns all employees who were hired after 2009-01-01.
select * from HumanResources.Employee where YEAR(HireDate) > 2008 order by HireDate

-- 3. Returns only the rows for Product from Product table 
-- that have a product line of ‘S’ and that have days to manufacture that is less than 5. 
-- Sorted by ascending order. 
select * from Production.Product where (ProductLine = 'S' and DaysToManufacture < 5)

-- 4. Retrieves employees job titles from HumanResources.Employee table without duplicates.
select distinct JobTitle from HumanResources.Employee

-- 5. Returns the total order quantity of each sales order from Sales.SalesOrderDetail table and 
-- groups them by Products which price lists are greather than 900$.
select ProductModelID, SUM(OrderQty) as TotalQuantity from Sales.SalesOrderDetail 
join Production.Product on SalesOrderDetail.ProductID = Product.ProductID
where Product.ListPrice > 900
group by ProductModelID

-- 6. Groups the rows in the Sales.SalesOrderDetail table by product ID 
-- and eliminates products whose average order quantities are more than 4. 
select ProductID, AVG(OrderQty) as AverageQuantity from Sales.SalesOrderDetail group by ProductID having AVG(OrderQty) <= 4