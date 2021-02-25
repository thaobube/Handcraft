CREATE VIEW [dbo].[V_FullCoordinator]
	AS 
SELECT 
    c.IdCoordinator,
    u.FirstName,
    u.LastName,
    u.Email,
    u.Phone,
    u.[Login],
    u.[Password],
    u.BirthDate,
    c.PromotedDate
FROM [User] AS u JOIN
	[Coordinator] AS c ON u.IdUser = c.IdCoordinator
