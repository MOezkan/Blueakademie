USE [BlueAkademie]
GO

CREATE proc education.[sp_PaymentMethodDelete]
(
@prmPaymentMethodID int
)
AS

BEGIN

declare @versionPaymentMethod int

set @versionPaymentMethod=coalesce((select MAX(Version) 
						            from [History].[tblPaymentMethod]
						            where  PaymentMethodID=@prmPaymentMethodID),0)

insert into [History].tblPaymentMethod
([PaymentMethodID] ,Name ,DateCreated , Version)
select 
ID ,Name ,DateCreated, @versionPaymentMethod+1
from Education.tblPaymentMethod
where ID=@prmPaymentMethodID


delete from Education.[tblPaymentMethod]
where ID=@prmPaymentMethodID

END