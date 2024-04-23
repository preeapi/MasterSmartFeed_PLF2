/****** Object:  Table [dbo].[TranferData]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[TranferData](
	[id] [int] NOT NULL,
	[StateTrigger] [bit] NULL,
	[StateAPI] [bit] NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_TranferData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 =ใช้งานได้  , 1= ใช' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TranferData', @level2type=N'COLUMN',@level2name=N'StateTrigger'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[UpdateBinIdentFromMasterPlantControlToMasterSmartFeed]
   ON  [MasterSmartFeed].[dbo].[TranferData]
   AFTER UPDATE
AS 
BEGIN
	DECLARE @StateTrigger BIT = (SELECT [StateTrigger] FROM inserted)
	DECLARE @StateAPI BIT = (SELECT [StateAPI] FROM inserted) ; 

	--เมื่อไบร์ท จะอัพเดทข้อมูลใน MasterPlantControl ไม่ว่าจะเป็นกรณีใดก็ตาม จะทำการเซ็ต [StateTrigger], [StateAPI] เป็น 1 
	--และเมื่ออัพเดทข้อมูลใน MasterPlantControl เสร็จเรียบร้อยแล้ว จะทำการอัพเดท [StateAPI] ให้เป็น 0

	IF (@StateTrigger = 1 AND @StateAPI = 0)
		BEGIN
			BEGIN TRANSACTION 
				BEGIN TRY
					-- อัพเดทข้อมูลใน MasterSmartFeed หลังจากที่ ไบร์ท อัพเดทข้อมูลใน MasterPlantControl เรียบร้อยแล้ว
					EXEC [dbo].[UpdateALLBinIdentData]
					EXEC [dbo].[UpdateALLJobData]


					-- เมื่ออัพเดทข้อมูลใน MasterSmartFeed เสร็จเรียบบร้อยแล้ว จะทำการอัพเดท [StateTrigger] ให้เป็น 0 
					UPDATE [MasterSmartFeed].[dbo].[TranferData]
					SET [StateTrigger] = 0

					COMMIT
				END TRY

				BEGIN CATCH
					ROLLBACK
				END CATCH
		END
END
ALTER TABLE [dbo].[TranferData] ENABLE TRIGGER [UpdateBinIdentFromMasterPlantControlToMasterSmartFeed]
