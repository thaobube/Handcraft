CREATE TABLE [dbo].[Category] (
    [IdCategory] INT          IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (64) NOT NULL,
    [Link]       VARCHAR (64) NOT NULL,
    [Picture]       VARCHAR (256) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([IdCategory] ASC)
);

