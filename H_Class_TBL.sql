USE BlueAkademie
GO

drop table [History].[tblClass]
	go
CREATE TABLE [History].[tblClass]
	(
    [ClassID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	ProgrammID int not null,
	[StartDate] [date] NOT NULL,
	[FinishDate] [date]  NULL,
	[DateCreated] [datetime2](0) NOT NULL,
	[DateValid] [datetime2](0) default getdate(),
	Version int,
	PRIMARY KEY ([ClassID], Version)
	) 