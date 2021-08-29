USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBookIntoCart]    Script Date: 29-08-2021 09:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_AddBookIntoCart]
	@UserId int,
	@BookId int
	
	
	as 
	begin
	--declare @totalP int=0;
	declare @checkQuantity int=0;
	set @checkQuantity=(select Quantity from Books where BookId = @BookId)
	

	if((@checkQuantity) = 0)
	begin;
	
		THROW 52000, 'Out Of Stock',0;
		end

	Insert into Carts (UserId ,BookId) values (@UserId,@BookId)
	UPDATE [dbo].[Carts] SET OrderQuantity = OrderQuantity WHERE BookId = @BookId
	UPDATE [dbo].[Books] SET Quantity = Quantity-1 WHERE BookId = @BookId
	--set @totalP=(select(Carts.OrderQuantity*Books.Price) from Books  inner join Carts  on  Books.BookId=Carts.BookId AND UserId=@UserId);
	--Update Carts set TotalPrice=@totalP
	End