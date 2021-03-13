CREATE PROCEDURE [dbo].[CategoryClasses]
	@name VARCHAR (64)
AS
SELECT * FROM [V_SimpleClass] WHERE CategoryName = @name

