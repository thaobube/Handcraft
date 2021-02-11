CREATE TABLE [dbo].[Admin]
(
	[IdAdmin] INT NOT NULL IDENTITY,
	[PromotedDate] DATE,
	
	CONSTRAINT PK_Admin PRIMARY KEY CLUSTERED ([IdAdmin] ASC),	
	CONSTRAINT FK_Admin_User FOREIGN KEY ([IdAdmin]) REFERENCES [dbo].[User]([IdUser]),
)
