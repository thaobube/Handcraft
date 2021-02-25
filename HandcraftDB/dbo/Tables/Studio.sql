CREATE TABLE [dbo].[Studio] (
    [IdStudio]    INT           IDENTITY (1, 1) NOT NULL,
    [StudioName]  VARCHAR (256) NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    [Picture]     VARCHAR (256) NOT NULL,
    [Number]      VARCHAR (8)   NOT NULL,
    [Street]      VARCHAR (128) NOT NULL,
    [City]        VARCHAR (32)  NOT NULL,
    [Country]     VARCHAR (32)  NOT NULL,
    CONSTRAINT [PK_Studio] PRIMARY KEY CLUSTERED ([IdStudio] ASC)
);

