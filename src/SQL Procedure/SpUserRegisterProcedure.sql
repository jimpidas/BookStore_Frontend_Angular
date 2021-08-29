USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[SpUserRegisterProcedure]    Script Date: 29-08-2021 09:46:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SpUserRegisterProcedure]
	@FullName varchar(50),
	@Email varchar(50),
	@Password varchar(50),
	@MobileNo varchar(15),
	@Role varchar (30)
	
	as begin
	DECLARE @result int = 0;
	if((select count(Email) from Users where Email = @Email) = 1)
	begin;
	set @result = 2;
		THROW 52000, 'Email already exist', -1;
		end
	Insert into Users values ( @FullName ,@Email,@Password,@MobileNo,@Role)
	set @result = 1;
	End




	select * from Users