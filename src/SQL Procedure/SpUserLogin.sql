USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[SpUserLogin]    Script Date: 29-08-2021 09:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SpUserLogin] 
(@Email varchar(50),
	@Password varchar(50),
	@UserId int out )
	as 
	begin
	Select @UserId=UserId from Users
	where Email= @Email AND Password=@Password 
	End