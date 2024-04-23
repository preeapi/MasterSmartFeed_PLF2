/****** Object:  Procedure [dbo].[InsertALLMasterData]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertALLMasterData]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- 1 Insert IngredientRawMatMaster
	INSERT INTO [MasterSmartFeed].dbo.[IngredientRawMatMaster] 
	(
		 [IngredientCode]
		,[IngredientName]
		,[ProductGroup]
		,[ProductGroupName]
		,[ProductCode]
		,[SameIngredientRawMat]
		,[CreateAt]
	)
	SELECT  [IngredientCode]
		   ,[IngredientName]
		   ,[ProductGroup]
		   ,[ProductGroupName]
		   ,[ProductCode]
		   ,[SameIG]
		   ,[create_at]
	FROM [MasterPlantControl].[dbo].[RawManagement]

	-- ################################################################################################# --

	-- 2 Insert IngredientProductionMaster
	INSERT INTO [MasterSmartFeed].[dbo].[IngredientProductionMaster] 
	(
		 [IngredientCode]
		,[IngredientName]
		,[Density]
		,[PQF]
		,[CreateAt]
	)
	SELECT  [IngredientCode]
		   ,[IngredientName]
		   ,[Density]
		   ,[PQF]
		   ,[create_at]
	FROM [MasterPlantControl].[dbo].[Ingredient_Desc]
	WHERE [IngredientCode] NOT LIKE 'IG%'

	-- ################################################################################################# --

	-- 3 Insert IngredientFormulaCodeMaster
	INSERT INTO [MasterSmartFeed].[dbo].[FormulaCodeMaster]
	(
		 [FormulaCode]
		,[FormulaName]
		,[FormulaDate]
		,[DensityPellet]
		,[FeedGroup]
		,[CreateAt]
	)
	SELECT  [FormulaCode]
		   ,[FormulaName]
		   ,[FormulaDate]
		   ,[Density]
		   ,[FeedGroup_Medical]
		   ,[create_at]
	FROM [MasterPlantControl].[dbo].[Formula_Desc]
	WHERE [FormulaName] <> 'null' AND [FeedGroup_Medical] LIKE 'G%'

END
