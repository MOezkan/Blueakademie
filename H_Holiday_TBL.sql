USE BlueAkademie
GO

CREATE TABLE history.tblHoliday
(
ID int IDENTITY(1,1)
,Name nvarchar(50)
,Date date
,DateCreated datetime2(0) 
,DateValid datetime2(0)default getdate()
,Version int
primary key(ID,Version)
)
 
