USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddOrder]    Script Date: 29-08-2021 09:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddOrder]
	@UserId int,
	@CartId int,
	@AddressId int
	
	as 
	begin
	Insert into [dbo].[Orders] (UserId ,CartId,AddressId) values (@UserId,@CartId,@AddressId)
	
	delete from Carts where CartId=@CartId

	End
