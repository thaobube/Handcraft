CREATE VIEW [dbo].[V_FullClass]
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
    cp.ThumbnailDetail1,
    cp.ThumbnailDetail2,
    cp.ThumbnailDetail3
FROM [Class] AS c JOIN
[ClassPicture] AS cp ON c.IdClass = cp.IdClass JOIN
[V_FullTutor] AS vt ON vt.IdTutor = c.IdTutor JOIN
[V_FullCoordinator] AS vc ON vc.IdCoordinator = c.IdCoordinator 

