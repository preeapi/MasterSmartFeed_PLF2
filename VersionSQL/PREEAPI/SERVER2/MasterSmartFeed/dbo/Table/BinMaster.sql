/****** Object:  Table [dbo].[BinMaster]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[BinMaster](
	[BinIO] [int] NOT NULL,
	[BinName] [nvarchar](50) NOT NULL,
	[BinType] [nvarchar](20) NOT NULL,
	[ScaleIndex] [nvarchar](20) NOT NULL,
	[UpperVolume] [decimal](8, 2) NOT NULL,
	[HopperVolume] [decimal](8, 2) NOT NULL,
	[TotalVolume]  AS ([UpperVolume]+[HopperVolume]),
	[KHopperVolume] [decimal](8, 2) NOT NULL,
	[UpperHeight] [decimal](8, 2) NOT NULL,
	[HopperHeight] [decimal](8, 2) NOT NULL,
	[TotalHeight]  AS ([UpperHeight]+[HopperHeight]),
	[Width] [decimal](8, 2) NOT NULL,
	[Length] [decimal](8, 2) NOT NULL,
	[Diameter] [decimal](8, 2) NOT NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_BinMaster] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_BinName]  DEFAULT ('Null') FOR [BinName]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_BinType]  DEFAULT ('Null') FOR [BinType]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_ScaleIndex]  DEFAULT ('Null') FOR [ScaleIndex]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_UpperVolume]  DEFAULT ((0)) FOR [UpperVolume]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_HopperVolume]  DEFAULT ((0)) FOR [HopperVolume]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_KHopperVolume]  DEFAULT ((0)) FOR [KHopperVolume]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_UpperHeight]  DEFAULT ((0)) FOR [UpperHeight]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_HopperHeight]  DEFAULT ((0)) FOR [HopperHeight]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_Width]  DEFAULT ((0)) FOR [Width]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_Length]  DEFAULT ((0)) FOR [Length]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_Diameter]  DEFAULT ((0)) FOR [Diameter]
ALTER TABLE [dbo].[BinMaster] ADD  CONSTRAINT [DF_BinMaster_create_at]  DEFAULT (getdate()) FOR [CreateAt]
