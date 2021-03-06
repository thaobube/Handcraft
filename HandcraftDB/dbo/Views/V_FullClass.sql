﻿CREATE VIEW [dbo].[V_FullClass]
	AS 
SELECT
    c.IdClass,
    c.ClassName,
    c.[Description],
    c.TrailerURL,
    c.Price,
    c.Duration,
    c.[State],
    vt.FirstName AS FirstNameTutor,
    vt.LastName AS LastNameTutor,
    vc.FirstName AS FirstNameCoordinator,
    vc.LastName AS LastNameCoordinator,
    cp.ThumbnailFront,
    cp.ThumbnailBack,
    vws.StudioName,
    vws.Number,
    vws.Street,
    vws.City,
    vws.Country,
    vwc.[Date],
    vwc.TimeStart,
    vwc.TimeEnd,
    vcc.CategoryName
FROM [Class] AS c JOIN
[ClassPicture] AS cp ON c.IdClass = cp.IdClass JOIN
[V_FullTutor] AS vt ON vt.IdTutor = c.IdTutor JOIN
[V_FullCoordinator] AS vc ON vc.IdCoordinator = c.IdCoordinator JOIN
[V_Workshop_Studio] AS vws ON vws.IdWorkshop = c.IdClass JOIN
[V_Workshop_Calendar] AS vwc ON vwc.IdWorkshop = c.IdClass JOIN
[V_Class_Category] AS vcc ON vcc.IdClass = c.IdClass


