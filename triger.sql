--TRIGGERID

--Create table
create trigger trMyFirstTrigger
on database
for create_table
as 
begin
print 'New table created'
end
--käivitama
Create table Test (id int)

--uuendama triggerid
alter trigger trMyFirstTrigger
on database
for create_table, alter_table, drop_table
as 
begin
print 'A table has just been created, modifiend or deleted'
end

--uuendama triggerid, et ei kustutama...
alter trigger trMyFirstTrigger
on database
for create_table, alter_table, drop_table
as 
begin
rollback
print 'You cannot create, alter or drop a table'
end

--lubada triggerit
disable trigger trMyFirstTrigger on database

--kustutada triggerit
drop trigger trMyFirstTrigger on database

-- lisa trigger rename
create trigger trRenameTable
on database
for rename
as 
begin
print 'You just renamed something'
end

