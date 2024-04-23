/****** Object:  Procedure [dbo].[InsertALLBinIdentData]    Committed by VersionSQL https://www.versionsql.com ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertALLBinIdentData] 

AS
BEGIN
	-- 1. Insert BinIdentWetBin
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentWetBin] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'WetBin'
	
	-- ################################################################################################# --

	-- 2. Insert BinIdentDryBin
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentDryBin] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'DryBin'

	-- ################################################################################################# --

	-- 3. Insert BinIdentMealSilo
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentMealSilo] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'MealSilo'

	-- ################################################################################################# --

	-- 4. Insert BinIdentBulk
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentBulk] ([BinIO], [BulkLocNo], [BinType])
		SELECT [BinIO], [BinName], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'Bulk'

	-- ################################################################################################# --

	-- 5. Insert BinIdentTransfer
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentTransfer] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'Transfer'

	-- ################################################################################################# --

	-- 6. Insert BinIdentPreWeighing
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentPreWeighing] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'PreWeighing'
	
	-- ################################################################################################# --

	-- 7. Insert BinIdentPreGrinding
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentPreGrinding] ([BinIO], [BinType])
		SELECT [BinIO], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'PreGrinding'

	-- ################################################################################################# --

	-- 8. Insert BinIdentWeighing
	INSERT INTO [MasterSmartFeed].[dbo].[BinIdentWeighing] ([BinIO], [ScaleIndex], [BinType])
		SELECT [BinIO], [ScaleIndex], [BinType] 
		FROM [MasterSmartFeed].[dbo].[BinMaster]
		WHERE BinType = 'Weighing'

	-- ################################################################################################# --
END
