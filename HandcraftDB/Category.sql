﻿CREATE TABLE [dbo].[Category]
(
	[IdCategory] INT NOT NULL IDENTITY,
	[Name] VARCHAR(64) NOT NULL,

	CONSTRAINT PK_Category PRIMARY KEY CLUSTERED ([IdCategory] ASC),	
)