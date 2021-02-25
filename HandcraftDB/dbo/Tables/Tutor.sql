CREATE TABLE [dbo].[Tutor] (
    [IdTutor]     INT  NOT NULL,
    [Description] VARCHAR (MAX) NOT NULL,
    [BankAccount] VARCHAR (32)  NOT NULL,
    [TVANumber]   VARCHAR (16)  NULL,
    [Picture]     VARCHAR (256) NOT NULL,
    CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED ([IdTutor] ASC),
    CONSTRAINT [FK_Tutor_User] FOREIGN KEY ([IdTutor]) REFERENCES [dbo].[User] ([IdUser])
);

