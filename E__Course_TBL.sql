USE BlueAkademie
GO

CREATE TABLE education.tblCourse
(
ID int IDENTITY(1,1)
,Name nvarchar(100)
,Hours int
)

--add column (DateCreated and DateValid) with constraint default GETDATE()

USE BlueAkademie
Go
ALTER TABLE education.tblCourse
ADD DateCreated datetime2(0) default getdate()
,DateValid datetime2(0) 


alter TABLE education.tblCourse
ADD CONSTRAINT pk_ID PRIMARY KEY (ID)