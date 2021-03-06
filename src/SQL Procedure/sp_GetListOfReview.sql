USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfReview]    Script Date: 29-08-2021 09:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_GetListOfReview]	
	@UserId int
AS
BEGIN
	select Review.UserId,Books.BookId,Books.Name,Books.Author,Books.Language,Books.Category,Books.Pages,Books.Price, Review.Review,Review.Feedback from Books  inner join Review  on  Books.BookId=Review.BookId AND UserId=@UserId
END
