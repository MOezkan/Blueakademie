USE BlueAkademie
GO

CREATE TABLE education.tblHoliday
(
ID int IDENTITY(1,1)
,Name nvarchar(50)
,Date date
,DateCreated datetime2(0) default getdate()
,DateValid datetime2(0)
)
alter table education.tblHoliday
add constraint cnsDate unique (date)  





