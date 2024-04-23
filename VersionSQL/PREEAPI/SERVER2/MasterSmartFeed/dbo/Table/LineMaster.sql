/****** Object:  Table [dbo].[LineMaster]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[LineMaster](
	[LineCodeName] [nvarchar](20) NOT NULL,
	[LineName] [nvarchar](100) NULL,
	[Detail] [nvarchar](250) NULL,
	[TotalKw] [decimal](8, 2) NULL,
	[CapacityTonPerHour] [decimal](8, 2) NULL,
 CONSTRAINT [PK_LinePerfomance] PRIMARY KEY CLUSTERED 
(
	[LineCodeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[LineMaster] ADD  CONSTRAINT [DF_LineMaster_LineName]  DEFAULT ('Set') FOR [LineName]
ALTER TABLE [dbo].[LineMaster] ADD  CONSTRAINT [DF_LineMaster_Detail]  DEFAULT ('Set') FOR [Detail]
ALTER TABLE [dbo].[LineMaster] ADD  CONSTRAINT [DF_LineMaster_TotalKw]  DEFAULT ((0)) FOR [TotalKw]
ALTER TABLE [dbo].[LineMaster] ADD  CONSTRAINT [DF_LineMaster_CapacityTonPerHour]  DEFAULT ((0)) FOR [CapacityTonPerHour]
