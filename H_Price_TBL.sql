USE [BlueAkademie]
GO
--Drop TABLE [History].[tblPrice]
CREATE TABLE [History].[tblPrice](

	[ClassID] [int] not null,
	[Price] [decimal](5, 2) NULL,
	[DateCreated] [datetime2](0) NULL,
	[DateValid] [datetime2](0) DEFAULT (getdate()) NULL,
	[Version] [int] NOT NULL,
PRIMARY KEY ([ClassID],[Version]) )