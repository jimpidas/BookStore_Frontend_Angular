USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfWishList]    Script Date: 29-08-2021 09:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetListOfWishList]
	
	@UserId int
AS
BEGIN
	select WishList.WishListId,WishList.UserId,WishList.BookId,Books.Name,Books.Author,Books.Language,Books.Category,Books.Pages,Books.Price from Books  inner join WishList  on  Books.BookId=WishList.BookId AND UserId=@UserId
END
