USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AdminRegisterProcedure]    Script Date: 29-08-2021 09:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AdminRegisterProcedure]
	@FullName varchar(20),
	@MobileNo varchar(20),
	@Email varchar(30),
	@Password varchar(30),
	@Role varchar (30)
	
	as begin
	DECLARE @result int = 0;
	if((select count(Email) from Users where Email = @Email) = 1)
	begin;
	set @result = 2;
		THROW 52000, 'Email already exist', -1;
		end
	Insert into Admin values ( @FullName,@Email,@Password,@MobileNo,@Role)
	set @result = 1;
	End
