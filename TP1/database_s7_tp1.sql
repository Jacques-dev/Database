-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 18 nov. 2021 à 10:09
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `database_s7_tp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `children`
--

DROP TABLE IF EXISTS `children`;
CREATE TABLE IF NOT EXISTS `children` (
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `children`
--

INSERT INTO `children` (`name`, `age`) VALUES
('Jack', 13),
('John', 15),
('Lea', 17),
('Luci', 10),
('Monica', 18);

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dno` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL,
  `budget` int(11) NOT NULL,
  `ssn` int(11) NOT NULL,
  PRIMARY KEY (`dno`),
  KEY `department_employee` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`dno`, `dname`, `budget`, `ssn`) VALUES
(1, 'Tesla', 253645, 1),
(2, 'SpaceX', 365214, 1),
(3, 'Facebook', 36524451, 2),
(4, 'Instagram', 2364879, 2),
(5, 'Whatsapp', 6531988, 2);

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `ssn` int(11) NOT NULL AUTO_INCREMENT,
  `salary` int(11) NOT NULL,
  `phone` char(10) NOT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`ssn`, `salary`, `phone`) VALUES
(1, 20000, '0653264987'),
(2, 20000, '0635468792'),
(3, 5000, '0635467898'),
(4, 4000, '0651246832'),
(5, 3500, '0643658791');

-- --------------------------------------------------------

--
-- Structure de la table `have`
--

DROP TABLE IF EXISTS `have`;
CREATE TABLE IF NOT EXISTS `have` (
  `ssn` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ssn`,`name`),
  KEY `have_children` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `have`
--

INSERT INTO `have` (`ssn`, `name`) VALUES
(3, 'Jack'),
(4, 'John'),
(3, 'Lea'),
(2, 'Luci'),
(1, 'Monica');

-- --------------------------------------------------------

--
-- Structure de la table `work`
--

DROP TABLE IF EXISTS `work`;
CREATE TABLE IF NOT EXISTS `work` (
  `ssn` int(11) NOT NULL,
  `dno` int(11) NOT NULL,
  PRIMARY KEY (`ssn`,`dno`),
  KEY `work_department` (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `work`
--

INSERT INTO `work` (`ssn`, `dno`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 3),
(2, 4),
(4, 4),
(2, 5),
(5, 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_employee` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `have`
--
ALTER TABLE `have`
  ADD CONSTRAINT `have_children` FOREIGN KEY (`name`) REFERENCES `children` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `have_emplyee` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_department` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `work_employee` FOREIGN KEY (`ssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
