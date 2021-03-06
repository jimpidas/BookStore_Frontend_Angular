USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 29-08-2021 09:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[PlaceOrder] 
	-- Add the parameters for the stored procedure here
	@UserId int,
	@AddressId int,
	@CartId int
AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET XACT_ABORT on;
SET NOCOUNT ON;
BEGIN
BEGIN TRY
BEGIN TRANSACTION;

	
	DECLARE @TotalPrice int = 0;
	DECLARE @result int = 0;
	
	if((select count(*) from Carts where UserId = @UserId) = 0)
	begin
	set @result = 2;
	THROW 50009, 'cart is empty', -1;
	end

	set @TotalPrice = (select sum(TotalPrice) from Carts where Carts.UserId = @UserId);

	if(@TotalPrice > 0)
	begin
		

		
		insert into Orders(UserId,AddressId,BookId,OrderQuantity,TotalPrice,CartId) 
		select  @UserId, @AddressId, Carts.BookId,Carts.OrderQuantity,@TotalPrice, @CartId from 
		Carts inner join Books on Carts.BookId = Books.BookId
		where Carts.UserId = @UserId;

		
		

		delete from Carts where UserId = @UserId;
		
	end

	

	set @result = 1;
COMMIT TRANSACTION;	
return @result;
END TRY
BEGIN CATCH
--SELECT ERROR_NUMBER() as ErrorNumber, ERROR_MESSAGE() as ErrorMessage;
IF(XACT_STATE()) = -1
	BEGIN
		PRINT
		'transaction is uncommitable' + ' rolling back transaction'
		ROLLBACK TRANSACTION;
		print @result;
		return @result;
	END;
ELSE IF(XACT_STATE()) = 1
	BEGIN
		PRINT
		'transaction is commitable' + ' commiting back transaction'
		COMMIT TRANSACTION;
		print @result;
		return @result;
	END;
END CATCH
	
END
