/****** Object:  Table [dbo].[IngredientPDtoPD]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[IngredientPDtoPD](
	[IngredientProductionCode] [nvarchar](50) NOT NULL,
	[SameIngredientProductionCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_IngredientPDtoPD_1] PRIMARY KEY CLUSTERED 
(
	[IngredientProductionCode] ASC,
	[SameIngredientProductionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[IngredientPDtoPD]  WITH CHECK ADD  CONSTRAINT [FK_IngredientPDtoPD_IngredientProductionMaster] FOREIGN KEY([IngredientProductionCode])
REFERENCES [dbo].[IngredientProductionMaster] ([IngredientCode])
ON DELETE CASCADE
ALTER TABLE [dbo].[IngredientPDtoPD] CHECK CONSTRAINT [FK_IngredientPDtoPD_IngredientProductionMaster]
