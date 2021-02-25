CREATE TABLE [dbo].[OnlineClass] (
    [IdOnlineClass]   INT NOT NULL,
    [FullDescription] VARCHAR (MAX) NOT NULL,
    [FullVideoURL]    VARCHAR (256) NOT NULL,
    [FullPicture]     VARCHAR (256) NOT NULL,
    CONSTRAINT [PK_OnlineClass] PRIMARY KEY CLUSTERED ([IdOnlineClass] ASC),
    CONSTRAINT [FK_OnlineClass_Class] FOREIGN KEY ([IdOnlineClass]) REFERENCES [dbo].[Class] ([IdClass])
);

