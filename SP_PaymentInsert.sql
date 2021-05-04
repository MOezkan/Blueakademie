USE [BlueAkademie]
GO



alter proc education.sp_PaymentInsert
(
@prmAccountHolder		nvarchar(50),
@prmDate				date,
@prmAmountIncome		decimal(5,2) null,
@prmAmountExpenditures	decimal(5,2) null,
@prmPaymentMethodID		int,
@prmEnrollmentID		int null,
@prmExplanation			nvarchar(200) null,
@prmComment				nvarchar(200) null
)
AS
BEGIN

/*
IF prmStudentID is inputed, it must be on  table tblStudentID. 
Otherwise program must stop.
*/

IF @prmAmountIncome is not null and @prmAmountIncome<0 
BEGIN
RAISERROR ('WRONG! AmountIncome must be valid',16,1)
Return 0
END

IF @prmAmountExpenditures is not null and @prmAmountExpenditures<0 
BEGIN
RAISERROR ('WRONG! AmountExpenditures must be valid',16,1)
Return 0
END

INSERT INTO [Education].[tblPayment]
           ([AccountHolder]
           ,[Date]
           ,[AmountIncome]
           ,[AmountExpenditures]
           ,[PaymentMethodID]
		   ,[EnrollmentID]
           ,[Explanation]
           ,[Comment]
           )
     VALUES
           (
		   @prmAccountHolder		
		   ,@prmDate				
		   ,@prmAmountIncome		
		   ,@prmAmountExpenditures	
		   ,@prmPaymentMethodID		
		   ,@prmEnrollmentID
		   ,@prmExplanation			
		   ,@prmComment				
		   
		   )
END



