
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `inschrijving` (
  `InschrijvingID` int(11) NOT NULL,
  `VakID` int(11) NOT NULL,
  `LeerlingID` int(11) NOT NULL,
  `Inschrijfdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `inschrijving` (`InschrijvingID`, `VakID`, `LeerlingID`, `Inschrijfdatum`) VALUES
(0, 0, 3, '2018-10-17');

CREATE TABLE `leerling` (
  `LeerlingID` int(50) NOT NULL,
  `Voornaam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Geboortedatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leerling` (`LeerlingID`, `Voornaam`, `Achternaam`, `Geboortedatum`) VALUES
(1, 'Peter ', 'de Jong', '2000-10-17'),
(2, 'Kees', 'de Boer', '2001-01-27'),
(3, 'Thomas', 'Dekker', '1999-09-17'),
(4, 'Jeffrey', 'Sluiter', '2000-07-04'),
(5, 'Miranda', 'Visser', '2000-10-16');

CREATE TABLE `leraren` (
  `LerarenID` int(11) NOT NULL,
  `Voornaam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Geboortedatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leraren` (`LerarenID`, `Voornaam`, `Achternaam`, `Geboortedatum`) VALUES
(0, 'Bert', 'de Boer', '1981-07-05'),
(1, 'Anton', 'Janssen', '1975-06-17');

CREATE TABLE `vakken` (
  `VakID` int(11) NOT NULL,
  `LeraarID` int(11) NOT NULL,
  `Boek` varchar(255) NOT NULL,
  `Grootte` int(11) NOT NULL,
  `Naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `vakken` (`VakID`, `LeraarID`, `Boek`, `Grootte`, `Naam`) VALUES
(0, 1, 'Nederlands Deel 1', 30, 'Nederlands');

ALTER TABLE `inschrijving`
  ADD PRIMARY KEY (`InschrijvingID`),
  ADD KEY `VakID` (`VakID`),
  ADD KEY `LeerlingID` (`LeerlingID`);

ALTER TABLE `leerling`
  ADD PRIMARY KEY (`LeerlingID`),
  ADD KEY `LeerlingID` (`LeerlingID`);
ALTER TABLE `leerling` ADD FULLTEXT KEY `Voornaam` (`Voornaam`);
ALTER TABLE `leerling` ADD FULLTEXT KEY `Achternaam` (`Achternaam`);

ALTER TABLE `leraren`
  ADD PRIMARY KEY (`LerarenID`),
  ADD KEY `LerarenID` (`LerarenID`),
  ADD KEY `Achternaam` (`Achternaam`),
  ADD KEY `Geboortedatum` (`Geboortedatum`);

ALTER TABLE `vakken`
  ADD PRIMARY KEY (`VakID`),
  ADD KEY `VakID` (`VakID`),
  ADD KEY `LeraarID` (`LeraarID`);

ALTER TABLE `leerling`
  MODIFY `LeerlingID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `inschrijving`
  ADD CONSTRAINT `inschrijving_ibfk_1` FOREIGN KEY (`VakID`) REFERENCES `vakken` (`VakID`),
  ADD CONSTRAINT `inschrijving_ibfk_2` FOREIGN KEY (`LeerlingID`) REFERENCES `leerling` (`LeerlingID`);

ALTER TABLE `vakken`
  ADD CONSTRAINT `vakken_ibfk_1` FOREIGN KEY (`LeraarID`) REFERENCES `leraren` (`LerarenID`);
COMMIT;
