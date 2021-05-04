use BlueAkademie
go

drop table education.tblProgramm
go

use BlueAkademie
go

create table education.tblProgramm
(
ID int identity (1,1) primary key,
Name nvarchar (50) not null unique,
Hours int not null,
DateCreated datetime2(0) default getdate(),
DateValid datetime2(0)  

)