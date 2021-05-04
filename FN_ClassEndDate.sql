use BlueAkademie
go

alter function [Education].fn_ClassEndDate
(
@prmCourseFirstDate date
,@prmClassID int

)
returns date
as
Begin

declare @Hours int
declare @Date date =@prmCourseFirstDate
declare @IsHoliday int
declare @DailyHour int

--get the course hours
SET @Hours=(
			select P.Hours 
			from [Education].[tblProgramm] P
			JOIN Education.tblClass C on c.ProgrammID=p.ID
			WHERE C.ID=@prmClassID
			)

declare @WhichDay nvarchar(10)
declare @DayCounter int

--This code should work until all lesson hours have been scheduled.
WHILE (@Hours>0)
BEGIN
	set @IsHoliday= (	select count (*)
						from BlueAkademie.Education.tblHoliday
						where date=@Date)
	
	IF @IsHoliday=0
	BEGIN
		set @DailyHour= coalesce((	select t.DailyHour 
							from education.tblClassTimePlan T 
							where T.ClassID=@prmClassID and DATENAME(dw,@date)=t.LessonDay),0)

		set @Hours=@Hours-@DailyHour 
		--print concat('@Date--> ',@Date,' @Hours-->',@Hours)
	END -- @IsHoliday=0

	IF @Hours>0
	BEGIN
		set @DayCounter=1
		set @Date=DATEADD(day,1,@Date)
		set @WhichDay= DATENAME(dw,@Date)
	
		WHILE @DayCounter<8 and (	select count(*) 
									from[Education].[tblClassTimePlan]
									where LessonDay=@WhichDay and ClassID=@prmClassID)=0

		BEGIN
			set @Date=DATEADD(day,1,@Date)
			set @WhichDay= DATENAME(dw,@Date)

			set @DayCounter=@DayCounter+1
			--print concat('@Date--> ',@Date,' @Hours-->',@Hours,' @DayCounter-->',@DayCounter,' @WhichDay-->',@WhichDay)
		END--end while

	END--end if @Hours>0



END

return @Date
end