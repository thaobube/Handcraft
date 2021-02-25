CREATE TABLE [dbo].[CalendarWorkshop] (
    [IdCalendar] INT NOT NULL,
    [IdWorkshop] INT NOT NULL,
    CONSTRAINT [PK_CalendarWorkshop] PRIMARY KEY CLUSTERED ([IdCalendar] ASC, [IdWorkshop] ASC),
    CONSTRAINT [FK_CalendarWorkshop_Calendar] FOREIGN KEY ([IdCalendar]) REFERENCES [dbo].[Calendar] ([IdCalendar]),
    CONSTRAINT [FK_CalendarWorkshop_Workshop] FOREIGN KEY ([IdWorkshop]) REFERENCES [dbo].[Workshop] ([IdWorkshop])
);

