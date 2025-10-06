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