CREATE TABLE [dbo].[Rating]
(
	[IdUser] INT NOT NULL,
	[IdClass] INT NOT NULL,
	[Score] INT NOT NULL,
	[RatingDate] DATE NOT NULL,

	CONSTRAINT PK_Rating PRIMARY KEY CLUSTERED ([IdUser] ASC, [idClass] ASC),
	CONSTRAINT FK_Rating_User FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User]([idUser]),
	CONSTRAINT FK_Rating_Class FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class]([idClass]),
)
