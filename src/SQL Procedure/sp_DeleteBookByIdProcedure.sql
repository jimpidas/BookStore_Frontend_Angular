USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBookByIdProcedure]    Script Date: 29-08-2021 09:41:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteBookByIdProcedure]
@BookId int,
@AdminId int
as begin
	DELETE FROM   [dbo].[Books] WHERE BookId=@BookId AND AdminId= @AdminId
	End