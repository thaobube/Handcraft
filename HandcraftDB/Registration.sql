CREATE TABLE [dbo].[Registration]
(
	[IdRegistration] INT NOT NULL,
	[IdUser] INT NOT NULL,
	[IdClass] INT NOT NULL,
	[RegistrationDate] DATE NOT NULL,

	CONSTRAINT PK_Registration PRIMARY KEY CLUSTERED ([IdRegistration] ASC),
	CONSTRAINT FK_Registration_User FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User]([idUser]),
	CONSTRAINT FK_Registration_Class FOREIGN KEY ([IdClass]) REFERENCES [dbo].[Class]([idClass]),
)
