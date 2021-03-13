CREATE VIEW [dbo].[V_Workshop_Studio]
	AS 
SELECT
    w.IdWorkshop,
    s.StudioName,
    s.Picture,
    s.Number,
    s.Street,
    s.City,
    s.Country
FROM [Workshop] AS w JOIN
[Studio] AS s ON w.IdStudio = s.IdStudio 
