/****** Object:  Table [dbo].[IngredientProductionJob]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientProductionJob](
	[IngredientCode] [nvarchar](50) NOT NULL,
	[IngredientName] [nvarchar](250) NULL,
	[Density] [decimal](8, 2) NULL,
	[PQF] [decimal](8, 4) NULL,
	[Stock] [decimal](8, 2) NULL,
	[StockMin] [decimal](8, 2) NULL,
	[NeedCheckLot] [bit] NULL,
	[LinePriority1] [nvarchar](10) NULL,
	[LinePriority2] [nvarchar](10) NULL,
	[LinePriority3] [nvarchar](10) NULL,
	[LinePriority4] [nvarchar](10) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_IngredientProductionJob] PRIMARY KEY CLUSTERED 
(
	[IngredientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_IngredientName]  DEFAULT ('Null') FOR [IngredientName]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_PQF]  DEFAULT ((0)) FOR [PQF]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_Stock]  DEFAULT ((0)) FOR [Stock]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_StockMin]  DEFAULT ((0)) FOR [StockMin]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_NeedCheckLot]  DEFAULT ((0)) FOR [NeedCheckLot]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_LinePriority1]  DEFAULT ('Null') FOR [LinePriority1]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_LinePriority2]  DEFAULT ('Null') FOR [LinePriority2]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_LinePriority3]  DEFAULT ('Null') FOR [LinePriority3]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_LinePriority4]  DEFAULT ('Null') FOR [LinePriority4]
ALTER TABLE [dbo].[IngredientProductionJob] ADD  CONSTRAINT [DF_IngredientProductionJob_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
