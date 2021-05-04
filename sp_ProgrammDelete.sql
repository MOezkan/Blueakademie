USE [BlueAkademie]
GO



ALTER proc [Education].[sp_ProgrammDelete]
(
@prmID int
)
AS

BEGIN

IF NOT EXISTS (select * 
				from Education.tblProgramm
				where ID=@prmID) 
	BEGIN
	raiserror ('WRONG! There is NOT this programm',1,16)
	return 0
	END


declare @versionProgramm int
declare @versionProgrammDetail int

set @versionProgramm=coalesce((	select MAX(Version) 
						from [History].[tblProgramm]
						where  [ProgrammID]=@prmID),0)

set @versionProgrammDetail=coalesce((	select MAX(Version) 
										from [History].[tblProgrammDetail]
										where  ProgrammID=@prmID),0)

insert into [History].[tblProgramm]
(ProgrammID,[Name],[Hours],[DateCreated],[DateValid],[Version])
select [ID],[Name],[Hours],[DateCreated],GETDATE(),@versionProgramm+1
from Education.tblProgramm
where ID=@prmID


insert into History.tblProgrammDetail
(ProgrammID,CourseID,DateCreated,DateValid,Version)
select ProgrammID,CourseID,DateCreated,GETDATE(),@versionProgrammDetail+1 
from [Education].[tblProgrammDetail]
where ProgrammID=@prmID


delete from Education.tblProgrammDetail
where ProgrammID=@prmID

delete from Education.tblProgramm
where ID=@prmID


SELECT P.Name ProgrammName
      ,P.Hours ProgrammHours
     ,C.Name CourseName
	 ,c.Hours CourseHours
  FROM [Education].[tblProgramm] P
  JOIN [Education].[tblProgrammDetail] D on P.ID=D.ProgrammID
  JOIN [Education].tblCourse C on C.ID=D.CourseID
  order by P.DateCreated desc
END
