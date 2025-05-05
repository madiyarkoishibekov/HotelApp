CREATE PROCEDURE [dbo].[sp_Guests_AddGuest]
	@firstName nvarchar(50),
	@lastName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT 1 FROM Guests WHERE LastName = @lastName AND
	FirstName = @firstName)
	BEGIN
		INSERT INTO Guests(FirstName, LastName)
		VALUES (@firstName, @lastName)
	END;

	SELECT TOP 1 Id, FirstName, LastName
	FROM Guests
	WHERE LastName = @lastName AND
	FirstName = @firstName;
END
