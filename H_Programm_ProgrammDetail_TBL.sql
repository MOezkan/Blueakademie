USE [BlueAkademie]
GO
drop table History.[tblProgramm]
go
CREATE TABLE History.[tblProgramm](
	[ProgrammID] [int]  NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Hours] [int] NOT NULL,
	[DateCreated] [datetime2](0) NOT NULL,
	[DateValid] [datetime2](0) default getdate(),
	Version int,
	primary key ([ProgrammID],Version)
)


USE [BlueAkademie]
GO

drop table History.[tblProgrammDetail]
go
CREATE TABLE History.[tblProgrammDetail](
	[ProgrammID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCreated] [datetime2](0) NOT NULL,
	[DateValid] [datetime2](0) default getdate(),
	Version int,
	Primary key ([ProgrammID],[CourseID],Version),
	
)
