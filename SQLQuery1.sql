--functsioonid
select * from DimEmployee;

--tabeliv‰‰rtusega funktsiooni, mis mılemal juhul annab sama tulemuse:
Create function fn_ILTVF_GetEmployees()
Returns Table
as 
return (select EmployeeKey, FirstName,
Cast(BirthDate as Date) as DOB
from dbo.DimEmployee);
--k‰ivita funtsioonid
Select * from fn_ILTVF_GetEmployees()
