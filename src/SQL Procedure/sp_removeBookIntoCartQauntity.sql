USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_removeBookIntoCartQauntity]    Script Date: 29-08-2021 09:44:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_removeBookIntoCartQauntity]
@UserId int,
	@BookId int,
	@OrderQuantity int
	
	as 
	begin
	declare @totalP int=0;
	UPDATE [dbo].[Carts] SET OrderQuantity = @OrderQuantity WHERE BookId = @BookId
	UPDATE [dbo].[Books] SET Quantity = Quantity+1 WHERE BookId = @BookId
	set @totalP=(select(Carts.OrderQuantity*Books.Price) from Books  inner join Carts  on  Books.BookId=Carts.BookId AND UserId=@UserId)
	Update Carts set TotalPrice=@totalP
	End