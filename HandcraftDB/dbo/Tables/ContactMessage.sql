CREATE TABLE [dbo].[ContactMessage]
(
	[IdContactMessage] INT IDENTITY (1, 1) NOT NULL,
	[Name]     NVARCHAR (50)  NOT NULL,
	[Email]     NVARCHAR (256)  NOT NULL,
	[Subject]     NVARCHAR (256)  NOT NULL,
	[MessageContent]     NVARCHAR (MAX)  NOT NULL,
	[SendDate] DATETIME NOT NULL,
	CONSTRAINT [PK_ContactMessage] PRIMARY KEY CLUSTERED ([IdContactMessage] ASC)
)
