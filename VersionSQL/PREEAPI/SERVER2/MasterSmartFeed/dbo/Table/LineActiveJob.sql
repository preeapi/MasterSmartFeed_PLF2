/****** Object:  Table [dbo].[LineActiveJob]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[LineActiveJob](
	[LineCodeName] [nvarchar](20) NOT NULL,
	[LineReadyStatus] [bit] NOT NULL,
	[MachineActiveStatus] [bit] NULL,
	[JobModeStatus] [bit] NULL,
	[SafetyModeStatus] [bit] NOT NULL,
	[Source] [int] NULL,
	[SourceRoute] [int] NULL,
	[MiddleRoute] [int] NULL,
	[Destination] [int] NULL,
	[DestinationRoute] [int] NULL,
	[JobID] [nvarchar](50) NULL,
	[JobStartTime] [datetime] NULL,
	[UpdateFromPLC] [datetime] NULL,
 CONSTRAINT [PK_LineActiveJob] PRIMARY KEY CLUSTERED 
(
	[LineCodeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_LineReadyStatus]  DEFAULT ((0)) FOR [LineReadyStatus]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_MachineActiveStatus]  DEFAULT ((0)) FOR [MachineActiveStatus]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_JobModeStatus]  DEFAULT ((0)) FOR [JobModeStatus]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_SafetyModeStatus]  DEFAULT ((0)) FOR [SafetyModeStatus]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_Source]  DEFAULT ((0)) FOR [Source]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_SourceRoute]  DEFAULT ((0)) FOR [SourceRoute]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_MiddleRoute]  DEFAULT ((0)) FOR [MiddleRoute]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_Destination]  DEFAULT ((0)) FOR [Destination]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_DestinationRoute]  DEFAULT ((0)) FOR [DestinationRoute]
ALTER TABLE [dbo].[LineActiveJob] ADD  CONSTRAINT [DF_LineActiveJob_JobID]  DEFAULT (N'-') FOR [JobID]
ALTER TABLE [dbo].[LineActiveJob]  WITH CHECK ADD  CONSTRAINT [FK_LineActiveJob_LineMaster] FOREIGN KEY([LineCodeName])
REFERENCES [dbo].[LineMaster] ([LineCodeName])
ON UPDATE CASCADE
ALTER TABLE [dbo].[LineActiveJob] CHECK CONSTRAINT [FK_LineActiveJob_LineMaster]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 ไม่พร้อม หรือ Error , 1 พร้อม ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LineActiveJob', @level2type=N'COLUMN',@level2name=N'LineReadyStatus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Job&MachineActive (0 = not active, 1 Active) ทำงานเมื่อมี ต้นทาง ปลายทางแล้ว' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LineActiveJob', @level2type=N'COLUMN',@level2name=N'MachineActiveStatus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'JobModeAuto (0 Manual , 1 Auto)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LineActiveJob', @level2type=N'COLUMN',@level2name=N'JobModeStatus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Emergency (0 ไม่มี Alarm, 1 มี Alarm (Emergency))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LineActiveJob', @level2type=N'COLUMN',@level2name=N'SafetyModeStatus'
