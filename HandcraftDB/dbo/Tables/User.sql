CREATE TABLE [dbo].[User] (
    [IdUser]    INT            IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (64)   NOT NULL,
    [LastName]  VARCHAR (64)   NOT NULL,
    [Email]     VARCHAR (256)  NOT NULL,
    [Phone]     VARCHAR (16)   NULL,
    [Login]     VARCHAR (32)   NOT NULL,
    [Password]  NVARCHAR(64) NOT NULL,
    [BirthDate] DATE           NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([IdUser] ASC),
    CONSTRAINT [UK_User_Email] UNIQUE NONCLUSTERED ([Email] ASC),
    CONSTRAINT [UK_User_Login] UNIQUE NONCLUSTERED ([Login] ASC),
    CONSTRAINT [UK_User_Phone] UNIQUE NONCLUSTERED ([Phone] ASC)
);

