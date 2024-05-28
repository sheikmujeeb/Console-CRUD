-- Creating  a Table
create table Busdetails
(
BusID bigint not null primary key identity(100,5) ,
BusName nvarchar(50) not null,
DriverMobilenumber bigint not null,
StartPoint nvarchar(50) not null,
Destination nvarchar(50) not null,
Fair bigint not null,
NoofPassenger bigint not null,
)

insert into Busdetails
(BusName,DriverMobilenumber,StartPoint,Destination,Fair,NoofPassenger)

values('SVT',9876543210,'Palani','Madurai',100,2)

insert into Busdetails
(BusName,DriverMobilenumber,StartPoint,Destination,Fair,NoofPassenger)
values('SMT',9876534210,'Palani','Coimbatore',120,3)

select * from Busdetails

-- Creating a Stored Procedure----------------------------------------------------------------------------
create or alter procedure BusTicket
(
@BusName  nvarchar(50) ,
@DriverMobilenumber bigint,
@StartPoint nvarchar(50) ,
@Destination nvarchar(50) ,
@Fair bigint ,
@NoofPassenger bigint 
)
as begin
insert into [dbo].[Busdetails]([BusName],[DriverMobilenumber],[StartPoint],[Destination],[Fair],[NoofPassenger])
values(
@BusName,
@DriverMobilenumber,
@StartPoint,
@Destination,
@Fair,
@NoofPassenger
)
end

-- Altering a Stored Procedure-----------------------------------------------------------------------------

create or alter procedure BusTicket
(
@BusName  nvarchar(50) ,
@DriverMobilenumber bigint,
@StartPoint nvarchar(50) ,
@Destination nvarchar(50) ,
@Fair bigint ,
@NoofPassenger bigint 
)

as begin
insert into [dbo].[Busdetails]([BusName],[DriverMobilenumber],[StartPoint],[Destination],[Fair],[NoofPassenger])
values(
@BusName,
@DriverMobilenumber,
@StartPoint,
@Destination,
@Fair,
@NoofPassenger
)
end



--For inserting values in Stored Procedure----------------------------------------------------------------

exec BusTicket'SSS',9123456789,'Tirupur','Coimbatore',90,5

-- viewing -------------------------------------------------------------------------------------------

select * from [Busdetails]


-- Update for Procedure   --------------------------------------------------------------------------------------------

create or alter procedure SPupdate
(@BusID bigint,
@StartPoint nvarchar(50),
@Destination nvarchar(50),
@Fair bigint,
@NoofPassenger bigint
)
as begin
update Busdetails set StartPoint=@StartPoint,Destination=@Destination,Fair=@Fair,NoofPassenger=@NoofPassenger
where BusID=@BusID
end 

exec SPupdate 130,'Trichy','Palani',150,2

select * from Busdetails


-----Delete for Stored Procedure--------------------------------------------------------------------------------------------- 

Create or Alter procedure SPremove
(
@BusName nvarchar(50))
as begin 
delete Busdetails
where Busname=@BusName
end

exec SPremove SMS

select * from Busdetails

-------Selectall for Stored Procedure-----------------------------------------------------------------

create or alter procedure SPselectall
as begin 
select * from Busdetails
end

-------Search for Stored Procedure-------------------------------------------------------

create or alter procedure SPsearch
(
@BusName nvarchar(50)
)
as begin
select * from Busdetails
where BusName like '%'+@BusName+'%'
end

exec SPsearch T

-----------------------------------------------------------------------------------------------------------
