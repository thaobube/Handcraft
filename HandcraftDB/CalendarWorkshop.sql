CREATE TABLE [dbo].[CalendarWorkshop]
(
	[IdCalendar] INT NOT NULL,
	[IdWorkshop] INT NOT NULL,

	CONSTRAINT PK_CalendarWorkshop PRIMARY KEY CLUSTERED ([IdCalendar] ASC, [idWorkshop] ASC),
	CONSTRAINT FK_CalendarWorkshop_Calendar FOREIGN KEY ([IdCalendar]) REFERENCES [dbo].[Calendar]([idCalendar]),
	CONSTRAINT FK_CalendarWorkshop_Workshop FOREIGN KEY ([IdWorkshop]) REFERENCES [dbo].[Workshop]([idWorkshop]),

)
