USE [BlueAkademie]
GO



create Proc education.sp_PaymentMethodInsert
(@prmName nvarchar(50) )
as
Begin
INSERT INTO [Education].[tblPaymentMethod]
           ([Name])
     VALUES (@prmName)
	 
END

