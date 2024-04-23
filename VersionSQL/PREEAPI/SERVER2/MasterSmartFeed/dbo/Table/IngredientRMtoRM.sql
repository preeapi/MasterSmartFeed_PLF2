/****** Object:  Table [dbo].[IngredientRMtoRM]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientRMtoRM](
	[IngredientRawMatCode] [nvarchar](50) NOT NULL,
	[SameIngredientRawMatCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IngredientRMtoRM] PRIMARY KEY CLUSTERED 
(
	[IngredientRawMatCode] ASC,
	[SameIngredientRawMatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientRMtoRM]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRMtoRM_IngredientRawMatMaster] FOREIGN KEY([IngredientRawMatCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON DELETE CASCADE
ALTER TABLE [dbo].[IngredientRMtoRM] CHECK CONSTRAINT [FK_IngredientRMtoRM_IngredientRawMatMaster]
