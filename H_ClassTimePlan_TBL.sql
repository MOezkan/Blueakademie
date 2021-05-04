USE BlueAkademie
GO
drop table [History].[tblClassTimePlan]
go
CREATE TABLE [History].[tblClassTimePlan]
	(
   	[ClassID] [int] not NULL,
	[LessonDay] [nvarchar](10) NOT NULL,
	[LessonTime] [time](7)  NOT NULL,
	[DailyHour] [int] NOT NULL,
	[DateCreated] [datetime2](0) NULL,
	[DateValid] [datetime2](0) default getdate(),
	Version int,
	PRIMARY KEY ([ClassID],[LessonDay], Version)
	) 
	
	
	
	
	


