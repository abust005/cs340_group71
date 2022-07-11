-- phpMyAdmin SQL Dump
-- version 5.2.0-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2022 at 06:22 PM
-- Server version: 10.6.8-MariaDB-log
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs340_benderd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Certifications`
--

CREATE TABLE `Certifications` (
  `certID` int(11) NOT NULL,
  `certName` varchar(50) NOT NULL,
  `instructorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Customers`
--

CREATE TABLE `Customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `custEmail` varchar(50) NOT NULL,
  `lessonPurchaseID` int(11) DEFAULT NULL,
  `lessonsTaken` int(11) NOT NULL,
  `firstPurchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Instructors`
--

CREATE TABLE `Instructors` (
  `instructorID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `instructEmail` varchar(50) NOT NULL,
  `certs` int(11) DEFAULT NULL,
  `numberOfRequests` int(11) DEFAULT NULL,
  `startDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `Lessons`
--

CREATE TABLE `Lessons` (
  `lessonID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL,
  `lessonType` varchar(50) NOT NULL,
  `lessonDate` date NOT NULL,
  `request` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Certifications`
--
ALTER TABLE `Certifications`
  ADD PRIMARY KEY (`certID`),
  ADD UNIQUE KEY `certID` (`certID`),
  ADD UNIQUE KEY `certName` (`certName`),
  ADD KEY `instructorID` (`instructorID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `customerID` (`customerID`),
  ADD KEY `lessonPurchaseID` (`lessonPurchaseID`);

--
-- Indexes for table `Instructors`
--
ALTER TABLE `Instructors`
  ADD PRIMARY KEY (`instructorID`),
  ADD UNIQUE KEY `instructorID` (`instructorID`),
  ADD KEY `certs` (`certs`);

--
-- Indexes for table `Lessons`
--
ALTER TABLE `Lessons`
  ADD PRIMARY KEY (`lessonID`),
  ADD UNIQUE KEY `lessonID` (`lessonID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `instructorID` (`instructorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Certifications`
--
ALTER TABLE `Certifications`
  MODIFY `certID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Instructors`
--
ALTER TABLE `Instructors`
  MODIFY `instructorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Lessons`
--
ALTER TABLE `Lessons`
  MODIFY `lessonID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Certifications`
--
ALTER TABLE `Certifications`
  ADD CONSTRAINT `Certifications_ibfk_1` FOREIGN KEY (`instructorID`) REFERENCES `Instructors` (`instructorID`);

--
-- Constraints for table `Customers`
--
ALTER TABLE `Customers`
  ADD CONSTRAINT `Customers_ibfk_1` FOREIGN KEY (`lessonPurchaseID`) REFERENCES `Lessons` (`lessonID`);

--
-- Constraints for table `Instructors`
--
ALTER TABLE `Instructors`
  ADD CONSTRAINT `Instructors_ibfk_1` FOREIGN KEY (`certs`) REFERENCES `Certifications` (`certID`);

--
-- Constraints for table `Lessons`
--
ALTER TABLE `Lessons`
  ADD CONSTRAINT `Lessons_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`),
  ADD CONSTRAINT `Lessons_ibfk_2` FOREIGN KEY (`instructorID`) REFERENCES `Instructors` (`instructorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `Certifications` (`certName`)
    VALUES  
        ('ski0'),
        ('ski1'),
        ('ski2'),
        ('ski3'),
        ('board0'),
        ('board1'),
        ('board2'),
        ('board3'),
        ('child1'),
        ('child2'),
        ('freestyle1'),
        ('freestyle2'),
        ('adapative1');

INSERT INTO `Instructors` (`firstName`, `lastName`, `instructEmail`)
    VALUES
        ('Douglas', 'Bender', 'benderd@oregonstate.edu'),
        ('Adriel', 'Bustamante', 'bustamad@oregonstate.edu');

INSERT INTO `Customers` (`firstName`, `lastName`, `custEmail`)
    VALUES
        ('John', 'Doe', 'john@email.com'),
        ('Jane', 'Doe', 'jane@email.com'),
        ('Mary', 'Sue', 'mary@email.com');

INSERT INTO `Lessons` (`customerID`, `instructorID`, `lessonType`, `lessonDate`, `request`)
    VALUES
        (1, 1, 'ski0', '2022-07-10', false),
        (2, 1, 'ski0', '2022-07-10', false),
        (3, 1, 'ski3', '2022-07-10', true);