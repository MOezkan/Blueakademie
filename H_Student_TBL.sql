USE BlueAkademie
GO

--create student table
--drop table History.[tblStudent]

use BlueAkademie
go

CREATE TABLE History.[tblStudent](
	[StudentID] [int] ,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[Phone] [nvarchar](50)  NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[DateCreated] [datetime2](0) ,
	[DateValid] [datetime2](0) default getdate(),
	Version int ,
	primary key([StudentID],Version)

)

 --sunlar unique olmali


