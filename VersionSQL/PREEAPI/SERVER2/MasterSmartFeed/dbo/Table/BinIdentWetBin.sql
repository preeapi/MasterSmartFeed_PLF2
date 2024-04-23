/****** Object:  Table [dbo].[BinIdentWetBin]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentWetBin](
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
 CONSTRAINT [PK_BinIdentWetBin_1] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_BinType]  DEFAULT ('Null') FOR [BinType]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_Weight]  DEFAULT ((0)) FOR [Weight]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_MinMoisture]  DEFAULT ((0)) FOR [MinMoisture]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_MaxMoisture]  DEFAULT ((0)) FOR [MaxMoisture]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentWetBin] ADD  CONSTRAINT [DF_BinIdentWetBin_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentWetBin]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentWetBin_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentWetBin] CHECK CONSTRAINT [FK_BinIdentWetBin_BinMaster]
ALTER TABLE [dbo].[BinIdentWetBin]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentWetBin_IngredientRawMatMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentWetBin] CHECK CONSTRAINT [FK_BinIdentWetBin_IngredientRawMatMaster]
