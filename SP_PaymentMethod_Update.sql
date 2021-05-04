USE BlueAkademie
GO

CREATE PROC Education.sp_PaymentMethodUpdate
(
 @prmPaymentMethodID int
,@prmName nvarchar(50) 
 )
 AS
 BEGIN



 if exists 
 (
 select @prmPaymentMethodID ,@prmName 
 except
 select ID ,Name 
 from [Education].[tblPaymentMethod]
 where ID=@prmPaymentMethodID
 )

 BEGIN

 declare @versionPaymentMethod int
 set @versionPaymentMethod=coalesce((select MAX(Version) 
						            from [History].[tblPaymentMethod]
						            where  [PaymentMethodID]=@prmPaymentMethodID),0)


insert into [History].tblPaymentMethod
([PaymentMethodID] ,Name ,DateCreated , Version)
select 
ID ,Name ,DateCreated, @versionPaymentMethod+1
from Education.tblPaymentMethod
where ID=@prmPaymentMethodID


UPDATE [Education].[tblPaymentMethod]
set
Name= @prmName
,DateCreated= GETDATE() 
where ID=@prmPaymentMethodID

END 

END