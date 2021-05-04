USE [BlueAkademie]
GO

drop table [Education].[tblProgrammDetail]
go
CREATE TABLE [Education].[tblProgrammDetail](
	ID int  identity (1,1) NOT NULL primary key,
	ProgrammID int foreign key references [Education].[tblProgramm](ID),
	CourseID int foreign key references [Education].[tblCourse] (ID),
	DateCreated [datetime2](0) NOT NULL default getdate(),
	DateValid [datetime2](0) NULL,
	constraint UC_ProgrammCourse unique (ProgrammID,CourseID) 
	
)

