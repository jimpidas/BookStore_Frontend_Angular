USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfBooks]    Script Date: 29-08-2021 09:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetListOfBooks]

	
	as begin
	select * from  [dbo].[Books] 
	End

	