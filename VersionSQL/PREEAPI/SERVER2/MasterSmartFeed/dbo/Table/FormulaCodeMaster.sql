/****** Object:  Table [dbo].[FormulaCodeMaster]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[FormulaCodeMaster](
	[FormulaCode] [nvarchar](50) NOT NULL,
	[FormulaName] [nvarchar](250) NOT NULL,
	[FormulaDate] [nvarchar](10) NULL,
	[DensityPellet] [decimal](8, 3) NULL,
	[DensityMash] [decimal](8, 3) NULL,
	[DensityCrumbler] [decimal](8, 3) NULL,
	[DensityExpanded] [decimal](8, 3) NULL,
	[FeedGroup] [nvarchar](250) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_FormulaCodeMaster] PRIMARY KEY CLUSTERED 
(
	[FormulaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_FormulaName]  DEFAULT ('Null') FOR [FormulaName]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_FormulaDate]  DEFAULT ('Null') FOR [FormulaDate]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_DensityPellet]  DEFAULT ((0)) FOR [DensityPellet]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_DensityMash]  DEFAULT ((0)) FOR [DensityMash]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_DensityCrumbler]  DEFAULT ((0)) FOR [DensityCrumbler]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_DensityExpanded]  DEFAULT ((0)) FOR [DensityExpanded]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_FeedGroup]  DEFAULT ('Null') FOR [FeedGroup]
ALTER TABLE [dbo].[FormulaCodeMaster] ADD  CONSTRAINT [DF_FormulaCodeMaster_CreateAt]  DEFAULT (getdate()) FOR [CreateAt]
