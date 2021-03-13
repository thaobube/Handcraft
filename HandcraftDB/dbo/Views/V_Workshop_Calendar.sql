CREATE VIEW [dbo].[V_Workshop_Calendar]
	AS 
SELECT
    w.IdWorkshop,
    c.IdCalendar,
    c.[Date],
    c.TimeStart,
    c.TimeEnd 
FROM [Workshop] AS w JOIN
[CalendarWorkshop] AS cw ON w.IdWorkshop = cw.IdWorkshop JOIN
[Calendar] AS c ON c.IdCalendar= cw.IdCalendar  
