CREATE TABLE [dbo].[ClassPicture]
(
	[IdClass]       INT NOT NULL,
    [ThumbnailFront]    VARCHAR (256) NOT NULL,
    [ThumbnailBack]    VARCHAR (256) NOT NULL,
    [ThumbnailDetail1]    VARCHAR (256) NOT NULL,
    [ThumbnailDetail2]    VARCHAR (256) NOT NULL,
    [ThumbnailDetail3]    VARCHAR (256) NOT NULL
    CONSTRAINT [PK_ClassPicture] PRIMARY KEY CLUSTERED ([IdClass] ASC),
    CONSTRAINT [FK_ClassPicture_Class] FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class] ([IdClass])
)
