CREATE TABLE [dbo].[Coordinator] (
    [IdCoordinator] INT NOT NULL,
    [PromotedDate]  DATE NULL,
    CONSTRAINT [PK_Coordinator] PRIMARY KEY CLUSTERED ([IdCoordinator] ASC),
    CONSTRAINT [FK_Coordinator_User] FOREIGN KEY ([IdCoordinator]) REFERENCES [dbo].[User] ([IdUser])
);

