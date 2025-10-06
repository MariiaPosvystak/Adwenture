Select * from DimEmployee
Select * from DimSalesTerritory

--lisa view, mis n�ed EmployeeKey, firstname, 
--salary, gender, sales territory Region

create view vWEmployeesBySalesTerritory
as
Select EmployeeKey, FirstName, Salary, 
Gender,SalesTerritoryRegion
from DimEmployee de
join DimSalesTerritory dst
on de.SalesTerritoryKey= dst.SalesTerritoryKey 
--k�ivitama view
select * from vWEmployeesBySalesTerritory

--lisa view, mis n�ed EmployeeKey, firstname, 
--salary, gender, sales territory Region, 
--kus Sales Territory Region on NA 
create view vWNASalesTerritory_Employees
as
Select EmployeeKey, FirstName, Salary, 
Gender,SalesTerritoryRegion
from DimEmployee de
join DimSalesTerritory dst
on de.SalesTerritoryKey= dst.SalesTerritoryKey 
where dst.SalesTerritoryRegion = 'NA' 
--k�ivitama view
select * from vWNASalesTerritory_Employees

--lisa view, mis n�ed EmployeeKey, firstname, 
--gender, sales territory Region 
create view vWEmployeesNonConfidentialData
as
Select EmployeeKey, FirstName,
Gender,SalesTerritoryRegion
from DimEmployee de
join DimSalesTerritory dst
on de.SalesTerritoryKey= dst.SalesTerritoryKey 
--k�ivitama view
select * from vWEmployeesNonConfidentialData

--lisa view, mis n�ed sales territory Region, arv empoyees
create view vWEmployeesCountBySalesTerritory
as
Select SalesTerritoryRegion, count(EmployeeKey) as TotalEmployees
from DimEmployee de
join DimSalesTerritory dst
on de.SalesTerritoryKey= dst.SalesTerritoryKey 
group By SalesTerritoryRegion
--k�ivitama view
select * from vWEmployeesCountBySalesTerritory

--lisa view, mis n�ed EmployeeKey, firstname, 
--gender, SalesTerritoryKey 
create view vWEmployeesDataExceptSalary
as
Select EmployeeKey, FirstName, 
Gender,SalesTerritoryKey
from DimEmployee
--k�ivitama view
select * from vWEmployeesDataExceptSalary

--Uuenda, kustutama view
--Uuenda view
Update vWEmployeesDataExceptSalary
set FirstName='Mikey' where EmployeeKey=3;

--Kustutama(lisa(insert)) view
Delete from vWEmployeesDataExceptSalary
where EmployeeKey=4;
Insert into vWEmployeesDataExceptSalary
values('Miki','M',4)