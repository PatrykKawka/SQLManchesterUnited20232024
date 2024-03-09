-- CREATE VIEWS
-- expire contracts
CREATE VIEW ContractsExpireDate AS
SELECT P1.FirstName, P1.LastName, P2.Position, C.ExpireDate, DATEDIFF(MONTH,GETDATE(), C.ExpireDate) as MonthsToEnd,
CASE
WHEN DATEDIFF(MONTH,GETDATE(), C.ExpireDate)  < 6 THEN 'Free Agent Soon'
ELSE 'OK'
END as FreeAgentAlert
FROM Players as P1 LEFT JOIN
Positions as P2 ON P1.Position=P2.PositionID LEFT JOIN Contracts as C on P1.PlayerID=C.PlayerID;
GO
-- players nationalities
CREATE VIEW PlayersNationalities AS
SELECT N.Nationality, COUNT(PlayerID) as NumberOfPlayersFrom FROM Players as P
LEFT JOIN Nationalities as N
ON P.Nationality=N.NationalityID
GROUP BY N.Nationality;
GO
-- top 5 goalscorers
CREATE VIEW Top5Goalscorers AS
SELECT TOP 5 WITH TIES P.FirstName, P.LastName, S.Goals
FROM Players as P 
LEFT JOIN PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY S.Goals DESC;
GO
-- top 5 goalscorers
CREATE VIEW Top5Assistants AS
SELECT TOP 5 WITH TIES P.FirstName, P.LastName, S.Assists
FROM Players as P 
LEFT JOIN PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY S.Assists DESC;
GO
-- top 5 most efficient players
CREATE VIEW Top5MostEfficient AS
SELECT TOP 5 WITH TIES P.FirstName, P.LastName, S.Goals, S.Assists, (S.Goals + S.Assists) as [Sum]
FROM Players as P 
LEFT JOIN PlayersStatistics as S
ON P.PlayerID = S.PlayerID
ORDER BY [Sum] DESC;
GO
-- Statistics
CREATE VIEW AllStatistics AS
SELECT P.FirstName, P.LastName, S.Games, S.Goals, S.Assists, S.[Minutes], S.YellowCards, S.RedCards, M.MarketValue
FROM Players as P 
LEFT JOIN PlayersStatistics as S
ON P.PlayerID = S.PlayerID
LEFT JOIN MarketValue as M
ON M.PlayerID = P.PlayerID;
GO
--Market Values Ranking
CREATE VIEW MarketValueRanking AS
SELECT P.FirstName, P.LastName, M.MarketValue, RANK() OVER(ORDER BY M.MarketValue DESC) as Ranking, PS.Position, RANK() OVER(PARTITION BY PS.Position ORDER BY M.MarketValue DESC) as RankOverPosition
FROM Players as P 
LEFT JOIN MarketValue as M
ON M.PlayerID = P.PlayerID
LEFT JOIN Positions as PS
ON P.Position= PS.PositionID
GROUP BY P.FirstName, P.LastName, M.MarketValue, PS.Position;

-- END VIEWS

-- CREATE FUNCTIONS
GO
CREATE FUNCTION PlayerStatistic (@LastName NVARCHAR(32))
RETURNS TABLE 
AS
RETURN
SELECT P.FirstName, P.LastName, S.Goals, S.Assists, (S.Goals + S.Assists) as [Sum]
FROM Players as P 
LEFT JOIN PlayersStatistics as S
ON P.PlayerID = S.PlayerID
WHERE P.LastName = @LastName

--Check functions 
--SELECT * FROM  PlayerStatistic('LastName')
SELECT * FROM  PlayerStatistic('Casemiro')