/****** Object:  Table [dbo].[BinIdentPreWeighing]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentPreWeighing](
	[BinIO] [int] NOT NULL,
	[BinType] [nvarchar](20) NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[Density] [decimal](8, 3) NULL,
	[Weight]  AS ([Density]*[Volume]),
	[StockMin] [decimal](8, 2) NULL,
	[ActiveFilling] [bit] NOT NULL,
	[ActiveDischarge] [bit] NOT NULL,
	[BinUse] [bit] NOT NULL,
	[Volume] [decimal](8, 2) NULL,
	[HighBin] [bit] NULL,
	[BinPriority] [tinyint] NULL,
	[FullFill] [bit] NULL,
	[FillingTime] [datetime] NULL,
	[LastTimeDischarge] [datetime] NULL,
	[LastFillingLot] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_BinIdentPreWeighting] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_StockMin]  DEFAULT ((0)) FOR [StockMin]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_FullFill]  DEFAULT ((0)) FOR [FullFill]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentPreWeighing] ADD  CONSTRAINT [DF_BinIdentPreWeighting_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentPreWeighing]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentPreWeighting_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentPreWeighing] CHECK CONSTRAINT [FK_BinIdentPreWeighting_BinMaster]
ALTER TABLE [dbo].[BinIdentPreWeighing]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentPreWeighting_IngredientProductiuonMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientProductionMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentPreWeighing] CHECK CONSTRAINT [FK_BinIdentPreWeighting_IngredientProductiuonMaster]
