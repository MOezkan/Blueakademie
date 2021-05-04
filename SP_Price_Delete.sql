USE [BlueAkademie]
GO

--drop proc [Education].[sp_PriceDelete]


create proc [Education].[sp_PriceDelete]
(
@prmID int,
@prmClassID int
)
AS

BEGIN

IF NOT EXISTS (select * 
				from Education.tblPrice
				where ClassID=@prmClassID and ID=@prmID) 
	BEGIN
	raiserror ('WRONG! There is NOT this programm',16,1)
	return 0
	END


declare @versionPrice int


set @versionPrice=coalesce((	select MAX(Version) 
						from [History].[tblPrice]
						where  ClassID=@prmClassID),0)



insert into [History].[tblPrice]
([ClassID],[Price] ,[DateCreated],[DateValid],[Version])
select [ClassID],[Price],[DateCreated],GETDATE(),@versionPrice+1
from Education.tblPrice
where ClassID=@prmClassID


delete from Education.tblPrice
where ClassID=@prmClassID  and ID=@prmID

SELECT 
      P.ClassID
	  ,C.name
      ,Price
  FROM [Education].[tblPrice] P
  JOIN [Education].[tblClass] C on P.ClassID=C.ID  
  order by P.DateCreated desc


END