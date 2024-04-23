/****** Object:  Table [dbo].[IngredientProductionMaster]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientProductionMaster](
	[IngredientCode] [nvarchar](50) NOT NULL,
	[IngredientName] [nvarchar](250) NULL,
	[Density] [decimal](8, 2) NULL,
	[PQF] [decimal](8, 4) NULL,
	[NumberOfGrinding] [int] NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_IngredientMaster_1] PRIMARY KEY CLUSTERED 
(
	[IngredientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientProductionMaster] ADD  CONSTRAINT [DF_IngredientProductionMaster_IngredientName]  DEFAULT ('Null') FOR [IngredientName]
ALTER TABLE [dbo].[IngredientProductionMaster] ADD  CONSTRAINT [DF_IngredientProductionMaster_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[IngredientProductionMaster] ADD  CONSTRAINT [DF_IngredientProductionMaster_PQF]  DEFAULT ((0)) FOR [PQF]
ALTER TABLE [dbo].[IngredientProductionMaster] ADD  CONSTRAINT [DF_IngredientMaster_NumberOfGrinding]  DEFAULT ((0)) FOR [NumberOfGrinding]
ALTER TABLE [dbo].[IngredientProductionMaster] ADD  CONSTRAINT [DF_IngredientMaster_create_at]  DEFAULT (getdate()) FOR [CreateAt]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'จำนวนรอบในการบดวัตถุดิบ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IngredientProductionMaster', @level2type=N'COLUMN',@level2name=N'NumberOfGrinding'
