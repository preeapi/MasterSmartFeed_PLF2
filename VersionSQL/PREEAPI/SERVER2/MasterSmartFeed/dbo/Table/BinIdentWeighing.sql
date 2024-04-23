/****** Object:  Table [dbo].[BinIdentWeighing]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentWeighing](
	[BinIO] [int] NOT NULL,
	[ScaleIndex] [nvarchar](10) NULL,
	[BinType] [nvarchar](20) NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[Density] [decimal](8, 3) NULL,
	[Volume] [decimal](8, 2) NULL,
	[Weight]  AS ([Density]*[Volume]),
	[ActiveFilling] [bit] NOT NULL,
	[ActiveDischarge] [bit] NOT NULL,
	[BinUse] [bit] NOT NULL,
	[StockMin] [decimal](8, 2) NULL,
	[HighBin] [bit] NULL,
	[BinPriority] [tinyint] NULL,
	[FillingTime] [datetime] NULL,
	[LastTimeDischarge] [datetime] NULL,
	[LastFillingLot] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_BinIdentWeighing] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_ScaleIndex]  DEFAULT ('NULL') FOR [ScaleIndex]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_IngredientCode]  DEFAULT ('NULL') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_StockMin]  DEFAULT ((0)) FOR [StockMin]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_LastFillingLot]  DEFAULT ('NULL') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentWeighing] ADD  CONSTRAINT [DF_BinIdentWeighing_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentWeighing]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentWeighing_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentWeighing] CHECK CONSTRAINT [FK_BinIdentWeighing_BinMaster]
ALTER TABLE [dbo].[BinIdentWeighing]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentWeighing_IngredientProductionMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientProductionMaster] ([IngredientCode])
ALTER TABLE [dbo].[BinIdentWeighing] CHECK CONSTRAINT [FK_BinIdentWeighing_IngredientProductionMaster]
