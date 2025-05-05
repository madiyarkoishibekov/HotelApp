CREATE PROCEDURE [dbo].[sp_Bookings_AddBooking]
	@roomId INT,
	@guestId INT,
	@startDate DATE,
	@endDate DATE,
	@totalCost MONEY
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Bookings(RoomId, GuestId, StartDate, EndDate, TotalCost)
	VALUES (@roomId, @guestId, @startDate, @endDate, @totalCost);
END

