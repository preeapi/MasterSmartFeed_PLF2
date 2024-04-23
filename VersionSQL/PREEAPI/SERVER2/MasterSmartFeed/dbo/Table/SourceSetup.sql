/****** Object:  Table [dbo].[SourceSetup]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[SourceSetup](
	[BinIO] [int] NOT NULL,
	[SourceRoute] [int] NOT NULL,
	[LineCodeName] [nvarchar](20) NOT NULL,
	[SourceRouteActive] [bit] NULL,
	[SourceMainRoute] [bit] NULL,
 CONSTRAINT [PK_SourceSetup] PRIMARY KEY CLUSTERED 
(
	[BinIO] ASC,
	[SourceRoute] ASC,
	[LineCodeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[SourceSetup]  WITH CHECK ADD  CONSTRAINT [FK_SourceSetup_BinMaster] FOREIGN KEY([BinIO])
REFERENCES [dbo].[BinMaster] ([BinIO])
ALTER TABLE [dbo].[SourceSetup] CHECK CONSTRAINT [FK_SourceSetup_BinMaster]
ALTER TABLE [dbo].[SourceSetup]  WITH CHECK ADD  CONSTRAINT [FK_SourceSetup_LineMaster] FOREIGN KEY([LineCodeName])
REFERENCES [dbo].[LineMaster] ([LineCodeName])
ALTER TABLE [dbo].[SourceSetup] CHECK CONSTRAINT [FK_SourceSetup_LineMaster]
