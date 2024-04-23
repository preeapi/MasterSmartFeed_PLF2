/****** Object:  Table [dbo].[IngredientRawMatMaster]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientRawMatMaster](
	[IngredientCode] [nvarchar](50) NOT NULL,
	[IngredientName] [nvarchar](250) NULL,
	[Density] [decimal](8, 2) NULL,
	[Recirculate] [bit] NULL,
	[ProductGroup] [nvarchar](50) NULL,
	[ProductGroupName] [nvarchar](250) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[SameIngredientRawMat] [nvarchar](250) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_IngredientMaster] PRIMARY KEY CLUSTERED 
(
	[IngredientCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_IngredientName]  DEFAULT ('Null') FOR [IngredientName]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_Density]  DEFAULT ((0)) FOR [Density]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_Recirculate]  DEFAULT ((0)) FOR [Recirculate]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_ProductGroup]  DEFAULT ('Null') FOR [ProductGroup]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_ProductGroupName]  DEFAULT ('Null') FOR [ProductGroupName]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_ProductCode]  DEFAULT ('Null') FOR [ProductCode]
ALTER TABLE [dbo].[IngredientRawMatMaster] ADD  CONSTRAINT [DF_IngredientRawMatMaster_SameIngredientRawMat]  DEFAULT ('Null') FOR [SameIngredientRawMat]
