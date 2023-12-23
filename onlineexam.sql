-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 05, 2022 at 09:55 AM
-- Server version: 5.5.62
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` mediumtext,
  `password` mediumtext,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `status`) VALUES
(1, 'sameera gajanayaka', 'sameeragajanayaka@gmail.com', 'ABC123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `name`, `status`) VALUES
(1, 'Batch1', 1),
(2, 'Batch2', 1),
(3, 'Batch3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `batch_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `datetime`, `duration`, `status`, `batch_id`, `admin_id`, `paper_id`) VALUES
(1, 'zxzxcsdsd', '2022-11-05 10:30:22', 600, 1, 3, 1, 3),
(2, 'sdsds', '2022-11-05 13:06:00', 10, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `examinator`
--

CREATE TABLE `examinator` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` mediumtext,
  `mobile` varchar(45) DEFAULT NULL,
  `password` mediumtext,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examinator`
--

INSERT INTO `examinator` (`id`, `name`, `email`, `mobile`, `password`, `status`) VALUES
(1, 'sameera gajanayaka', 'sameeragajanayaka@gmail.com', '0774022268', 'ABC123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `examinator_subject`
--

CREATE TABLE `examinator_subject` (
  `id` int(11) NOT NULL,
  `examinator_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `examinator_subject`
--

INSERT INTO `examinator_subject` (`id`, `examinator_id`, `subject_id`, `status`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paper`
--

CREATE TABLE `paper` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `qcount` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `examinator_subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paper`
--

INSERT INTO `paper` (`id`, `name`, `qcount`, `status`, `examinator_subject_id`) VALUES
(1, 'Ict mid', 10, 1, 1),
(2, 'Ict end', 5, 1, 1),
(3, 'Php mid', 25, 1, 2),
(4, 'Php end', 23, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proctor`
--

CREATE TABLE `proctor` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` mediumtext,
  `mobile` varchar(45) DEFAULT NULL,
  `password` mediumtext,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proctor`
--

INSERT INTO `proctor` (`id`, `name`, `email`, `mobile`, `password`, `status`) VALUES
(1, 'sameera gajanayaka', 'sameeragajanayaka@gmail.com', '0774022268', 'ABC123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa`
--

CREATE TABLE `qa` (
  `id` bigint(20) NOT NULL,
  `question` mediumtext,
  `a` mediumtext,
  `b` mediumtext,
  `c` mediumtext,
  `d` mediumtext,
  `correct` mediumtext,
  `status` tinyint(4) DEFAULT NULL,
  `paper_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa`
--

INSERT INTO `qa` (`id`, `question`, `a`, `b`, `c`, `d`, `correct`, `status`, `paper_id`) VALUES
(8, 'asasasadads', 'asdadasdasdasdas', 'asdasdada', 'asdadasas', 'asdadsada', 'asdadsadadad', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` bigint(20) NOT NULL,
  `result` double DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rules`
--

CREATE TABLE `rules` (
  `id` int(11) NOT NULL,
  `data` mediumtext,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules`
--

INSERT INTO `rules` (`id`, `data`, `status`) VALUES
(1, 'Nishan', 1),
(2, 'sameera', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` mediumtext,
  `mobile` varchar(45) DEFAULT NULL,
  `password` mediumtext,
  `status` tinyint(4) DEFAULT NULL,
  `batch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `mobile`, `password`, `status`, `batch_id`) VALUES
(1, 'sameera gajanayaka', 'sameeragajanayaka@gmail.com', '0774022268', 'ABC123', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `status`) VALUES
(1, 'ICT', 1),
(2, 'Java', 1),
(3, 'Php', 1),
(4, 'Html', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_exam_batch_idx` (`batch_id`),
  ADD KEY `fk_exam_admin1_idx` (`admin_id`),
  ADD KEY `fk_exam_paper1_idx` (`paper_id`);

--
-- Indexes for table `examinator`
--
ALTER TABLE `examinator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `examinator_subject`
--
ALTER TABLE `examinator_subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_examinator_has_subject_subject1_idx` (`subject_id`),
  ADD KEY `fk_examinator_has_subject_examinator1_idx` (`examinator_id`);

--
-- Indexes for table `paper`
--
ALTER TABLE `paper`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paper_examinator_subject1_idx` (`examinator_subject_id`);

--
-- Indexes for table `proctor`
--
ALTER TABLE `proctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qa`
--
ALTER TABLE `qa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_qa_paper1_idx` (`paper_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_result_student1_idx` (`student_id`),
  ADD KEY `fk_result_exam1_idx` (`exam_id`);

--
-- Indexes for table `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_student_batch1_idx` (`batch_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `examinator`
--
ALTER TABLE `examinator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `examinator_subject`
--
ALTER TABLE `examinator_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `paper`
--
ALTER TABLE `paper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `proctor`
--
ALTER TABLE `proctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qa`
--
ALTER TABLE `qa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `fk_exam_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_exam_admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_exam_paper1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `examinator_subject`
--
ALTER TABLE `examinator_subject`
  ADD CONSTRAINT `fk_examinator_has_subject_examinator1` FOREIGN KEY (`examinator_id`) REFERENCES `examinator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_examinator_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `paper`
--
ALTER TABLE `paper`
  ADD CONSTRAINT `fk_paper_examinator_subject1` FOREIGN KEY (`examinator_subject_id`) REFERENCES `examinator_subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `qa`
--
ALTER TABLE `qa`
  ADD CONSTRAINT `fk_qa_paper1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `fk_result_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_result_exam1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_batch1` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
