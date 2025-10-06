--§35 Ineksid serveris
--Salary veeru lisamine DimEmployee tabelisse
ALTER TABLE dbo.DimEmployee
ADD Salary MONEY;
Update dbo.DimEmployee set Salary=2500 where EmployeeKey=1;
Update dbo.DimEmployee set Salary=6500 where EmployeeKey=2;
Update dbo.DimEmployee set Salary=4500 where EmployeeKey=3;
Update dbo.DimEmployee set Salary=5500 where EmployeeKey=4;
Update dbo.DimEmployee set Salary=3100 where EmployeeKey=5;

Select * from dbo.DimEmployee where Salary > 5000 and Salary < 7000;

--Lisamine indeksi
Create index IX_DimEmployee_Salary
on dbo.DimEmployee (Salary ASC);

--§36 Klastreeritud ja mitte-klastreeritud indeksid

Create Clustered index IX_DimEmployee_FirstName
on dbo.DimEmployee (FirstName);

--§37 - Unikaalne ja mitte-unikaalne indeks
Execute sp_helpindex DimEmployee

Drop index DimEmployee.PK_DimEmployee_EmployeeKey

Create Unique NonClustered Index UIX_DimEmployee_FirstName
On DimEmployee(FirstName)

ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_DimEmployee_DepartmentName
UNIQUE NONCLUSTERED (DepartmentName)

