use AdventureWorks
go

-- Stored procedure that returns direct managers of employees who work at specified department.

create procedure uspGetEmployeeManagersPerDepartment 
@BusinessEntityID int,
@Department nvarchar(40)
as
	select 
		emp1.BusinessEntityID as BusinessEntityID, 
		p1.FirstName as FirstName, 
		p1.LastName as LastName, 
		emp1.JobTitle as JobTitle, 
		emp2.Gender as ManagerGender, 
		p2.FirstName as ManagerFirstName, 
		p2.LastName as ManagerLastName 
	from HumanResources.Employee emp1
	join Person.Person p1
		on emp1.BusinessEntityID = p1.BusinessEntityID
	join HumanResources.EmployeeDepartmentHistory dh1
		on emp1.BusinessEntityID = dh1.BusinessEntityID
	join HumanResources.Department d1
		on dh1.DepartmentID = d1.DepartmentID
	left join HumanResources.EmployeeDepartmentHistory dh2
		on dh1.DepartmentID = dh2.DepartmentID
	join HumanResources.Employee emp2
		on dh2.BusinessEntityID = emp2.BusinessEntityID
	join Person.Person p2
		on emp2.BusinessEntityID = p2.BusinessEntityID
	where   emp2.JobTitle like '%Manager%' 
			and d1.[Name] = @Department 
			and emp1.BusinessEntityID = @BusinessEntityID