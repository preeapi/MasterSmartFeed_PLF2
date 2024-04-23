/****** Object:  Table [dbo].[BinIdentTransfer]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinIdentTransfer](
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
	[UpdateFromService] [datetime] NULL,
 CONSTRAINT [PK_BinIdentTransfer] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_IngredientCode]  DEFAULT ('Null') FOR [IngredientCode]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_ActiveFilling]  DEFAULT ((0)) FOR [ActiveFilling]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_ActiveDischarge]  DEFAULT ((0)) FOR [ActiveDischarge]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_BinUse]  DEFAULT ((0)) FOR [BinUse]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_Volume]  DEFAULT ((0)) FOR [Volume]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_HighBin]  DEFAULT ((0)) FOR [HighBin]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_BinPriority]  DEFAULT ((0)) FOR [BinPriority]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_LastFillingLot]  DEFAULT ('Null') FOR [LastFillingLot]
ALTER TABLE [dbo].[BinIdentTransfer] ADD  CONSTRAINT [DF_BinIdentTransfer_CreateAtDataSource]  DEFAULT (getdate()) FOR [CreateAt]
ALTER TABLE [dbo].[BinIdentTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentTransfer_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentTransfer] CHECK CONSTRAINT [FK_BinIdentTransfer_BinMaster]
ALTER TABLE [dbo].[BinIdentTransfer]  WITH CHECK ADD  CONSTRAINT [FK_BinIdentTransfer_IngredientRawMatMaster] FOREIGN KEY([IngredientCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON UPDATE CASCADE
ALTER TABLE [dbo].[BinIdentTransfer] CHECK CONSTRAINT [FK_BinIdentTransfer_IngredientRawMatMaster]
