GO
/****** Object:  Table [dbo].[LiveChat_Channels]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveChat_Channels](
	[ChannelId] [uniqueidentifier] NOT NULL,
	[RequestId] [int] NOT NULL,
	[OperatorId] [int] NOT NULL,
	[OpenDate] [smalldatetime] NOT NULL CONSTRAINT [DF_LiveChat_Channels_OpenDate]  DEFAULT (getdate()),
	[AcceptDate] [smalldatetime] NULL,
	[CloseDate] [smalldatetime] NULL,
 CONSTRAINT [PK_LiveChat_Channels] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LiveChat_ChatInvitations]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_ChatInvitations](
	[InvitationId] [int] IDENTITY(1,1) NOT NULL,
	[OperatorId] [int] NOT NULL,
	[VisitorIp] [varchar](11) NOT NULL,
	[Message] [nvarchar](350) NOT NULL,
	[WasAccept] [bit] NOT NULL CONSTRAINT [DF_LiveChat_ChatInvitations_WasAccept]  DEFAULT ((0)),
	[RequestDate] [smalldatetime] NOT NULL CONSTRAINT [DF_LiveChat_ChatInvitations_RequestDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_LiveChat_ChatInvitations] PRIMARY KEY CLUSTERED 
(
	[InvitationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_ChatRequests]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_ChatRequests](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[VisitorIp] [varchar](11) NOT NULL,
	[VisitorName] [nvarchar](100) NOT NULL,
	[VisitorEmail] [nvarchar](200) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SendCopyOfChat] [bit] NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_SendCopyOfChat]  DEFAULT ((0)),
	[RequestedDate] [smalldatetime] NOT NULL CONSTRAINT [DF_LiveChat_ChatRequests_RequestedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_LiveChat_ChatRequests] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_DepartmentOperators]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveChat_DepartmentOperators](
	[DepartmentId] [int] NOT NULL,
	[OperatorId] [int] NOT NULL,
 CONSTRAINT [PK_LiveChat_DepartmentOperators] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC,
	[OperatorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LiveChat_Departments]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveChat_Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_LiveChat_Departments_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_LiveChat_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LiveChat_Messages]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveChat_Messages](
	[MessageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ChannelId] [uniqueidentifier] NOT NULL,
	[FromName] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](2000) NOT NULL,
	[SentDate] [smalldatetime] NOT NULL CONSTRAINT [DF_LiveChat_Messages_SentDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_LiveChat_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LiveChat_Operators]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_Operators](
	[OperatorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[IsOnline] [bit] NOT NULL CONSTRAINT [DF_Table6_IsActive]  DEFAULT ((0)),
	[IsAdmin] [bit] NOT NULL CONSTRAINT [DF_LiveChat_Operators_IsAdmin]  DEFAULT ((0)),
 CONSTRAINT [PK_LiveChat_Operators] PRIMARY KEY CLUSTERED 
(
	[OperatorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiveChat_VisitorHistories]    Script Date: 01/08/2008 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiveChat_VisitorHistories](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[VisitorIp] [varchar](11) NOT NULL,
	[RequestedPage] [varchar](300) NOT NULL,
	[RequestedTime] [smalldatetime] NOT NULL CONSTRAINT [DF_LiveChat_VisitorHistories_RequestedTime]  DEFAULT (getdate()),
	[Referrer] [varchar](300) NOT NULL,
	[UserAgent] [varchar](85) NOT NULL CONSTRAINT [DF_LiveChat_VisitorHistories_UserAgent]  DEFAULT (''),
 CONSTRAINT [PK_LiveChat_VisitorHistories] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LiveChat_Channels]  WITH CHECK ADD  CONSTRAINT [FK_ChannelsChatRequests] FOREIGN KEY([RequestId])
REFERENCES [dbo].[LiveChat_ChatRequests] ([RequestId])
GO
ALTER TABLE [dbo].[LiveChat_Channels] CHECK CONSTRAINT [FK_ChannelsChatRequests]
GO
ALTER TABLE [dbo].[LiveChat_Channels]  WITH CHECK ADD  CONSTRAINT [FK_ChannelsOperators] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[LiveChat_Operators] ([OperatorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_Channels] CHECK CONSTRAINT [FK_ChannelsOperators]
GO
ALTER TABLE [dbo].[LiveChat_ChatInvitations]  WITH CHECK ADD  CONSTRAINT [FK_OperatorsInvitations] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[LiveChat_Operators] ([OperatorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_ChatInvitations] CHECK CONSTRAINT [FK_OperatorsInvitations]
GO
ALTER TABLE [dbo].[LiveChat_ChatRequests]  WITH CHECK ADD  CONSTRAINT [FK_ChatRequestsDepartments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LiveChat_Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[LiveChat_ChatRequests] CHECK CONSTRAINT [FK_ChatRequestsDepartments]
GO
ALTER TABLE [dbo].[LiveChat_DepartmentOperators]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentOperators] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[LiveChat_Operators] ([OperatorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_DepartmentOperators] CHECK CONSTRAINT [FK_DepartmentOperators]
GO
ALTER TABLE [dbo].[LiveChat_DepartmentOperators]  WITH CHECK ADD  CONSTRAINT [FK_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[LiveChat_Departments] ([DepartmentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_DepartmentOperators] CHECK CONSTRAINT [FK_Departments]
GO
ALTER TABLE [dbo].[LiveChat_Messages]  WITH CHECK ADD  CONSTRAINT [FK_MessagesChannels] FOREIGN KEY([ChannelId])
REFERENCES [dbo].[LiveChat_Channels] ([ChannelId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LiveChat_Messages] CHECK CONSTRAINT [FK_MessagesChannels]