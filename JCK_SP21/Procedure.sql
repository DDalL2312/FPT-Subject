-- nhập vào tên 1 đội, in ra người đi đường giữa của đội đó
CREATE PROCEDURE midLanerOfTeam @teamID NVARCHAR(10)
AS 
BEGIN
		SELECT P.ID FROM Player P
		WHERE P.TeamID = @teamID AND P.RoleID = 'Mid Laner'
END

EXEC dbo.midLanerOfTeam @teamID = N'T1' -- nvarchar(10)
                      
