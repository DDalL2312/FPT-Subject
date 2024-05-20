CREATE DATABASE LCKSP21
GO

USE LCKSP21
GO

CREATE TABLE [Role]
(
	ID NVARCHAR(10),
	[Description] TEXT

	PRIMARY KEY(ID)
)

CREATE TABLE Team
(
	ID NVARCHAR(10),
	Coach NVARCHAR(10)

	PRIMARY KEY(ID)
)

CREATE TABLE Player
(
	ID NVARCHAR(15),
	[Name] NVARCHAR(30),
	RoleID NVARCHAR(10),
	Country NVARCHAR(10),
	TeamID NVARCHAR(10),

	PRIMARY KEY(ID),
	FOREIGN KEY(RoleID) REFERENCES dbo.Role(ID),
	FOREIGN KEY(TeamID) REFERENCES dbo.Team(ID)
)

CREATE TABLE [Match]
(	
	ID INT,
	Team1 NVARCHAR(10) NOT NULL,
	Team2 NVARCHAR(10) NOT NULL,
	Team1Result INT,
	Team2Result INT,
	[Date] DATE,
	MatchMVP NVARCHAR(15),

	PRIMARY KEY(ID),
	FOREIGN KEY(Team1) REFERENCES dbo.Team(ID),
	FOREIGN KEY(Team2) REFERENCES dbo.Team(ID),
	FOREIGN KEY(MatchMVP) REFERENCES dbo.Player(ID)
)


CREATE TABLE Organize
(

	OrganizeID INT,
	MatchID INT,
	TakecareID INT,
	RefereeName NVARCHAR(10),
	Technican NVARCHAR(20),
	MCName NVARCHAR(30)

	PRIMARY KEY(OrganizeID)
	FOREIGN KEY(MatchID) REFERENCES dbo.Match(ID),
)

CREATE TABLE [Take care] 
(
	ID INT,
	Position NVARCHAR(20),
	OrganizeID INT,

	PRIMARY KEY(ID),
	FOREIGN KEY(OrganizeID) REFERENCES dbo.Organize(OrganizeID)
)
BULK INSERT dbo.[Take care]
FROM 'C:\Users\hoang\Desktop\Take care.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.Role
FROM 'C:\Users\hoang\Desktop\Role.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.Organize
FROM 'C:\Users\hoang\Desktop\Organize.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.Match
FROM 'C:\Users\hoang\Desktop\Match.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.Player
FROM 'C:\Users\hoang\Desktop\Player.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT dbo.Team
FROM 'C:\Users\hoang\Desktop\Team.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

