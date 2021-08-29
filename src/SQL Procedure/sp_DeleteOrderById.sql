USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOrderById]    Script Date: 29-08-2021 09:41:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteOrderById]
@OrderId int,
@UserId int

as 
begin
	DELETE FROM [dbo].[Orders] WHERE OrderId=@OrderId AND UserId=@UserId
	End