/****** Object:  Procedure [dbo].[InsertALLJobData]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertALLJobData]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- 1. Insert IngredientRawMaterialJob
	INSERT INTO [MasterSmartFeed].[dbo].[IngredientRawMaterialJob]
	(
		[IngredientCode], [IngredientName]
 	)
	SELECT [IngredientCode]
		  ,[IngredientName]
	FROM [MasterPlantControl].[dbo].[RawManagement]

	-- ################################################################################################# --

	-- 2. Insert IngredientProductionJob
	INSERT INTO [MasterSmartFeed].[dbo].[IngredientProductionJob]
	(
		[IngredientCode], [IngredientName], [Density], [PQF]
 	)
	SELECT [IngredientCode]
		  ,[IngredientName]
		  ,[Density]
		  ,[PQF]
	FROM [MasterPlantControl].[dbo].[Ingredient_Desc]
	WHERE [IngredientCode] NOT LIKE 'IG%' AND [IngredientCode] NOT LIKE '9%' AND [IngredientCode] NOT LIKE '00%' AND
		  LEN([IngredientCode]) = 6 AND [IngredientName] <> 'null'
END
