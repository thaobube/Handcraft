CREATE VIEW [dbo].[V_FullTutor]
	AS 
SELECT 
    t.IdTutor,
    u.FirstName,
    u.LastName,
    u.Email,
    u.Phone,
    u.[Login],
    u.[Password],
    u.BirthDate,
    t.[Description],
    t.BankAccount,
    t.TVANumber,
    t.Picture
FROM [User] AS u JOIN
	[Tutor] AS t ON u.IdUser = t.IdTutor
