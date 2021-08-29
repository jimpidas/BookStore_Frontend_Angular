USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_ReviewBackToBook]    Script Date: 29-08-2021 09:45:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[sp_ReviewBackToBook]
@UserId int,
@BookId int,
@Review int,
@Feedback varchar(30)
AS
BEGIN
Insert into Review (UserId,BookId,Review,Feedback) values (@BookId,@UserId,@Review,@Feedback)
	
	END
