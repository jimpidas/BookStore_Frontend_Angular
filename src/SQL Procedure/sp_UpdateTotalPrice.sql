USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTotalPrice]    Script Date: 29-08-2021 09:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_UpdateTotalPrice]
	@BookId int,
	@TotalPrice int
	
	AS
BEGIN
	update Carts set TotalPrice=0
	set @TotalPrice =  (select (Carts.OrderQuantity*Books.Price) as TotalPrice  from Books  inner join Carts  on  Books.BookId=Carts.BookId) ;
    
	UPDATE [dbo].[Carts] SET TotalPrice = @TotalPrice WHERE BookId = Carts.BookId
	
	
 
	End