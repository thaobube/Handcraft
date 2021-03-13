CREATE VIEW [dbo].[V_Class_Category]
	AS 
SELECT
    c.IdClass,
	cg.[Name] AS CategoryName
FROM [Class] AS c JOIN
[ClassCategory] AS cc ON c.IdClass = cc.IdClass JOIN 
[Category] AS cg ON cg.IdCategory = cc.IdCategory
