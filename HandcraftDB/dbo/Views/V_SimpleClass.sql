CREATE VIEW [dbo].[V_SimpleClass]
	AS 
SELECT
    c.IdClass,
    c.ClassName,
    c.Price,
    vwc.[Date],
    cp.ThumbnailFront,
    cp.ThumbnailBack,
    vcc.CategoryName
FROM [Class] AS c JOIN
[ClassPicture] AS cp ON c.IdClass = cp.IdClass JOIN
[V_Workshop_Calendar] AS vwc ON vwc.IdWorkshop = c.IdClass JOIN
[V_Class_Category] AS vcc ON vcc.IdClass = c.IdClass



