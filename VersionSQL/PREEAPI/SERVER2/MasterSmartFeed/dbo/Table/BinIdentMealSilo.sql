/****** Object:  Table [dbo].[BinIdentMealSilo]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentMealSilo](
	[BinIO] [int] NOT NULL,
	[BinType] [nvarchar](20) NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[Density] [decimal](8, 3) NULL,
	[Weight]  AS ([Density]*[Volume]),
	[ActiveFilling] [bit] NULL,
	[ActiveDischarge] [bit] NULL,
	[BinUse] [bit] NULL,
	[Volume] [decimal](8, 2) NULL,
	[HighBin] [bit] NULL,
	[BinPriority] [tinyint] NULL,
	[FillingTime] [datetime] NULL,
	[LastTimeDischarge] [datetime] NULL,
	[LastFillingLot] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_BinIdentMealSilo] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentMealSilo] ADD  CONSTRAINT [DF_BinIdentMealSilo_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentMealSilo]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentMealSilo_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentMealSilo] CHECK CONSTRAINT [FK_BinIdentMealSilo_BinMaster]
ALTER TABLE [dbo].[BinIdentMealSilo]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentMealSilo_IngredientRawMatMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentMealSilo] CHECK CONSTRAINT [FK_BinIdentMealSilo_IngredientRawMatMaster]
