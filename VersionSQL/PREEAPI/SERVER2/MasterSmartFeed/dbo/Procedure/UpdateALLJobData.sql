/****** Object:  Procedure [dbo].[UpdateALLJobData]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateALLJobData] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- 1. Update UpdateIngredientRawMaterialJob
	;WITH [CTE_UpdateIngredientRawMaterialJob] AS 
	(
		SELECT [IngredientCode]
			  ,[Density]
		FROM [MasterSmartFeed].[dbo].[IngredientRawMatMaster]
	)
	UPDATE [MasterSmartFeed].[dbo].[IngredientRawMaterialJob]
	SET [Density] = [CTE_UpdateIngredientRawMaterialJob].[Density],
		[UpdateFromPlantControlAt] = GETDATE()
	FROM [CTE_UpdateIngredientRawMaterialJob]
	WHERE [MasterSmartFeed].[dbo].[IngredientRawMaterialJob].[IngredientCode] = [CTE_UpdateIngredientRawMaterialJob].[IngredientCode]

	-- ################################################################################################# --

	-- 2. Update UpdateIngredientProductionJob
	;WITH [CTE_UpdateIngredientProductionJob] AS 
	(
		SELECT [IngredientCode]
			  ,[Density]
			  ,[PQF]
		FROM [MasterPlantControl].[dbo].[Ingredient_Desc]
		WHERE [IngredientCode] NOT LIKE 'IG%' AND [IngredientCode] NOT LIKE '9%' AND [IngredientCode] NOT LIKE '00%' AND
			  LEN([IngredientCode]) = 6 AND [IngredientName] <> 'null'
	)
	UPDATE [MasterSmartFeed].[dbo].[IngredientProductionJob]
	SET [Density] = [CTE_UpdateIngredientProductionJob].[Density],
		[PQF] = [CTE_UpdateIngredientProductionJob].[PQF],
		[UpdateFromPlantControlAt] = GETDATE()
	FROM [CTE_UpdateIngredientProductionJob]
	WHERE [MasterSmartFeed].[dbo].[IngredientProductionJob].[IngredientCode] = [CTE_UpdateIngredientProductionJob].[IngredientCode]

	-- ################################################################################################# --
END
