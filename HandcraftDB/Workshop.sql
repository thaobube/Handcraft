CREATE TABLE [dbo].[Workshop]
(
	[IdWorkshop] INT NOT NULL IDENTITY,
	[StudentMaxQty] INT NOT NULL,
	[IdStudio] INT NOT NULL,

	CONSTRAINT PK_Workshop PRIMARY KEY CLUSTERED  ([IdWorkshop] ASC),	
	CONSTRAINT FK_Workshop_Studio FOREIGN KEY ([IdStudio]) REFERENCES [dbo].[Studio]([idStudio]),
	CONSTRAINT FK_Workshop_Class FOREIGN KEY([IdWorkshop]) REFERENCES [dbo].[Class]([idClass]),
)
