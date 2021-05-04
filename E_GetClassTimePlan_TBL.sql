use BlueAkademie
go

CREATE FUNCTION education.GetClassTimePlan
(@ClassID as int)
returns table
as
return
(
SELECT Cl.Name
      ,[LessonDay]
      ,[LessonTime]
      ,[DailyHour]
    
  FROM [Education].[tblClassTimePlan] CT
  JOIN Education.tblclass Cl on CT.ClassID=cl.ID
  WHERE ClassID=@ClassID
  )


  
  --select * from [Education].[GetClassTimePlan] (5)