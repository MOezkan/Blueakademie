USE [BlueAkademie]
GO

--drop proc education.sp_PriceUpdate


create proc education.sp_PriceUpdate
(

@prmClassID	int,
@prmPrice	decimal(5,2)


)
AS
BEGIN
IF NOT EXISTS (select * 
				from Education.tblPrice
				where ClassID=@prmClassID ) 
	BEGIN
	raiserror ('WRONG! There is NOT this programm',16,1)
	return 0
	END

else			--exists (
--					select @prmClassID,@prmPrice
--						except
--					select [ClassID],[Price]
--					from Education.tblPrice
--					where ID=@prmID and ClassID=@prmClassID)

		Begin
		
		declare @versionPrice int
				
				set @versionPrice=coalesce((	select MAX(Version) 
												from [History].tblPrice
												where [ClassID]=@prmClassID ),0)
				
						
				insert into [History].tblprice
				([ClassID],[Price],[DateCreated],[Version])
				select ClassID,[Price],[DateCreated],@versionPrice+1
				from Education.tblprice
				where [ClassID]=@prmClassID 
					
					
				update [Education].[tblPrice]
				set 
					  
					Price= @prmPrice , 
					DateCreated=getdate()
					where [ClassID]=@prmClassID  
		         
		END

		SELECT P.ClassID
				,C.Name
				,Price
				
		FROM [Education].[tblPrice] P
		JOIN [Education].[tblClass] C on P.ClassID=C.ID  
		order by P.DateCreated desc
End