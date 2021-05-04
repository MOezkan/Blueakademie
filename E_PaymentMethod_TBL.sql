use BlueAkademie
go

drop table education.tblPaymentMethod
go

create table education.tblPaymentMethod
(
ID int IDENTITY(1,1) primary key,
Name nvarchar(50) not null unique,
DateCreated datetime2(0) default getdate()
)
go

insert into education.tblPaymentMethod
(Name)
Values ('Bank')
,('Paypal')
,('TransferWise')
,('Payment in person')

