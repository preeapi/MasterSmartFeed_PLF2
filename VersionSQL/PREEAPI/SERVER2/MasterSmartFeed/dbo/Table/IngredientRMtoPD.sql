/****** Object:  Table [dbo].[IngredientRMtoPD]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientRMtoPD](
	[IngredientRawMatCode] [nvarchar](50) NOT NULL,
	[IngredientProductionCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IngredientMapping] PRIMARY KEY CLUSTERED 
(
	[IngredientProductionCode] ASC,
	[IngredientRawMatCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientRMtoPD]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRMtoPD_IngredientProductionMaster] FOREIGN KEY([IngredientProductionCode])
REFERENCES [dbo].[IngredientProductionMaster] ([IngredientCode])
ON DELETE CASCADE
ALTER TABLE [dbo].[IngredientRMtoPD] CHECK CONSTRAINT [FK_IngredientRMtoPD_IngredientProductionMaster]
ALTER TABLE [dbo].[IngredientRMtoPD]  WITH CHECK ADD  CONSTRAINT [FK_IngredientRMtoPD_IngredientRawMatMaster] FOREIGN KEY([IngredientRawMatCode])
REFERENCES [dbo].[IngredientRawMatMaster] ([IngredientCode])
ON DELETE CASCADE
ALTER TABLE [dbo].[IngredientRMtoPD] CHECK CONSTRAINT [FK_IngredientRMtoPD_IngredientRawMatMaster]
