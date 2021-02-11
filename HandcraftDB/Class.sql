CREATE TABLE [dbo].[Class]
(
	[IdClass] INT NOT NULL IDENTITY,
	[ClassName] VARCHAR(64) NOT NULL,
	[Description] VARCHAR(MAX) NOT NULL,
	[TrailerURL] VARCHAR(256) NOT NULL,
	[Price] MONEY NOT NULL,
	[Duration] INT NOT NULL,
	[Picture] VARCHAR(256) NOT NULL,
	[State] VARCHAR(32) NOT NULL,
	[IdTutor] INT NOT NULL,
	[IdCoordinator] INT NOT NULL,

	CONSTRAINT PK_Class PRIMARY KEY CLUSTERED ([IdClass] ASC),
	CONSTRAINT FK_Class_Tutor FOREIGN KEY ([IdTutor]) REFERENCES [dbo].[Tutor]([idTutor]),
	CONSTRAINT FK_Class_Coordinator FOREIGN KEY ([IdCoordinator]) REFERENCES [dbo].[Coordinator]([idCoordinator]),
)
