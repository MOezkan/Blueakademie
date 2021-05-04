USE [BlueAkademie]
GO
Alter proc education.sp_ProgrammCreate
(
@prmName nvarchar(50),
@prmHours int,
@prmCourseIDs nvarchar(max)
)
AS
BEGIN


INSERT INTO [Education].[tblProgramm]
           ([Name]
		   ,Hours)
     VALUES
           (@prmName
		   ,@prmHours)

declare @ProgrammID int
set @ProgrammID=(select ID from [Education].[tblProgramm] where name=@prmName)


INSERT INTO [Education].[tblProgrammDetail]
(ProgrammID,CourseID)
select @ProgrammID,ID 
from Education.tblCourse 
where ID in (SELECT value FROM STRING_SPLIT(@prmCourseIDs, ','))




SELECT P.Name ProgrammName
      ,P.Hours ProgrammHours
     ,C.Name CourseName
	 ,c.Hours CourseHours
  FROM [Education].[tblProgramm] P
  JOIN [Education].[tblProgrammDetail] D on P.ID=D.ProgrammID
  JOIN [Education].tblCourse C on C.ID=D.CourseID
  order by P.DateCreated desc

 

END


