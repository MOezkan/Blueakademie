USE [BlueAkademie]
GO

alter proc education.sp_StudentInsert
(

@prmFirstName	nvarchar(50),
@prmLastName	nvarchar(50),
@prmBirthDay	date,
@prmPhone		nvarchar(50),
@prmEmail		nvarchar(50),
@prmAddress		nvarchar(200)

)
AS
BEGIN


IF charindex('@',@prmAddress)=0
BEGIN
raiserror ('WRONG! email address',16,1)
RETURN 0
END




INSERT INTO [Education].[tblStudent]
           (
           [Address]
           ,[FirstName]
           ,[LastName]
           ,[BirthDay]
           ,[Phone]
           ,[Email])
     VALUES
           (
		   		
		   @prmAddress		
		   ,@prmFirstName	
		   ,@prmLastName	
		   ,@prmBirthDay	
		   ,@prmPhone		
		   ,@prmEmail		
		   
		   )



END