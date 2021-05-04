--create table for Payments from Students

USE BlueAkademie
GO

drop table [Education].[tblPayment]
go


USE BlueAkademie
GO
CREATE TABLE [Education].[tblPayment](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	[AccountHolder] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[AmountIncome] [decimal] (5, 2) NULL,
	[AmountExpenditures] [decimal](5, 2) NULL,
	[PaymentMethodID] [int] foreign key references [Education].[tblPaymentMethod](ID),
	[EnrollmentID] [int] foreign key references [Education].[tblEnrollment](ID),
	[Explanation] [nvarchar](200) NULL,
	[Comment] [nvarchar](200) NULL,
	[DateCreated] [datetime2](0) default getdate(),
)

 /*
 USE BlueAkademie
GO

drop table [Education].[tblPayment]
go


USE BlueAkademie
GO
CREATE TABLE [Education].[tblPayment]
(
	[ID] int IDENTITY(1,1) NOT NULL primary key,
	[AccountHolder] nvarchar(50) NOT NULL,
	[Date] date NOT NULL,
	[AmountIncome] decimal(5, 2) NULL,
	[AmountExpenditures] decimal(5, 2) NULL,
	
	[PaymentMethod] int foreign key references 
	[Education].[tblPaymentMethod](ID) NOT NULL,
	
	[StudentID] int foreign key references 
	[Education].[tblStudent](ID) NOT NULL,
--SORU: FOREIN KEY StudentID iLE Mi OLMALI EnrollmentID iLE Mi OLMALI

	[Explanation] nvarchar(200) NULL,
	[Comment] nvarchar(200) NULL,
	[DateCreated] datetime2(0) default getdate(),
	[DateValid] datetime2(0) NULL,
 )*/