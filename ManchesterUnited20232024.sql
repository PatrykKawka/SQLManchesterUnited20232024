-- Create Database - Manchester United Season 2023/2024


-- 1st step: create database
CREATE DATABASE ManchesterUnited20232024

-- 2nd step: use already created database
USE ManchesterUnited20232024

--3rd step: create tables and inser data

CREATE TABLE Positions (
PositionID INT IDENTITY(1,1) PRIMARY KEY,
Position NVARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE Nationalities (
NationalityID INT IDENTITY(1,1) PRIMARY KEY,
Nationality NVARCHAR(32) UNIQUE NOT NULL
);

CREATE TABLE Contracts
(PlayerID INT IDENTITY(1,1) PRIMARY KEY,
ExpireDate date  NULL);

CREATE TABLE [PlayersStatistics]
(PlayerID INT IDENTITY (1,1) PRIMARY KEY,
Games INT NOT NULL,
Goals INT NOT NULL,
Assists INT NOT NULL,
[Minutes] INT NOT NULL,
YellowCards INT NOT NULL,
RedCards INT NULL,
);

CREATE TABLE MarketValue
(PlayerID INT IDENTITY (1,1) PRIMARY KEY,
MarketValue decimal(4,2) NOT NULL
);

CREATE TABLE Players (
PlayerID INT IDENTITY(1,1) PRIMARY KEY REFERENCES Contracts(PlayerID),
FirstName NVARCHAR(32),
LastName NVARCHAR(32) NOT NULL,
Number INT NOT NULL UNIQUE ,
Position INT NOT NULL REFERENCES Positions(PositionID) ON UPDATE CASCADE,
Nationality INT NOT NULL REFERENCES Nationalities(NationalityID) ON UPDATE CASCADE
);

-- END TABLES

-- INSERT INTO TABLES


INSERT INTO Positions(Position)
VALUES
('Goalkeeper'),
('Cenre-back'),
('Left-back'),
('Right-back'),
('Defensive midfield'),
('Central midfield'),
('Attacking midfield'),
('Left winger'),
('Right winger'),
('Centre-forward');

INSERT INTO Nationalities(Nationality)
VALUES
('England'),
('Cameroon'),
('Turkiye'),
('Argentina'),
('France'),
('Sweden'),
('Portugal'),
('Brazil'),
('Morocco'),
('Scotalnd'),
('Denmark'),
('Cote d Ivoire'),
('North Ireland'),
('Netherland'),
('Uruguay'),
('Spain');

UPDATE Nationalities
SET Nationality = 'Scotland'
WHERE Nationality = 'Scotalnd';

INSERT INTO Contracts(ExpireDate)
VALUES
('2028-06-30'),
('2027-06-30'),
('2024-06-30'),
('2027-06-30'),
('2025-06-30'),
('2024-06-30'),
('2028-06-30'),
('2027-06-30'),
('2028-06-30'),
('2026-06-30'),
('2028-06-30'),
('2028-06-30'),
('2026-06-30'),
('2025-06-30'),
('2025-06-30'),
('2024-06-30'),
('2025-06-30'),
('2027-06-30'),
('2026-06-30'),
('2028-06-30'),
('2025-06-30'),
('2024-06-30'),
('2025-06-30'),
('2027-06-30'),
(NULL),
('2026-06-30');

-- Statistics 2024/03/09
INSERT INTO [PlayersStatistics] (Games,Goals, Assists, [Minutes], YellowCards, RedCards)
VALUES
('38', '0', '0', '3420', '4','0'),
('5', '0', '0', '450', '0' ,'0'),
('0', '0', '0', '0', '0' ,'0'),
('10', '0', '1', '740', '4' ,'0'),
('27', '1', '0', '1924', '2' ,'0'),
('19', '2', '2', '629', '0' ,'0'),
('30', '12', '2', '2184', '2' ,'0'),
('29', '1', '1', '1436', '4' ,'0'),
('37', '7', '3', '2496', '4' ,'0'),
('21', '5', '2', '1653', '6' ,'1'),
('34', '7', '6', '2491', '2' ,'0'),
('12', '0', '1', '626', '1' ,'0'),
('37', '8', '9', '3265', '10' ,'0'),
('23', '2', '2', '1646', '4' ,'0'),
('25', '1', '1', '1781', '3' ,'0'),
('24', '0', '1', '1270', '2' ,'0'),
('22', '0', '0', '1407', '4' ,'0'),
('15', '0', '1', '1180', '7' ,'0'),
('0', '0', '0', '0', '0' ,'0'),
('37', '2', '3', '3134', '5' ,'1'),
('17', '0', '2', '1231', '4' ,'0'),
('22', '0', '0', '1155', '6' ,'0'),
('33', '8', '2', '2034', '2' ,'0'),
('3', '2', '0', '270', '2' ,'0'),
('3', '0', '0', '63', '0' ,'0');


INSERT INTO MarketValue(MarketValue)
VALUES
('40'),
('10'),
('0.25'),
('50'),
('25'),
('15'),
('65'),
('35'),
('30'),
('30'),
('70'),
('45'),
('70'),
('20'),
('18'),
('2'),
('2'),
('38'),
('18'),
('35'),
('20'),
('28'),
('28'),
('6'),
('4'),
('18');

INSERT INTO Players(FirstName,LastName,Number, Position,Nationality)
VALUES
('Andre','Onana','24','1','2'),
('Altay','Baindir','1','1','3'),
('Tom','Heaton','22','1', '1'),
('Lisandro','Martinez','6','2','4'),
('Raphael','Varane','19','2','5'),
('Anthony','Martial', '9','10','5'),
('Rasmus','Hojlund', '11','10','11'),
(NULL,'Antony', '21','8','11'),
('Alejandro','Garnacho', '17','7','4'),
(NULL, 'Casemiro', '18','5','11'),
('Marcus','Rashford','10','8','1'),
('Mason','Mount','7','7','1'),
('Bruno','Fernandes','8','7','7'),
('Harry','Maguire','5','2','1'),
('Victor','Lindelof','2','2','6'),
('Johny','Evans','35','2','13'),
('Willy','Kambwala','53','2','5'),
('Luke','Shaw','23','3','1'),
('Tyrell','Malacia','12','3','14'),
('Diogo','Dalot','20','4','7'),
('Aaron','Wan-Bissaka','29','4','1'),
('Sofyan','Amrabat','4','5','9'),
('Scott','McTominay','39','5','10'),
('Kobbie','Mainoo','37','6','1'),
('Shola','Sholetire','47','7','1'),
('Amad','Diallo','16','10','12');

-- END INSERTING INTO TABLES
