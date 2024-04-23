/****** Object:  Table [dbo].[tmpUsageWeightingBin]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[tmpUsageWeightingBin](
	[BinIO] [int] NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[IngredientName] [nvarchar](100) NULL,
	[DailyUsage_ton] [decimal](8, 2) NULL,
	[MaxUsagePerBatch_ton] [decimal](8, 2) NULL,
	[DayOnHand_hours] [decimal](8, 2) NULL,
	[WeightedAvgUsagePerBatch_ton] [decimal](8, 2) NULL,
	[FrequencyOfUse_no] [int] NULL,
	[FrequencyOfUse_%] [decimal](8, 2) NULL
) ON [PRIMARY]
