USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfBooksId]    Script Date: 29-08-2021 09:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetListOfBooksId]
	@BookId int
	
	as begin
	select * from  [dbo].[Books] where BookId=@BookId
	End
