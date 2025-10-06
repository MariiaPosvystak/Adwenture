--functsioonid
select * from DimEmployee;

--32
--tabeliväärtusega funktsiooni, mis mõlemal juhul annab sama tulemuse:
Create function fn_ILTVF_GetEmployees()
Returns Table
as 
return (select EmployeeKey, FirstName,
Cast(BirthDate as Date) as DOB
from dbo.DimEmployee);
--käivita funtsioonid
Select * from fn_ILTVF_GetEmployees()

--Mitme avaldisega tabeliväärtusega funktsioon (MSTVF)
Create function fn_MSTVF_GetEmployees()
Returns @Table Table(EmployeeKey int, FirstName nvarchar(20), DOB date)
as 
begin
insert into @Table
select EmployeeKey, FirstName,
Cast(BirthDate as Date)
from dbo.DimEmployee
return
end;
--käivita funtsioonid
Select * from fn_MSTVF_GetEmployees()
Update fn_ILTVF_GetEmployees() set FirstName='Sam' where EmployeeKey=1;


--33
--Funktsioon tagastab töötaja nime tema ID alusel.
Create Function fn_GetEmloyeeNameByld(@id int)
Returns nvarchar(20)
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey=@id)
end;

--Funktsiooni uuendsmine
Alter Function fn_GetEmloyeeNameByld(@id int)
Returns nvarchar(20)
with encryption
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey=@id)
end;
--Teine funktsiooni uuendsmine
Alter Function fn_GetEmloyeeNameByld(@id int)
Returns nvarchar(20)
with SchemaBinding
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey=@id)
end;

--34
--Lisa ajutised tabelid
CREATE TABLE #PersonDetails(Id INT, Name NVARCHAR(20));
insert into #PersonDetails values(1, 'Mike');
insert into #PersonDetails values(2, 'John');
insert into #PersonDetails values(3, 'Todd');

select * from #PersonDetails

--local temporary tabel on loodud?
select name from tempdb..sysobjects
where name like '#PersonDetails%'

--lisa procedure Ajutise tabeli loomisega
Create procedure spCreateLocalTempTable
as
begin
CREATE TABLE #PersonDetails(Id INT, Name NVARCHAR(20));
insert into #PersonDetails values(1, 'Mike');
insert into #PersonDetails values(2, 'John');
insert into #PersonDetails values(3, 'Todd');

select * from #PersonDetails
end;

--lisa globaalset ajutist tabelit
Create table ##EmployeeDetails(Id int, Name nvarchar(20));

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



