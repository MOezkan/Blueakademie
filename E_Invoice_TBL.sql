--Create table for Invoice. 
--StudentName, Address, InvoiceNumber, InvoiceDate ,CourseName, MwSt.
use BlueAkademie
go
drop table education.tblInvoice
go

use BlueAkademie
go

create table education.tblInvoice
(
ID int IDENTITY(1,1)
,PaymentID int FOREIGN KEY REFERENCES [Education].[tblPayment] (ID)
,InvoiceNumber decimal(14,0) default education.fn_InvoiceNumber_Produce()
,InvoiceDate date
,GrossAmount decimal(5,2)
,Vat int
,VatAmount decimal(5,2)
,NetAmount decimal(5,2)
,DateCreated datetime2(0) default getdate()

)





