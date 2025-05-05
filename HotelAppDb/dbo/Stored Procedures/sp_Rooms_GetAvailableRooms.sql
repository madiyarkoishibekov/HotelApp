CREATE PROCEDURE [dbo].[sp_Rooms_GetAvailableRooms]
	@startDate DATE,
	@endDate DATE,
	@roomTypeId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT [r].[Id], [r].[RoomNumber], [r].[RoomTypeId]
	FROM Rooms r
	JOIN RoomTypes t ON t.Id = r.RoomTypeId
	WHERE r.RoomTypeId = @roomTypeId
	AND r.Id NOT IN(
	SELECT b.RoomId
	FROM Bookings b
	WHERE (@startDate < b.StartDate AND @endDate > b.EndDate)
	OR (@endDate >= b.StartDate AND @endDate < b.EndDate)
	OR (@startDate >= b.StartDate AND @startDate < b.EndDate)
	)
END
