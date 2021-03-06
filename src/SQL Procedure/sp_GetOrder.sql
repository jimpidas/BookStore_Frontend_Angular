USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetOrder]    Script Date: 29-08-2021 09:44:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[sp_GetOrder]
@UserId int,
@CartId int
AS
BEGIN
	select Orders.UserId,Orders.CartId,Orders.AddressId,Orders.OrderId,Orders.BookId,Books.Name,Books.Author,Books.Language,Address.CustomerName,Address.City,Address.State,Address.Country,Address.Pincode,Address.MobileNumber,Orders.OrderQuantity,Orders.TotalPrice
from Orders INNER JOIN   Books on Orders.BookId=Books.BookId INNER JOIN Address on Orders.AddressId=Address.AddressId
where Orders.CartId=@CartId
END
