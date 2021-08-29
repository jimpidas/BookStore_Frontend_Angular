USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBooksProcedure]    Script Date: 29-08-2021 09:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddBooksProcedure]
	@AdminId int,
	@Name varchar(20) ,
	@Author varchar(20) ,
	@Language varchar(30),
	@Category varchar(30) ,
	@Pages varchar(30) ,
	@Price int,
	@Quantity int
	
	as begin
	Insert into [dbo].[Books] values ( @AdminId ,@Name,@Author,@Language,@Category,@Pages,@Quantity,@Price)
	End