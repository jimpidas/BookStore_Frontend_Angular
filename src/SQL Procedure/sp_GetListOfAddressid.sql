USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListOfAddressid]    Script Date: 29-08-2021 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_GetListOfAddressid]
	@UserId int,
	@AddressId int
	as begin
	select * from  [dbo].[Address] where UserId=@UserId AND AddressId=@AddressId
	End