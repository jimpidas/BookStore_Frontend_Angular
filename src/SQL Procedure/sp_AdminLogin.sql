USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminLogin]    Script Date: 29-08-2021 09:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AdminLogin] 
(@Email varchar(30),
	@Password varchar(30),
	@AdminId int out )
	as 
	begin
	Select @AdminId=AdminId from Admin
	where Email= @Email AND Password=@Password 
	End