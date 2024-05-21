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

-- Creating a Stored Procedure

alter procedure BusTicket
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


--For inserting values in Stored Procedure

exec BusTicket'SMS',9876543211,'Palani','Coimbatore',120,2