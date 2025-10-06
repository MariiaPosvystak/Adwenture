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
