USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBooksProcedure]    Script Date: 29-08-2021 09:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_UpdateBooksProcedure]
	@BookId int,
	@AdminId int,
	@Name varchar(20) ,
	@Author varchar(20) ,
	@Language varchar(30),
	@Category varchar(30) ,
	@Pages varchar(30) ,
	@Price int,
	@Quantity int
	
	AS
BEGIN
	UPDATE [dbo].[Books]SET Name=@Name, Author=@Author, Language=@Language, Category=@Category, Pages=@Pages, Price=@Price ,Quantity=@Quantity
 WHERE BookId=@BookId AND AdminId=@AdminId
	End
