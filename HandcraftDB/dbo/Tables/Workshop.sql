CREATE TABLE [dbo].[Workshop] (
    [IdWorkshop]    INT NOT NULL,
    [StudentMaxQty] INT NULL,
    [IdStudio]      INT NOT NULL,
    CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED ([IdWorkshop] ASC),
    CONSTRAINT [FK_Workshop_Class] FOREIGN KEY ([IdWorkshop]) REFERENCES [dbo].[Class] ([IdClass]),
    CONSTRAINT [FK_Workshop_Studio] FOREIGN KEY ([IdStudio]) REFERENCES [dbo].[Studio] ([IdStudio])
);

