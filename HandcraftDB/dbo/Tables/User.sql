CREATE TABLE [dbo].[User] (
    [IdUser]    INT            IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (64)   NOT NULL,
    [LastName]  VARCHAR (64)   NOT NULL,
    [Email]     VARCHAR (256)  NOT NULL,
    [Phone]     VARCHAR (16)   NULL,
    [Login]     NVARCHAR (50)  NULL,
    [Password]  NVARCHAR (600) NULL,
    [Salt]      NVARCHAR (250) NULL,
    [Picture]   VARCHAR (256) NULL,
    [BirthDate] DATE           NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([IdUser] ASC),
    CONSTRAINT [UK_User_Email] UNIQUE NONCLUSTERED ([Email] ASC),
    CONSTRAINT [UK_User_Login] UNIQUE NONCLUSTERED ([Login] ASC)
);

