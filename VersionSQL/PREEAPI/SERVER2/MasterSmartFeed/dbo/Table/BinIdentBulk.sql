/****** Object:  Table [dbo].[BinIdentBulk]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentBulk](
	[BinIO] [int] NOT NULL,
	[BulkLocation] [nvarchar](50) NULL,
	[BulkLocNo] [nvarchar](50) NULL,
	[BinType] [nvarchar](20) NULL,
	[IngredientCode] [nvarchar](50) NULL,
	[Density] [decimal](8, 3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[ActiveFilling] [bit] NOT NULL,
	[ActiveDischarge] [bit] NOT NULL,
	[BinUse] [bit] NOT NULL,
	[Volume] [decimal](8, 2) NULL,
	[HighBin] [bit] NULL,
	[BinPriority] [tinyint] NULL,
	[FillingTime] [datetime] NULL,
	[LastTimeDischarge] [datetime] NULL,
	[LastFillingLot] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
	[UpdateFromPlantControlAt] [datetime] NULL,
 CONSTRAINT [PK_BulkIdent] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_BulkLocation]  DEFAULT ('Null') FOR [BulkLocation]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_Weight]  DEFAULT ((0)) FOR [Weight]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BulkIdent_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BulkIdent_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BulkIdent_ActiveUsing]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BinIdentBulk_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentBulk] ADD  CONSTRAINT [DF_BulkIdent_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentBulk]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentBulk_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentBulk] CHECK CONSTRAINT [FK_BinIdentBulk_BinMaster]
ALTER TABLE [dbo].[BinIdentBulk]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentBulk_IngredientRawMatMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentBulk] CHECK CONSTRAINT [FK_BinIdentBulk_IngredientRawMatMaster]
