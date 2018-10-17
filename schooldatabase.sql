-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 17 okt 2018 om 16:53
-- Serverversie: 10.1.35-MariaDB
-- PHP-versie: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schooldata`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `inschrijving`
--

CREATE TABLE `inschrijving` (
  `InschrijvingID` int(11) NOT NULL,
  `LeerlingID` int(11) NOT NULL,
  `VakID` int(11) NOT NULL,
  `Inschrijfdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `inschrijving`
--

INSERT INTO `inschrijving` (`InschrijvingID`, `LeerlingID`, `VakID`, `Inschrijfdatum`) VALUES
(1, 8, 1, '2018-10-17'),
(2, 10, 2, '2018-10-16'),
(3, 7, 5, '2018-10-15'),
(4, 6, 3, '2018-10-14'),
(5, 5, 4, '2018-10-09'),
(6, 1, 3, '2018-10-16'),
(7, 4, 1, '2018-10-08'),
(8, 3, 4, '2018-10-17'),
(9, 2, 5, '2018-10-15'),
(10, 9, 2, '2018-10-15');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling`
--

CREATE TABLE `leerling` (
  `LeerlingID` int(11) NOT NULL,
  `Voornaam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Geboortedatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling`
--

INSERT INTO `leerling` (`LeerlingID`, `Voornaam`, `Achternaam`, `Geboortedatum`) VALUES
(1, 'Mieke', 'Voorburg', '2001-10-07'),
(2, 'Robert', 'Staal', '2000-04-22'),
(3, 'Patrick', 'Straten', '2002-10-28'),
(4, 'Patricia', 'Voorburg', '2002-10-15'),
(5, 'Klaas', 'Dam', '2001-10-03'),
(6, 'Juliet', 'Nieuwendijk', '2003-06-14'),
(7, 'Ivo', 'Landgraaf', '2001-12-15'),
(8, 'Ashley', 'de Jong', '2002-05-27'),
(9, 'Tamar', 'Haak', '2001-03-11'),
(10, 'Eric', 'van Dijk', '2004-05-22');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leraren`
--

CREATE TABLE `leraren` (
  `LerarenID` int(11) NOT NULL,
  `Voornaam` varchar(255) NOT NULL,
  `Achternaam` varchar(255) NOT NULL,
  `Geboortedatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leraren`
--

INSERT INTO `leraren` (`LerarenID`, `Voornaam`, `Achternaam`, `Geboortedatum`) VALUES
(1, 'Peter ', 'Pannekoek', '1972-10-16'),
(2, 'Jan', 'Horstmeier', '1983-10-08'),
(3, 'Anita', 'Straten', '1978-10-21'),
(4, 'Anna', 'Visser', '1969-06-26'),
(5, 'Aafko', 'Bos', '1985-04-03');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vakken`
--

CREATE TABLE `vakken` (
  `VakID` int(11) NOT NULL,
  `LerarenID` int(11) NOT NULL,
  `Boek` varchar(255) NOT NULL,
  `Grootte` int(11) NOT NULL,
  `Naam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `vakken`
--

INSERT INTO `vakken` (`VakID`, `LerarenID`, `Boek`, `Grootte`, `Naam`) VALUES
(1, 2, 'History X', 30, 'Geschiedenis'),
(2, 1, 'Bio 2', 30, 'Biologie'),
(3, 3, 'NL 100', 30, 'Nederlands'),
(4, 4, 'Topo', 30, 'Aarderijkskunde'),
(5, 5, 'Lessons', 30, 'English');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `inschrijving`
--
ALTER TABLE `inschrijving`
  ADD PRIMARY KEY (`InschrijvingID`),
  ADD KEY `InschrijvingID` (`InschrijvingID`),
  ADD KEY `LeerlingID` (`LeerlingID`),
  ADD KEY `VakID` (`VakID`);

--
-- Indexen voor tabel `leerling`
--
ALTER TABLE `leerling`
  ADD PRIMARY KEY (`LeerlingID`),
  ADD KEY `LeerlingID` (`LeerlingID`);

--
-- Indexen voor tabel `leraren`
--
ALTER TABLE `leraren`
  ADD PRIMARY KEY (`LerarenID`),
  ADD KEY `LerarenID` (`LerarenID`);

--
-- Indexen voor tabel `vakken`
--
ALTER TABLE `vakken`
  ADD PRIMARY KEY (`VakID`),
  ADD KEY `VakID` (`VakID`),
  ADD KEY `LerarenID` (`LerarenID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `inschrijving`
--
ALTER TABLE `inschrijving`
  MODIFY `InschrijvingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `leerling`
--
ALTER TABLE `leerling`
  MODIFY `LeerlingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `leraren`
--
ALTER TABLE `leraren`
  MODIFY `LerarenID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `vakken`
--
ALTER TABLE `vakken`
  MODIFY `VakID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `inschrijving`
--
ALTER TABLE `inschrijving`
  ADD CONSTRAINT `inschrijving_ibfk_1` FOREIGN KEY (`LeerlingID`) REFERENCES `leerling` (`LeerlingID`),
  ADD CONSTRAINT `inschrijving_ibfk_2` FOREIGN KEY (`VakID`) REFERENCES `vakken` (`VakID`);

--
-- Beperkingen voor tabel `vakken`
--
ALTER TABLE `vakken`
  ADD CONSTRAINT `vakken_ibfk_1` FOREIGN KEY (`LerarenID`) REFERENCES `leraren` (`LerarenID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
