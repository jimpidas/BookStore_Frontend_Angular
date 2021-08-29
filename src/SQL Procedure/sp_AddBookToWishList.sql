USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBookToWishList]    Script Date: 29-08-2021 09:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddBookToWishList]
	@UserId int,
	@BookId int
	
	
	as 
	begin
	Insert into WishList (UserId ,BookId) values (@UserId,@BookId)
	End