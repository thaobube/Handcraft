CREATE TABLE [dbo].[Cancel] (
    [IdCancel]   INT  NOT NULL,
    [IdUser]     INT  NOT NULL,
    [IdClass]    INT  NOT NULL,
    [CancelDate] DATE NOT NULL,
    CONSTRAINT [PK_Cancel] PRIMARY KEY CLUSTERED ([IdCancel] ASC),
    CONSTRAINT [FK_Cancel_Class] FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class] ([IdClass]),
    CONSTRAINT [FK_Cancel_User] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser])
);

