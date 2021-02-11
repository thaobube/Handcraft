CREATE TABLE [dbo].[Student]
(
	[IdStudent] INT NOT NULL IDENTITY,
	[MemberDate] DATE NOT NULL,
	
	CONSTRAINT PK_Student PRIMARY KEY CLUSTERED ([IdStudent] ASC),	
	CONSTRAINT FK_Student_User FOREIGN KEY ([IdStudent]) REFERENCES [dbo].[User]([IdUser]),
)
