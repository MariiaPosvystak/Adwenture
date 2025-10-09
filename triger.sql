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

--Server-Scoped DDL triggerid
Create trigger tr_DatabaseScopeTrigger
on database
for create_table, alter_table, drop_table
as
begin
rollback
print 'You cannot create, alter or drop atable in the current database'
end

-- for all server
Create trigger tr_ServerScopeTrigger
on all server
for create_table, alter_table, drop_table
as
begin
rollback
print 'You cannot create, alter or drop atable in any database on the server'
end

--Kuidas saab Serveri ulatuses olevat DDL trigerit kinni panna:
disable trigger tr_ServerScopeTrigger on all server
--Kuidas lubada Serveri ulatuses olevat DDL trigerit:
enable trigger tr_ServerScopeTrigger on all server
--Kuidas kustutada serveri ulatuses olevat DDL trigerit
drop trigger tr_ServerScopeTrigger on all server
