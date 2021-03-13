CREATE TABLE [dbo].[Class] (
    [IdClass]       INT           IDENTITY (1, 1) NOT NULL,
    [ClassName]     VARCHAR (64)  NOT NULL,
    [Description]   VARCHAR (MAX) NOT NULL,
    [TrailerURL]    VARCHAR (256) NULL,
    [Price]         MONEY         NOT NULL,
    [Duration]      INT           NOT NULL,
    [State]         VARCHAR (32)  NULL,
    [IdTutor]       INT           NOT NULL,
    [IdCoordinator] INT           NOT NULL,
    CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED ([IdClass] ASC),
    CONSTRAINT [FK_Class_Coordinator] FOREIGN KEY ([IdCoordinator]) REFERENCES [dbo].[Coordinator] ([IdCoordinator]),
    CONSTRAINT [FK_Class_Tutor] FOREIGN KEY ([IdTutor]) REFERENCES [dbo].[Tutor] ([IdTutor])
);

