/****** Object:  Table [dbo].[BinIdentDryBin]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentDryBin](
	[BinIO] [int] NOT NULL,
	[BinType] [nvarchar](20) NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[Density] [decimal](8, 3) NULL,
	[Weight] [real] NULL,
	[ActiveFilling] [bit] NOT NULL,
	[ActiveDischarge] [bit] NOT NULL,
	[BinUse] [bit] NOT NULL,
	[Volume] [decimal](8, 2) NULL,
	[HighBin] [bit] NULL,
	[BinPriority] [tinyint] NULL,
	[MinMoisture] [decimal](5, 2) NULL,
	[MaxMoisture] [decimal](5, 2) NULL,
	[FillingTime] [datetime] NULL,
	[LastTimeDischarge] [datetime] NULL,
	[LastFillingLot] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_BinIdentDryBin_1] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_Weight]  DEFAULT ((0)) FOR [Weight]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_MinMoisture]  DEFAULT ((0)) FOR [MinMoisture]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_MaxMoisture]  DEFAULT ((0)) FOR [MaxMoisture]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentDryBin] ADD  CONSTRAINT [DF_BinIdentDryBin_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentDryBin]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentDryBin_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentDryBin] CHECK CONSTRAINT [FK_BinIdentDryBin_BinMaster]
ALTER TABLE [dbo].[BinIdentDryBin]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentDryBin_IngredientRawMatMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentDryBin] CHECK CONSTRAINT [FK_BinIdentDryBin_IngredientRawMatMaster]
