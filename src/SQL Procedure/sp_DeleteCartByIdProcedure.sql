USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCartByIdProcedure]    Script Date: 29-08-2021 09:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteCartByIdProcedure]
@CartId int

as 
begin
	DELETE FROM   [dbo].[Carts] WHERE CartId=@CartId 
	End