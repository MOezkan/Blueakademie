USE BlueAkademie
GO

drop table History.[tblEnrollment]
go

USE BlueAkademie
GO
CREATE TABLE History.[tblEnrollment](
	[EnrollmentID] [int] not null,
	EnrollmentTypeID int ,
	[StudentID] [int] ,
	[ClassID] [int] ,
	[DateCreated] [datetime2](0) not null ,
	[DateValid] [datetime2](0) default getdate(),
	Version int not null,
	Primary key  ([StudentID],[ClassID],Version)
) ON [PRIMARY]
GO




