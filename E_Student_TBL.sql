USE BlueAkademie
GO

--create student table

USE [BlueAkademie]
GO

/****** Object:  Table [Education].[tblStudent]    Script Date: 20.04.2021 11:46:35 ******/
use BlueAkademie
go

drop table [Education].[tblStudent]
go

use BlueAkademie
go

CREATE TABLE [Education].[tblStudent](
	[ID] [int] IDENTITY(1,1) primary key,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[Phone] [nvarchar](50)  NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[DateCreated] [datetime2](0) default getdate(),
	[DateValid] [datetime2](0) NULL,
)

 --sunlar unique olmali


