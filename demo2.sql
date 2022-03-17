-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2022 at 07:39 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `before_offence` (IN `username` VARCHAR(50), IN `vhno` VARCHAR(50), IN `licno` VARCHAR(50))  MODIFIES SQL DATA
IF ((SELECT COUNT(*) FROM users WHERE vehicleno = vhno AND licenseno = licno) = 0) THEN
	INSERT INTO users(name,vehicleno,licenseno) VALUES (username,vhno,licno) ;
END IF$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `OfficialAdded` varchar(20) NOT NULL,
  `DateTimeAdded` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `OfficialAdded`, `DateTimeAdded`) VALUES
('akhila123', '$2y$10$HK9/6WnsApy2PDq6qpU5B.KKtJwoDVrnYJwdaFzp.hOkhQPK4ZkA6', '', '0000-00-00'),
('ananya123', '$2y$10$2nmRTzoqRG/oUNfqVC2gguo2FvQNPyyvFAZpS6nfFtpSeANIqeFve', '', '0000-00-00'),
('passwordispassword', '$2y$10$FW5mu8icZXsOdbc8FfPCE.c87BfVNz2d5naCB8wX.QP7Nx16kn3s.', '', '0000-00-00'),
('rajesh123', '$2y$10$MJguylckpP8ia2J1qhrVne1HgUU4Wxf6rHxiTzNBPtWGfPCvxm9iC', '', '0000-00-00'),
('ramesh123', '$2y$10$2haM5qdGXPNTwSh/w0LkHeEZQyyvKQN28okp2lXdWKWzYGyPhytw6', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `policerecord`
--

CREATE TABLE `policerecord` (
  `PSID` varchar(250) NOT NULL,
  `OfficialUsername` varchar(20) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `CopName` varchar(50) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `PhoneNo` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `EmailID` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policerecord`
--

INSERT INTO `policerecord` (`PSID`, `OfficialUsername`, `Password`, `CopName`, `Designation`, `PhoneNo`, `Address`, `EmailID`) VALUES
('4', 'smithh123', '$2y$10$b21x/CPaAfezboC.rSBwH.5p60oJR9tXdX.SWSPg0OmhLAkN.tWLq', 'Smith', 'police', '654546', 'jayanagar', 'smith@gmail.com'),
('1', 'joseph123', '$2y$10$Xh4h5IIkS70L0Su4xU6HH.si6UBpOZSnL9EyHCEiJYUPoNxwm2ViO', 'Joseph', 'police', '654514645', 'Kengeri', 'joseph@gmail.com'),
('3', 'stephen123', '$2y$10$0xYqOUBzljXrMVxeUwgwfexzXbmGhv/bGA/7.4GUdQRMquP6mmqW.', 'Stephen', 'police', '4561646545', 'RR nagar', 'stephen@gmail.com'),
('3', 'passwordispassword', '$2y$10$B/.mKTsQwm2PeuH6hDkkl.2tYP0NvYkizld9tTwhFaTUsWbRr6c9i', 'password', 'police', '987654', 'Bangalore', 'allenabraham505@gmai'),
('2', 'gourav123', '$2y$10$3E2d4wxVuQYZp4DF7zfPCOXE/HtjkQMBqNC1amaAU32fQRQKPBJrq', 'Gourav', 'police', '64516651534', 'Ullal', 'gourav@gmail.com'),
('2', 'aditya123', '$2y$10$.0LOg4.sty7SFh.GVl147e.gZqQ2IFDlx0wvWNaxkkTKdKowhV9q6', 'Aditya', 'police', '654516845', 'Ullal', 'aditya@gmail.com'),
('3', 'mohith123', '$2y$10$WDEOPxl8l08ENk7G18vB4.goTCbSua1ivmzxbgn61l6AdO0IrLtv.', 'Mohith', 'police', '684565451', 'RRNagar', 'mohith@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `PSName` varchar(20) NOT NULL,
  `PSID` int(11) NOT NULL,
  `PSAddress` varchar(50) NOT NULL,
  `PSPhoneNo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`PSName`, `PSID`, `PSAddress`, `PSPhoneNo`) VALUES
('Kengeri PS', 1, 'Kengeri', 988877665),
('Jnanabharati PS', 2, 'Ullal', 99998877),
('RR PS', 3, 'RRNagar', 88899976),
('Jayanagar PS', 4, 'Jayanagar', 77788898);

-- --------------------------------------------------------

--
-- Table structure for table `useroffence`
--

CREATE TABLE `useroffence` (
  `Offence` varchar(30) NOT NULL,
  `Fine` int(50) NOT NULL,
  `VehicleNo` varchar(16) NOT NULL,
  `Place` varchar(30) NOT NULL,
  `DateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `OfficialUsername` varchar(30) NOT NULL,
  `LicenseNo` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `useroffence`
--

INSERT INTO `useroffence` (`Offence`, `Fine`, `VehicleNo`, `Place`, `DateTime`, `OfficialUsername`, `LicenseNo`) VALUES
('No Helmet', 2000, '1000', 'MG Road', '2022-01-06 15:39:14', 'joseph123', '0001'),
('No Helmet', 2000, '1000', 'RRNagar', '2022-01-06 14:51:14', 'stephen123', '0001'),
('Rash driving', 5000, '3000', 'Kengeri', '2022-01-06 14:52:04', 'aditya123', '0003'),
('Signal Jump', 2000, '4000', 'Kengeri', '2022-01-06 15:30:19', 'joseph123', '0004'),
('Rash driving', 2000, '2000', 'RRNagar', '2022-01-06 15:41:03', 'joseph123', '0002'),
('Exceeding Limit', 2000, '6000', 'RRNagar', '2022-01-06 15:42:32', 'joseph123', '0005'),
('Exceeding Limit', 2000, '1234', 'RRNagar', '2022-01-06 15:54:39', 'joseph123', '0001'),
('No Helmet', 2000, '2345', 'Kengeri', '2022-01-06 20:26:41', 'passwordispassword', '0001'),
('Rash driving', 1000, '7777', 'Kengeri', '2022-01-06 20:29:15', 'passwordispassword', '7779'),
('No Helmet', 2000, '5111', 'Kengeri', '2022-01-07 11:41:48', 'passwordispassword', '1115'),
('Rash driving', 3000, '5222', 'MG Road', '2022-01-07 11:42:23', 'passwordispassword', '2225'),
('Signal Jump', 3000, '8888', 'Kengeri', '2022-01-08 19:22:11', 'passwordispassword', '0005');

--
-- Triggers `useroffence`
--
DELIMITER $$
CREATE TRIGGER `trig1` BEFORE INSERT ON `useroffence` FOR EACH ROW CALL before_offence('',new.vehicleno,new.licenseno)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(50) NOT NULL,
  `phno` int(50) NOT NULL,
  `vehicleno` varchar(16) NOT NULL,
  `licenseno` varchar(30) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `phno`, `vehicleno`, `licenseno`, `emailid`, `password`) VALUES
('Anurag', 5465145, '5000', '0005', 'anurag123@gmail.com', '$2y$10$sZg3pgGlMxDFL4g0GjyleuwBdlHHInb./e2Ou7Tra500Ssi8YJLTO'),
('Mahira', 65421315, '1000', '0001', 'mahira@gmail.com', '$2y$10$V/5IJAaM/VrYti5JDaDz8epPiFzE1n4OknAQxsoC7G/0CIiNTZfPa'),
('', 0, '3000', '0003', '', ''),
('', 0, '4000', '0004', '', ''),
('', 0, '2000', '0002', '', ''),
('', 0, '1234', '0001', '', ''),
('', 0, '7777', '7779', '', ''),
('', 0, '5111', '1115', '', ''),
('', 0, '5222', '2225', '', ''),
('', 0, '8888', '0005', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`),
  ADD KEY `OfficialAdded` (`OfficialAdded`);

--
-- Indexes for table `policerecord`
--
ALTER TABLE `policerecord`
  ADD PRIMARY KEY (`OfficialUsername`),
  ADD KEY `PSID` (`PSID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`PSID`);

--
-- Indexes for table `useroffence`
--
ALTER TABLE `useroffence`
  ADD KEY `OfficialUsername` (`OfficialUsername`),
  ADD KEY `VehicleNo` (`VehicleNo`,`LicenseNo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`vehicleno`,`licenseno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
