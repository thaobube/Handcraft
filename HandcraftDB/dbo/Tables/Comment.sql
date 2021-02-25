CREATE TABLE [dbo].[Comment] (
    [IdComment]   INT   IDENTITY (1, 1) NOT NULL,
    [IdUser]      INT           NOT NULL,
    [IdClass]     INT           NOT NULL,
    [Content]     VARCHAR (MAX) NOT NULL,
    [CommentDate] DATE          NOT NULL,
    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([IdComment] ASC),
    CONSTRAINT [FK_Comment_Class] FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class] ([IdClass]),
    CONSTRAINT [FK_Comment_User] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser])
);

