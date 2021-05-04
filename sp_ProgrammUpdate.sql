USE [BlueAkademie]
GO

alter proc education.sp_ProgrammUpdate
(
@prmProgrammID int,
@prmName nvarchar(50) ,
@prmHours int ,
@prmCourseIDs nvarchar(max) 
)
as
begin

IF EXISTS
(
	(SELECT @prmName as Name ,@prmHours as Hours ,value as CourseID from
	 (SELECT value FROM STRING_SPLIT(@prmCourseIDs, ',')) as inners
		except
	select Name, Hours,d.CourseID 
	from [Education].[tblProgramm] P
	JOIN [Education].[tblProgrammDetail] D on p.ID=D.ProgrammID
	where P.ID=@prmProgrammID)

		union
	
	(select Name, Hours,d.CourseID 
	from [Education].[tblProgramm] P
	JOIN [Education].[tblProgrammDetail] D on p.ID=D.ProgrammID
	where P.ID=@prmProgrammID
		except
	SELECT @prmName as Name ,@prmHours as Hours ,value as CourseID from
	(SELECT value FROM STRING_SPLIT(@prmCourseIDs, ',')) as inners)

)
BEGIN


--Programla ilgili olan history de bulunan iki tablodan ilgili programID ye ait en büyük versiyon numaralarini aliyoruz.
declare @versionProgramm int
declare @versionProgrammDetail int

set @versionProgramm=coalesce((	select MAX(Version) 
						from [History].[tblProgramm] P
						where  P.[ProgrammID]=@prmProgrammID),0)

set @versionProgrammDetail=coalesce((	select MAX(Version) 
										from [History].[tblProgrammDetail]
										where  ProgrammID=@prmProgrammID),0)




		insert into [History].[tblProgramm]
		([ProgrammID],[Name],[Hours],[DateCreated],[DateValid],[Version])
		select [ID],[Name],[Hours],[DateCreated],GETDATE(),@versionProgramm+1
		from Education.tblProgramm
		where ID=@prmProgrammID
		
		
		
	
				UPDATE [Education].[tblProgramm]
				   SET [Name] = @prmName
				   ,Hours = @prmHours
				   ,DateCreated=GETDATE()
				   WHERE ID=@prmProgrammID
			
		

	insert into History.tblProgrammDetail
	(ProgrammID,CourseID,DateCreated,DateValid,Version)
	select ProgrammID,CourseID,DateCreated,GETDATE(),@versionProgrammDetail+1 
	from [Education].[tblProgrammDetail]
	where ProgrammID=@prmProgrammID


	
					   INSERT INTO [Education].[tblProgrammDetail]
						(ProgrammID,CourseID)
						select @prmProgrammID,ID 
						from Education.tblCourse 
						where ID in (	
										SELECT value 
										FROM STRING_SPLIT(@prmCourseIDs, ',') 
										where value not in (
															select CourseID 
															from [Education].[tblProgrammDetail]
															where ProgrammID=@prmProgrammID
															)
									)
				
				

					delete from [Education].[tblProgrammDetail]
					where ProgrammID=@prmProgrammID 
					and CourseID not in(SELECT value FROM STRING_SPLIT(@prmCourseIDs, ','))
		

END



SELECT P.Name ProgrammName
      ,P.Hours ProgrammHours
     ,C.Name CourseName
	 ,c.Hours CourseHours
  FROM [Education].[tblProgramm] P
  JOIN [Education].[tblProgrammDetail] D on P.ID=D.ProgrammID
  JOIN [Education].tblCourse C on C.ID=D.CourseID
  order by P.DateCreated desc

end

