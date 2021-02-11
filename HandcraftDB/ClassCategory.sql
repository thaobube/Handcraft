CREATE TABLE [dbo].[ClassCategory]
(
	[IdClass] INT NOT NULL,
	[IdCategory] INT NOT NULL,

	CONSTRAINT PK_ClassCategory PRIMARY KEY CLUSTERED([IdClass] ASC, [idCategory] ASC),
	CONSTRAINT FK_ClassCategory_Class FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class]([idClass]),
	CONSTRAINT FK_ClassCategory_Category FOREIGN KEY ([IdCategory]) REFERENCES [dbo].[Category]([idCategory]),
)
