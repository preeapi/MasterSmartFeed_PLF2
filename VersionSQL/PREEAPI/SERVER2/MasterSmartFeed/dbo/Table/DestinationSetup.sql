/****** Object:  Table [dbo].[DestinationSetup]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[DestinationSetup](
	[BinIO] [int] NOT NULL,
	[DestinationRoute] [int] NOT NULL,
	[LineCodeName] [nvarchar](20) NOT NULL,
	[DestinationRouteActive] [bit] NULL,
	[DestinationMainRoute] [bit] NULL,
 CONSTRAINT [PK_DestinationSetup] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC,
	[DestinationRoute] ASC,
	[LineCodeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[DestinationSetup] ADD  CONSTRAINT [DF_DestinationSetup_BinIO]  DEFAULT ((1)) FOR [BinIO]
ALTER TABLE [dbo].[DestinationSetup] ADD  CONSTRAINT [DF_DestinationSetup_DestinationMainRoute]  DEFAULT ((1)) FOR [DestinationMainRoute]
ALTER TABLE [dbo].[DestinationSetup]  WITH CHECK ADD  CONSTRAINT [FK_DestinationSetup_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[DestinationSetup] CHECK CONSTRAINT [FK_DestinationSetup_BinMaster]
ALTER TABLE [dbo].[DestinationSetup]  WITH CHECK ADD  CONSTRAINT [FK_DestinationSetup_LineMaster] FOREIGN KEY([LineCodeName])
REFERENCES [dbo].[LineMaster] ([LineCodeName])
ON UPDATE CASCADE
ALTER TABLE [dbo].[DestinationSetup] CHECK CONSTRAINT [FK_DestinationSetup_LineMaster]
