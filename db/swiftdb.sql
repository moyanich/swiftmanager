-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 29, 2020 at 04:35 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swiftdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblAddress`
--

CREATE TABLE `tblAddress` (
  `addressID` int(11) NOT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `address3` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblContactNumbers`
--

CREATE TABLE `tblContactNumbers` (
  `phoneID` int(11) NOT NULL,
  `contactNumbers` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblContract`
--

CREATE TABLE `tblContract` (
  `contractID` int(11) NOT NULL,
  `contractType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblDepartments`
--

CREATE TABLE `tblDepartments` (
  `deptID` int(11) NOT NULL,
  `deptName` varchar(45) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmailAddress`
--

CREATE TABLE `tblEmailAddress` (
  `emailID` int(11) NOT NULL,
  `emailAddress` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpAddress`
--

CREATE TABLE `tblEmpAddress` (
  `id` int(11) NOT NULL,
  `relEMPID` char(6) NOT NULL,
  `relAddressID` int(11) DEFAULT NULL,
  `relParishID` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpContact`
--

CREATE TABLE `tblEmpContact` (
  `id` int(11) NOT NULL,
  `relEmpID` char(6) DEFAULT NULL,
  `relPhoneID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpContract`
--

CREATE TABLE `tblEmpContract` (
  `id` int(11) NOT NULL,
  `relEmpID` char(6) NOT NULL,
  `relContractID` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpDepartment`
--

CREATE TABLE `tblEmpDepartment` (
  `id` int(11) NOT NULL,
  `relEmpID` char(6) NOT NULL,
  `relDeptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpEmail`
--

CREATE TABLE `tblEmpEmail` (
  `id` int(11) NOT NULL,
  `relEmpID` char(6) NOT NULL,
  `relEmailID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpJob`
--

CREATE TABLE `tblEmpJob` (
  `id` int(11) NOT NULL,
  `relEmpID` char(6) NOT NULL,
  `relJobID` int(11) NOT NULL,
  `relDeptID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmpLeave`
--

CREATE TABLE `tblEmpLeave` (
  `idLeave` int(11) NOT NULL,
  `relLeaveID` int(11) NOT NULL,
  `relEmpID` char(6) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblEmployees`
--

CREATE TABLE `tblEmployees` (
  `id` int(11) NOT NULL,
  `empID` char(6) NOT NULL,
  `title` varchar(5) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `suffix` varchar(15) DEFAULT NULL,
  `trn` char(12) DEFAULT NULL,
  `nis` char(12) DEFAULT NULL,
  `relGender` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblGender`
--

CREATE TABLE `tblGender` (
  `ID` int(11) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `Description` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblJobs`
--

CREATE TABLE `tblJobs` (
  `jobID` int(11) NOT NULL,
  `job` varchar(45) NOT NULL,
  `jobDesc` varchar(155) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblLeaveType`
--

CREATE TABLE `tblLeaveType` (
  `idType` int(11) NOT NULL,
  `leaveName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblParish`
--

CREATE TABLE `tblParish` (
  `parishID` int(11) NOT NULL,
  `parishName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblrole`
--

CREATE TABLE `tblrole` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblrole`
--

INSERT INTO `tblrole` (`role_id`, `role_name`) VALUES
(1, 'Administrator'),
(2, 'Super User');

-- --------------------------------------------------------

--
-- Table structure for table `tblUserLogs`
--

CREATE TABLE `tblUserLogs` (
  `idLogs` int(11) NOT NULL,
  `relUserID` int(11) NOT NULL,
  `timelog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(70) NOT NULL,
  `email` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `userRole` int(11) DEFAULT '4',
  `active` varchar(255) DEFAULT NULL,
  `resetToken` varchar(255) DEFAULT NULL,
  `resetComplete` varchar(255) DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblAddress`
--
ALTER TABLE `tblAddress`
  ADD PRIMARY KEY (`addressID`);

--
-- Indexes for table `tblContactNumbers`
--
ALTER TABLE `tblContactNumbers`
  ADD PRIMARY KEY (`phoneID`);

--
-- Indexes for table `tblContract`
--
ALTER TABLE `tblContract`
  ADD PRIMARY KEY (`contractID`),
  ADD UNIQUE KEY `contractType_UNIQUE` (`contractType`);

--
-- Indexes for table `tblDepartments`
--
ALTER TABLE `tblDepartments`
  ADD PRIMARY KEY (`deptID`),
  ADD UNIQUE KEY `deptName_UNIQUE` (`deptName`);

--
-- Indexes for table `tblEmailAddress`
--
ALTER TABLE `tblEmailAddress`
  ADD PRIMARY KEY (`emailID`);

--
-- Indexes for table `tblEmpAddress`
--
ALTER TABLE `tblEmpAddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relAddressID` (`relAddressID`),
  ADD KEY `relEMPID_fk` (`relEMPID`),
  ADD KEY `relParishID` (`relParishID`);

--
-- Indexes for table `tblEmpContact`
--
ALTER TABLE `tblEmpContact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relEmpID_idx` (`relEmpID`),
  ADD KEY `relPhoneID_idx` (`relPhoneID`);

--
-- Indexes for table `tblEmpContract`
--
ALTER TABLE `tblEmpContract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relContractID` (`relContractID`),
  ADD KEY `eID` (`relEmpID`);

--
-- Indexes for table `tblEmpDepartment`
--
ALTER TABLE `tblEmpDepartment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relDeptIDFK` (`relDeptID`),
  ADD KEY `relEmpIDFK` (`relEmpID`);

--
-- Indexes for table `tblEmpEmail`
--
ALTER TABLE `tblEmpEmail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relEmpID_idx` (`relEmpID`),
  ADD KEY `relEmailID_idx` (`relEmailID`);

--
-- Indexes for table `tblEmpJob`
--
ALTER TABLE `tblEmpJob`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empID` (`relEmpID`),
  ADD KEY `jobID` (`relJobID`);

--
-- Indexes for table `tblEmpLeave`
--
ALTER TABLE `tblEmpLeave`
  ADD PRIMARY KEY (`idLeave`),
  ADD KEY `relLeaveID_idx` (`relLeaveID`),
  ADD KEY `eIDFK` (`relEmpID`);

--
-- Indexes for table `tblEmployees`
--
ALTER TABLE `tblEmployees`
  ADD PRIMARY KEY (`empID`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `trn_UNIQUE` (`trn`),
  ADD UNIQUE KEY `nis_UNIQUE` (`nis`),
  ADD KEY `relGender_idx` (`relGender`);

--
-- Indexes for table `tblGender`
--
ALTER TABLE `tblGender`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblJobs`
--
ALTER TABLE `tblJobs`
  ADD PRIMARY KEY (`jobID`);

--
-- Indexes for table `tblLeaveType`
--
ALTER TABLE `tblLeaveType`
  ADD PRIMARY KEY (`idType`),
  ADD UNIQUE KEY `leaveName_UNIQUE` (`leaveName`);

--
-- Indexes for table `tblParish`
--
ALTER TABLE `tblParish`
  ADD PRIMARY KEY (`parishID`),
  ADD UNIQUE KEY `parishName_UNIQUE` (`parishName`);

--
-- Indexes for table `tblrole`
--
ALTER TABLE `tblrole`
  ADD PRIMARY KEY (`role_id`,`role_name`),
  ADD UNIQUE KEY `role_name_UNIQUE` (`role_name`);

--
-- Indexes for table `tblUserLogs`
--
ALTER TABLE `tblUserLogs`
  ADD PRIMARY KEY (`idLogs`),
  ADD KEY `relUserID_idx` (`relUserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD KEY `role_id_fk_idx` (`userRole`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblAddress`
--
ALTER TABLE `tblAddress`
  MODIFY `addressID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblContactNumbers`
--
ALTER TABLE `tblContactNumbers`
  MODIFY `phoneID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblContract`
--
ALTER TABLE `tblContract`
  MODIFY `contractID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmailAddress`
--
ALTER TABLE `tblEmailAddress`
  MODIFY `emailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpAddress`
--
ALTER TABLE `tblEmpAddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpContract`
--
ALTER TABLE `tblEmpContract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpDepartment`
--
ALTER TABLE `tblEmpDepartment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpEmail`
--
ALTER TABLE `tblEmpEmail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpJob`
--
ALTER TABLE `tblEmpJob`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmpLeave`
--
ALTER TABLE `tblEmpLeave`
  MODIFY `idLeave` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblEmployees`
--
ALTER TABLE `tblEmployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblGender`
--
ALTER TABLE `tblGender`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblJobs`
--
ALTER TABLE `tblJobs`
  MODIFY `jobID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblLeaveType`
--
ALTER TABLE `tblLeaveType`
  MODIFY `idType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblParish`
--
ALTER TABLE `tblParish`
  MODIFY `parishID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblrole`
--
ALTER TABLE `tblrole`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblUserLogs`
--
ALTER TABLE `tblUserLogs`
  MODIFY `idLogs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblEmpAddress`
--
ALTER TABLE `tblEmpAddress`
  ADD CONSTRAINT `relAddressID` FOREIGN KEY (`relAddressID`) REFERENCES `tblAddress` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relEMPID_fk` FOREIGN KEY (`relEMPID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relParishID` FOREIGN KEY (`relParishID`) REFERENCES `tblParish` (`parishID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpContact`
--
ALTER TABLE `tblEmpContact`
  ADD CONSTRAINT `relEmpID` FOREIGN KEY (`relEmpID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relPhoneID` FOREIGN KEY (`relPhoneID`) REFERENCES `tblContactNumbers` (`phoneID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpContract`
--
ALTER TABLE `tblEmpContract`
  ADD CONSTRAINT `eID` FOREIGN KEY (`relEmpID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relContractID` FOREIGN KEY (`relContractID`) REFERENCES `tblContract` (`contractID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpDepartment`
--
ALTER TABLE `tblEmpDepartment`
  ADD CONSTRAINT `relDeptIDFK` FOREIGN KEY (`relDeptID`) REFERENCES `tblDepartments` (`deptID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `relEmpIDFK` FOREIGN KEY (`relEmpID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpEmail`
--
ALTER TABLE `tblEmpEmail`
  ADD CONSTRAINT `relEmailID` FOREIGN KEY (`relEmailID`) REFERENCES `tblEmailAddress` (`emailID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpJob`
--
ALTER TABLE `tblEmpJob`
  ADD CONSTRAINT `empID` FOREIGN KEY (`relEmpID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jobID` FOREIGN KEY (`relJobID`) REFERENCES `tblJobs` (`jobID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmpLeave`
--
ALTER TABLE `tblEmpLeave`
  ADD CONSTRAINT `eIDFK` FOREIGN KEY (`relEmpID`) REFERENCES `tblEmployees` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relLeaveID` FOREIGN KEY (`relLeaveID`) REFERENCES `tblLeaveType` (`idType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblEmployees`
--
ALTER TABLE `tblEmployees`
  ADD CONSTRAINT `relGender` FOREIGN KEY (`relGender`) REFERENCES `tblGender` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tblemployees_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `tblEmpEmail` (`relEmpID`);

--
-- Constraints for table `tblUserLogs`
--
ALTER TABLE `tblUserLogs`
  ADD CONSTRAINT `relUserID` FOREIGN KEY (`relUserID`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `usergroup` FOREIGN KEY (`userRole`) REFERENCES `tblrole` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;