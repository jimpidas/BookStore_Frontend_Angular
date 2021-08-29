USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAddress]    Script Date: 29-08-2021 09:45:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_UpdateAddress]
	@UserId int,
	@AddressId int,
	@CustomerName varchar(20) ,
	@City varchar(20) ,
	@State varchar(30),
	@Country varchar(30) ,
	@Pincode varchar(30) ,
	@MobileNumber varchar(30)
	
	AS
BEGIN
	UPDATE [dbo].[Address]SET CustomerName=@CustomerName, City=@City, State=@State, Country=@Country, Pincode=@Pincode, MobileNumber=@MobileNumber 
 WHERE UserId=@UserId AND AddressId=@AddressId
	End