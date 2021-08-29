USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAddressById]    Script Date: 29-08-2021 09:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_DeleteAddressById]
@UserId int,
@AddressId int
as begin
	DELETE FROM   [dbo].[Address] WHERE UserId=@UserId AND AddressId= @AddressId
	End