/****** Object:  Table [dbo].[LineActiveInterrupt]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[LineActiveInterrupt](
	[LineCodeName] [nvarchar](20) NULL,
	[SourceLineCodeName] [nvarchar](20) NULL,
	[LineInterrupt] [nvarchar](20) NULL
) ON [PRIMARY]

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'เพื่อตรวจสอบว่าไลน์นี้ทำงานอยู่หรือไม่ หาก LineInterrupt มีการทำงาน จะส่งผลให้ LineCodeName ที่จะใช้ SourceLineCodeName ไม่สามารถทำงานได้' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LineActiveInterrupt', @level2type=N'COLUMN',@level2name=N'LineInterrupt'
