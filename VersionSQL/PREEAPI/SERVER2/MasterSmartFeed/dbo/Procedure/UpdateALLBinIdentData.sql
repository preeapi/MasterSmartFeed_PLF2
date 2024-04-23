/****** Object:  Procedure [dbo].[UpdateALLBinIdentData]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateALLBinIdentData]

AS
BEGIN
	-- 1. Update BinIdentWetBin
	;WITH [CTE_UpdateBinIdentWetBin] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[Bin]
				  ,A.[BinType]
				  ,COALESCE(B.[IngredientCode], 'Null') AS [IngredientCode]
				  ,COALESCE(C.[Density], 0) AS [Density]
				  ,COALESCE(B.[Weight],0) AS [Weight]
				  ,IIF(B.[NotUse] = 1, 0, 1) AS [BinUse]
				  ,COALESCE(B.[MinMoisture], 0) AS [MinMoisture]
				  ,COALESCE(B.[MaxMoisture], 0) AS [MaxMoisture]
				  ,COALESCE(B.[Lot], 'Null') AS [Lot]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinDetail] as B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[Bin] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'WetBin' AND B.[Bin] IS NOT NULL
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentWetBin] 
		SET [IngredientCode] = [CTE_UpdateBinIdentWetBin].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentWetBin].[Density],
			[Weight] = [CTE_UpdateBinIdentWetBin].[Weight],
			[BinUse] = [CTE_UpdateBinIdentWetBin].[BinUse],
			[MinMoisture] = [CTE_UpdateBinIdentWetBin].[MinMoisture],
			[MaxMoisture] = [CTE_UpdateBinIdentWetBin].[MaxMoisture],
			[LastFillingLot] = [CTE_UpdateBinIdentWetBin].[Lot],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentWetBin].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentWetBin]
		WHERE [MasterSmartFeed].[dbo].[BinIdentWetBin].[BinIO] = [CTE_UpdateBinIdentWetBin].[BinIO]

	-- ################################################################################################# --

	-- 2. Update BinIdentDryBin
	;WITH [CTE_UpdateBinIdentDryBin] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[Bin]
				  ,A.[BinType]
				  ,COALESCE(B.[IngredientCode], 'Null') AS [IngredientCode]
				  ,COALESCE(C.[Density], 0) AS [Density]
				  ,COALESCE(B.[Weight],0) AS [Weight]
				  ,IIF(B.[NotUse] = 1, 0, 1) AS [BinUse]
				  ,COALESCE(B.[MinMoisture], 0) AS [MinMoisture]
				  ,COALESCE(B.[MaxMoisture], 0) AS [MaxMoisture]
				  ,COALESCE(B.[Lot], 'Null') AS [Lot]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinDetail] as B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[Bin] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'DryBin' AND B.[Bin] IS NOT NULL
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentDryBin] 
		SET [IngredientCode] = [CTE_UpdateBinIdentDryBin].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentDryBin].[Density],
			[Weight] = [CTE_UpdateBinIdentDryBin].[Weight],
			[BinUse] = [CTE_UpdateBinIdentDryBin].[BinUse],
			[MinMoisture] = [CTE_UpdateBinIdentDryBin].[MinMoisture],
			[MaxMoisture] = [CTE_UpdateBinIdentDryBin].[MaxMoisture],
			[LastFillingLot] = [CTE_UpdateBinIdentDryBin].[Lot],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentDryBin].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentDryBin]
		WHERE [MasterSmartFeed].[dbo].[BinIdentDryBin].[BinIO] = [CTE_UpdateBinIdentDryBin].[BinIO]

	-- ################################################################################################# --

	-- 3. Update BinIdentMealSilo
	;WITH [CTE_UpdateBinIdentMealSilo] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[Bin]
				  ,A.[BinType]
				  ,COALESCE(B.[IngredientCode], 'Null') AS [IngredientCode]
				  ,COALESCE(C.[Density], 0) AS [Density]
				  ,COALESCE(IIF(B.[NotUse] = 1, 0, 1),0) AS [BinUse]
				  ,COALESCE(B.[Lot], 'Null') AS [Lot]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinDetail] as B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[Bin] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'MealSilo' AND B.[Bin] IS NOT NULL
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentMealSilo] 
		SET [IngredientCode] = [CTE_UpdateBinIdentMealSilo].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentMealSilo].[Density],
			[BinUse] = [CTE_UpdateBinIdentMealSilo].[BinUse],
			[LastFillingLot] = [CTE_UpdateBinIdentMealSilo].[Lot],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentMealSilo].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentMealSilo]
		WHERE [MasterSmartFeed].[dbo].[BinIdentMealSilo].[BinIO] = [CTE_UpdateBinIdentMealSilo].[BinIO]

	-- ################################################################################################# --

	-- 4. Update BinIdentBulk
	;WITH [CTE_UpdateBinIdentBulk] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[Bin]
				  ,A.[BinType]
				  ,COALESCE(B.[IngredientCode], 'Null') AS [IngredientCode]
				  ,COALESCE(C.[Density], 0) AS [Density]
				  ,COALESCE(B.[Weight],0) AS [Weight]
				  ,COALESCE(IIF(B.[NotUse] = 1, 0, 1),0) AS [BinUse]
				  ,COALESCE(B.[Lot], 'Null') AS [Lot]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinDetail] as B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[Bin] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'Bulk' AND B.[Bin] IS NOT NULL
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentBulk] 
		SET [IngredientCode] = [CTE_UpdateBinIdentBulk].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentBulk].[Density],
			[Weight] = [CTE_UpdateBinIdentBulk].[Weight],
			[BinUse] = [CTE_UpdateBinIdentBulk].[BinUse],
			[LastFillingLot] = [CTE_UpdateBinIdentBulk].[Lot],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentBulk].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentBulk]
		WHERE [MasterSmartFeed].[dbo].[BinIdentBulk].[BinIO] = [CTE_UpdateBinIdentBulk].[BinIO]

	-- ################################################################################################# --
	
	-- 5. Update BinIdentTransfer
	-- ไม่มีการ bridge ข้อมูลจาก PlantControl BinIdentTransfer จะถูกอัพเดทโดย C#

	-- ################################################################################################# --

	-- 6. Update BinIdentPreWeighting
	;WITH [CTE_UpdateBinIdentPreWeighing] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[BinName] AS [PlantControl_BinName]
				  ,A.[BinType]
				  ,B.[Type] [PlantControl_BinType]
				  ,B.[IngredientCode] AS [PlantControl_IngredientCode]
				  ,COALESCE(C.[IngredientRawMatCode], 'Null') AS [IngredientCode]
				  ,COALESCE(D.[Density], 0) AS [Density]
				  ,COALESCE(B.[Active], 0) AS [BinUse]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinIdent] AS B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[BinName] COLLATE DATABASE_DEFAULT
			LEFT JOIN [MasterSmartFeed].[dbo].[IngredientRMtoPD] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientProductionCode] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS D
			ON C.[IngredientRawMatCode] COLLATE DATABASE_DEFAULT = D.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'PreWeighing' AND B.[BinName] IS NOT NULL AND B.[Type] ='Recieving'  
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentPreWeighing] 
		SET [IngredientCode] = [CTE_UpdateBinIdentPreWeighing].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentPreWeighing].[Density],
			[BinUse] = [CTE_UpdateBinIdentPreWeighing].[BinUse],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentPreWeighing].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentPreWeighing]
		WHERE [MasterSmartFeed].[dbo].[BinIdentPreWeighing].[BinIO] = [CTE_UpdateBinIdentPreWeighing].[BinIO]
	
	-- ################################################################################################# --
	
	-- 7. Update BinIdentPreGrinding
	;WITH [CTE_UpdateBinIdentPreGrinding] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[BinName] AS [PlantControl_BinName]
				  ,A.[BinType]
				  ,B.[Type] [PlantControl_BinType]
				  ,B.[IngredientCode] AS [PlantControl_IngredientCode]
				  ,COALESCE(C.[IngredientRawMatCode], 'Null') AS [IngredientCode]
				  ,COALESCE(D.[Density], 0) AS [Density]
				  ,COALESCE(B.[Active], 0) AS [BinUse]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinIdent] AS B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[BinName] COLLATE DATABASE_DEFAULT
			LEFT JOIN [MasterSmartFeed].[dbo].[IngredientRMtoPD] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientProductionCode] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterSmartFeed].[dbo].[IngredientRawMatMaster] AS D
			ON C.[IngredientRawMatCode] COLLATE DATABASE_DEFAULT = D.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'PreGrinding' AND B.[BinName] IS NOT NULL AND B.[Type] ='Pre-Grinding'  
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentPreGrinding] 
		SET [IngredientCode] = [CTE_UpdateBinIdentPreGrinding].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentPreGrinding].[Density],
			[BinUse] = [CTE_UpdateBinIdentPreGrinding].[BinUse],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentPreGrinding].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentPreGrinding]
		WHERE [MasterSmartFeed].[dbo].[BinIdentPreGrinding].[BinIO] = [CTE_UpdateBinIdentPreGrinding].[BinIO]

	-- ################################################################################################# --

	-- 7. Update BinIdentWeighting
	;WITH [CTE_UpdateBinIdentWeighting] AS 
		(
			SELECT A.[BinIO]
				  ,A.[BinName]
				  ,B.[BinName] AS [PlantControl_BinName]
				  ,A.[BinType]
				  ,B.[Type] [PlantControl_BinType]
				  ,COALESCE(B.[IngredientCode], 'Null') AS [IngredientCode]
				  ,COALESCE(C.[Density], 0) AS [Density]
				  ,COALESCE(B.[Active], 0) AS [BinUse]
				  ,GETDATE() AS [UpdateFromPlantControlAt]
			FROM [MasterSmartFeed].[dbo].[BinMaster] AS A
			LEFT JOIN [MasterPlantControl].[dbo].[BinIdent] AS B
			ON A.[BinName] COLLATE DATABASE_DEFAULT = B.[BinName] COLLATE DATABASE_DEFAULT AND
			   A.[ScaleIndex] COLLATE DATABASE_DEFAULT = B.[ScaleIndex] COLLATE DATABASE_DEFAULT
			LEFT JOIN  [MasterPlantControl].[dbo].[Ingredient_Desc] AS C
			ON B.[IngredientCode] COLLATE DATABASE_DEFAULT = C.[IngredientCode] COLLATE DATABASE_DEFAULT
			WHERE A.[BinType] = 'Weighing' AND B.[Type] ='Weighing' AND
				  B.[BinName] IS NOT NULL 	  
		)
		UPDATE [MasterSmartFeed].[dbo].[BinIdentWeighing] 
		SET [IngredientCode] = [CTE_UpdateBinIdentWeighting].[IngredientCode],
			[Density] = [CTE_UpdateBinIdentWeighting].[Density],
			[BinUse] = [CTE_UpdateBinIdentWeighting].[BinUse],
			[UpdateFromPlantControlAt] = [CTE_UpdateBinIdentWeighting].[UpdateFromPlantControlAt]
		FROM [CTE_UpdateBinIdentWeighting]
		WHERE [MasterSmartFeed].[dbo].[BinIdentWeighing].[BinIO] = [CTE_UpdateBinIdentWeighting].[BinIO]

		-- ################################################################################################# --
END
