USE [BlueAkademie]
GO


---- kurslar olustur
DECLARE @RC int
DECLARE @prmName nvarchar(100) ='Course2'
DECLARE @prmHours int='20'

EXECUTE @RC = [Education].[sp_CourseCreate] 
   @prmName
  ,@prmHours
GO

select * from Education.tblCourse


--program olustur
USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmName nvarchar(50)='Program1'
DECLARE @prmHours int=50
DECLARE @prmCourseIDs nvarchar(max)='14,15'

EXECUTE @RC = [Education].[sp_ProgrammCreate] 
   @prmName
  ,@prmHours
  ,@prmCourseIDs
GO

select * from Education.tblProgramm
select * from Education.tblProgrammDetail



--bir class olustur
USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmProgrammID int=28
DECLARE @prmCourseFirstDate date='2021-04-30'
DECLARE @prmClassName nvarchar(50)='CumaKursu'
DECLARE @prmMonday bit
DECLARE @prmLessonHoursMonday int
DECLARE @prmLessonTimeMonday time(7)
DECLARE @prmTuesday bit
DECLARE @prmLessonHoursTuesday int
DECLARE @prmLessonTimeTuesday time(7)
DECLARE @prmWednesday bit
DECLARE @prmLessonHoursWednesday int
DECLARE @prmLessonTimeWednesday time(7)
DECLARE @prmThursday bit
DECLARE @prmLessonHoursThursday int
DECLARE @prmLessonTimeThursday time(7)
DECLARE @prmFriday bit=1
DECLARE @prmLessonHoursFreiday int=1
DECLARE @prmLessonTimeFreiday time(7)='12:00'
DECLARE @prmSaturday bit
DECLARE @prmLessonHoursSaturday int
DECLARE @prmLessonTimeSaturday time(7)
DECLARE @prmSunday bit
DECLARE @prmLessonHoursSunday int
DECLARE @prmLessonTimeSunday time(7)
DECLARE @prmPrice decimal(5,2)=900


EXECUTE @RC = [Education].[sp_ClassCreate] 
   @prmProgrammID
  ,@prmCourseFirstDate
  ,@prmClassName
  ,@prmMonday
  ,@prmLessonHoursMonday
  ,@prmLessonTimeMonday
  ,@prmTuesday
  ,@prmLessonHoursTuesday
  ,@prmLessonTimeTuesday
  ,@prmWednesday
  ,@prmLessonHoursWednesday
  ,@prmLessonTimeWednesday
  ,@prmThursday
  ,@prmLessonHoursThursday
  ,@prmLessonTimeThursday
  ,@prmFriday
  ,@prmLessonHoursFreiday
  ,@prmLessonTimeFreiday
  ,@prmSaturday
  ,@prmLessonHoursSaturday
  ,@prmLessonTimeSaturday
  ,@prmSunday
  ,@prmLessonHoursSunday
  ,@prmLessonTimeSunday
  ,@prmPrice
GO

select * from Education.tblClass
select * from Education.tblClassTimePlan


--ögrenci kaydedelim
USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmFirstName nvarchar(50)='Ali'
DECLARE @prmLastName nvarchar(50)='Beraber'
DECLARE @prmBirthDay date='2000-01-01'
DECLARE @prmPhone nvarchar(50)='555-55-55'
DECLARE @prmEmail nvarchar(50)='aliberaber@testba'
DECLARE @prmAddress nvarchar(200)='cumhuriyet mahallesi 12 Berlin'



EXECUTE @RC = [Education].[sp_StudentInsert] 
   @prmFirstName
  ,@prmLastName
  ,@prmBirthDay
  ,@prmPhone
  ,@prmEmail
  ,@prmAddress
GO

select * from Education.tblStudent


--  ögrenciyi  sinifimiza kaydedelim

USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmStudentID int=31
DECLARE @prmClassID int=27
DECLARE @prmEnrollmentTypeID int=1



EXECUTE @RC = [Education].[sp_EnrollmentInsert] 
   @prmStudentID
  ,@prmClassID
  ,@prmEnrollmentTypeID
GO
select * from Education.tblEnrollment



--bir ödeme kaydedelim

USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmAccountHolder nvarchar(50)='alinin babasi'
DECLARE @prmDate date='2021-04-30'
DECLARE @prmAmountIncome decimal(5,2)=100
DECLARE @prmAmountExpenditures decimal(5,2)
DECLARE @prmPaymentMethod int=1

DECLARE @prmEnrollmentID int=1
DECLARE @prmExplanation nvarchar(200)
DECLARE @prmComment nvarchar(200)


EXECUTE @RC = [Education].[sp_PaymentInsert] 
   @prmAccountHolder
  ,@prmDate
  ,@prmAmountIncome
  ,@prmAmountExpenditures
  ,@prmPaymentMethod

  ,@prmEnrollmentID
  ,@prmExplanation
  ,@prmComment
GO
select * from Education.tblPayment


--fatura olusturalim
USE [BlueAkademie]
GO

DECLARE @RC int
DECLARE @prmPaymentID int=1
DECLARE @prmInvoiceDate date='2021-04-30'
DECLARE @prmVat int=19


EXECUTE @RC = [Education].[sp_InvoiceCreate] 
   @prmPaymentID
  ,@prmInvoiceDate
  ,@prmVat
GO
select * from Education.tblInvoice

