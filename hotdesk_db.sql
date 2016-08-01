-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2016 at 10:02 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotdesk_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` int(10) NOT NULL,
  `userID_FK` int(8) NOT NULL,
  `deskID_FK` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `userID_FK`, `deskID_FK`) VALUES
(1, 68, 6),
(3, 71, 1),
(7, 68, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookingdate`
--

CREATE TABLE `bookingdate` (
  `bookingID_FK` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `bookingdate`
--

INSERT INTO `bookingdate` (`bookingID_FK`, `date`) VALUES
(1, '2016-07-25'),
(1, '2016-07-26'),
(1, '2016-07-27'),
(3, '2016-07-27'),
(3, '2016-07-28'),
(7, '2016-08-02'),
(7, '2016-08-03'),
(7, '2016-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `desk`
--

CREATE TABLE `desk` (
  `deskID` int(8) NOT NULL,
  `deskBlock` int(5) NOT NULL,
  `deskLetter` varchar(2) NOT NULL,
  `location` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `desk`
--

INSERT INTO `desk` (`deskID`, `deskBlock`, `deskLetter`, `location`) VALUES
(1, 643, 'A', 'Edinburgh'),
(2, 643, 'B', 'Edinburgh'),
(3, 643, 'C', 'Edinburgh'),
(4, 643, 'D', 'Edinburgh'),
(5, 643, 'E', 'Edinburgh'),
(6, 643, 'F', 'Edinburgh'),
(7, 643, 'G', 'Edinburgh'),
(8, 643, 'H', 'Edinburgh');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(8) NOT NULL,
  `surname` varchar(250) NOT NULL,
  `forename` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `surname`, `forename`, `username`) VALUES
(68, 'Piccoli', 'Michael', 'mpiccoli'),
(69, 'Mcintyre', 'Chris', 'chmcinty'),
(70, 'Nacef', 'Ridhwan', 'rnacef'),
(71, 'Kai', 'Christopher', 'ckai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `userID_FK` (`userID_FK`),
  ADD KEY `deskID_FK` (`deskID_FK`);

--
-- Indexes for table `bookingdate`
--
ALTER TABLE `bookingdate`
  ADD PRIMARY KEY (`bookingID_FK`,`date`);

--
-- Indexes for table `desk`
--
ALTER TABLE `desk`
  ADD PRIMARY KEY (`deskID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `desk`
--
ALTER TABLE `desk`
  MODIFY `deskID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`userID_FK`) REFERENCES `user` (`userID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`deskID_FK`) REFERENCES `desk` (`deskID`) ON UPDATE CASCADE;

--
-- Constraints for table `bookingdate`
--
ALTER TABLE `bookingdate`
  ADD CONSTRAINT `bookingdate_ibfk_1` FOREIGN KEY (`bookingID_FK`) REFERENCES `booking` (`bookingID`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
