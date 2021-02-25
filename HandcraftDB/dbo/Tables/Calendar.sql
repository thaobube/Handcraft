CREATE TABLE [dbo].[Calendar] (
    [IdCalendar] INT          IDENTITY (1, 1) NOT NULL,
    [Weekday]    VARCHAR (16) NOT NULL,
    [Date]       DATE         NOT NULL,
    [TimeStart]  VARCHAR (16) NOT NULL,
    [TimeEnd]    VARCHAR (16) NOT NULL,
    CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED ([IdCalendar] ASC)
);

