use BlueAkademie
go
ALTER FUNCTION education.fn_InvoiceNumber_Produce 
()
RETURNS  DECIMAL (14,0)
AS
BEGIN

declare @DateCreated		datetime2(0)=getdate()
declare @InvoiceNumber		DECIMAL (14,0)
declare @tempInvoiceNumber	nvarchar(20)


SET @tempInvoiceNumber= cast( @DateCreated as nvarchar(20))
SET @tempInvoiceNumber=LEFT(@tempInvoiceNumber,19)
SET @tempInvoiceNumber=REPLACE(@tempInvoiceNumber,'-','')
SET @tempInvoiceNumber=REPLACE(@tempInvoiceNumber,':','')
SET @tempInvoiceNumber=REPLACE(@tempInvoiceNumber,' ','')

SET @InvoiceNumber=cast( @tempInvoiceNumber as DECIMAL (14,0))

RETURN @InvoiceNumber

END
GO

