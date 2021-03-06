USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfBooksInCart]    Script Date: 29-08-2021 09:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetListOfBooksInCart]
	
	@UserId int	
AS
BEGIN
	
	--declare @totalP int=0;
	--set @totalP=(select(Carts.OrderQuantity*Books.Price) from Books  inner join Carts  on  Books.BookId=Carts.BookId AND UserId=@UserId)
	
	select Carts.UserId,Carts.CartId,Books.BookId,Books.Name,Books.Author,Books.Language,Books.Category,Books.Pages,Books.Price,Carts.OrderQuantity,(Carts.OrderQuantity*Books.Price) as TotalPrice  from Books  inner join Carts  on Books.BookId=Carts.BookId

	UPDATE [dbo].[Carts] SET TotalPrice = TotalPrice WHERE BookId = Carts.BookId
	End

	