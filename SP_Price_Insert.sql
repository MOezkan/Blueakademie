USE [BlueAkademie]
GO

create proc education.sp_PriceInsert
(

@prmClassID	int,
@prmPrice	decimal(5,2)

)
AS
BEGIN




INSERT INTO [Education].[tblPrice]
           (
           ClassID
           ,Price
           )
     VALUES
           (
		   		
		   @prmClassID,
			@prmPrice		
		   
		   )


END