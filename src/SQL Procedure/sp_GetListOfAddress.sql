USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfAddress]    Script Date: 29-08-2021 09:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetListOfAddress]
	@UserId int
	as begin
	select * from  [dbo].[Address] where UserId=@UserId
	End