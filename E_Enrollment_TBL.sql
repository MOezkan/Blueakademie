USE BlueAkademie
GO

drop table [Education].[tblEnrollment]
go

USE BlueAkademie
GO
CREATE TABLE [Education].[tblEnrollment](
	[ID] [int] IDENTITY(1,1) NOT NULL primary key,
	EnrollmentTypeID int foreign key references education.tblEnrollmentType(ID),
	[StudentID] [int] foreign key references [Education].[tblStudent] (ID),
	[ClassID] [int] foreign key references [Education].[tblClass](ID),
	[DateCreated] [datetime2](0) default getdate(),
	[DateValid] [datetime2](0) NULL,
	constraint UC_StudentClass UNIQUE ([StudentID],[ClassID])
) ON [PRIMARY]
GO




