-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2025 at 02:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meritup_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `year_id` int(11) NOT NULL,
  `year_code` varchar(10) NOT NULL COMMENT 'e.g., 2024-2025',
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `status` enum('active','completed','upcoming') DEFAULT 'upcoming',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`year_id`, `year_code`, `start_year`, `end_year`, `status`, `created_at`) VALUES
(1, '2024-2025', 2024, 2025, 'active', '2025-11-05 15:25:49'),
(2, '2025-2026', 2025, 2026, 'upcoming', '2025-11-05 15:26:15'),
(3, '2026-2027', 2026, 2027, 'upcoming', '2025-11-05 15:26:24'),
(4, '2027-2028', 2027, 2028, 'upcoming', '2025-11-05 15:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `certificate_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `period_id` int(11) DEFAULT NULL,
  `certificate_name` varchar(200) NOT NULL,
  `certificate_type` enum('local','regional','national') DEFAULT NULL,
  `organizer` varchar(200) DEFAULT NULL,
  `duration_start` date DEFAULT NULL,
  `duration_end` date DEFAULT NULL,
  `points_value` decimal(5,2) NOT NULL DEFAULT 0.00,
  `certificate_image` longblob DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `evaluator_id` int(11) DEFAULT NULL,
  `submitted_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `evaluated_date` timestamp NULL DEFAULT NULL,
  `evaluator_comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Computer Science', 'Computer Science Department', '2025-10-17 09:20:34', '2025-10-17 09:20:34'),
(2, 'Computer Engineering', 'Computer Engineering Department', '2025-10-17 09:20:34', '2025-11-12 01:41:55'),
(3, 'Tourism', 'Tourism Department', '2025-10-17 09:20:34', '2025-11-12 01:41:55'),
(4, 'Nursing', 'Nursing Department', '2025-10-17 09:20:34', '2025-11-12 01:41:55'),
(5, 'Human Resources', 'Human Resources Department', '2025-10-17 09:20:34', '2025-11-12 01:41:55'),
(6, 'Registrar', 'Registrar Department', '2025-10-17 09:20:34', '2025-11-12 01:41:55'),
(7, 'Library', 'Library Department', '2025-10-17 09:20:34', '2025-11-12 01:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_periods`
--

CREATE TABLE `evaluation_periods` (
  `period_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `period_name` varchar(50) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `semester` enum('1st','2nd') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','completed','upcoming') DEFAULT 'upcoming',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_periods`
--

INSERT INTO `evaluation_periods` (`period_id`, `year_id`, `period_name`, `academic_year`, `semester`, `start_date`, `end_date`, `status`, `created_at`) VALUES
(1, 1, '1st Semester 2023-2024', '2024-2025', '1st', '2024-01-13', '2024-11-02', 'active', '2025-11-05 15:28:54'),
(2, 1, '2nd Semester 2023-2024', '2024-2025', '2nd', '2024-12-01', '2025-01-04', 'upcoming', '2025-11-05 15:29:56'),
(3, 2, '1st Semester 2025-2026', '2025-2026', '1st', '2025-01-13', '2025-11-02', 'upcoming', '2025-11-05 15:30:48'),
(4, 2, '2nd Semester 2025-2026', '2025-2026', '2nd', '2025-12-01', '2026-01-04', 'upcoming', '2025-11-05 15:31:57'),
(5, 3, '1st Semester 2026-2027', '2026-2027', '1st', '2026-01-13', '2026-11-02', 'upcoming', '2025-11-05 15:35:56'),
(6, 3, '2nd Semester 2026-2027', '2026-2027', '2nd', '2026-12-01', '2027-01-04', 'upcoming', '2025-11-05 15:37:00'),
(7, 4, '1st Semester 2027-2028', '2027-2028', '1st', '2027-01-13', '2027-11-02', 'upcoming', '2025-11-05 15:38:17'),
(8, 4, '2nd Semester 2027-2028', '2027-2028', '2nd', '2027-12-01', '2028-01-04', 'upcoming', '2025-11-05 15:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `nonteaching_evaluations`
--

CREATE TABLE `nonteaching_evaluations` (
  `evaluation_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `evaluator_user_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `excu_absences_without_pay` decimal(6,2) DEFAULT 0.00,
  `tardiness` decimal(6,2) NOT NULL DEFAULT 0.00,
  `minutes_late` decimal(6,2) NOT NULL DEFAULT 0.00,
  `seminar` decimal(6,2) NOT NULL DEFAULT 0.00,
  `institutional_involvement` decimal(6,2) NOT NULL DEFAULT 0.00,
  `community_involvement` decimal(6,2) NOT NULL DEFAULT 0.00,
  `work_experience` decimal(6,2) NOT NULL DEFAULT 0.00,
  `final_total_points` decimal(8,2) DEFAULT 0.00,
  `evaluation_status` enum('draft','pending','completed') DEFAULT 'pending',
  `evaluation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_date` timestamp NULL DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nonteaching_yearly_points`
--

CREATE TABLE `nonteaching_yearly_points` (
  `yearly_points_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `productivity` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 25 points',
  `attitude` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 25 points',
  `promotional_competence` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 25 points',
  `attendance` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 15 points',
  `professional_advancement` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 3 points',
  `institutional_involvement` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 2 points',
  `community_involvement` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 3 points',
  `work_experience` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 2 points',
  `total_points` decimal(8,2) DEFAULT 0.00 COMMENT 'Total points for the year (Max 100)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peer_evaluations`
--

CREATE TABLE `peer_evaluations` (
  `peer_eval_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `nonteaching_evaluation_id` int(11) DEFAULT NULL,
  `quality_of_work` int(2) DEFAULT 0,
  `quantity_of_work` int(2) DEFAULT 0,
  `job_knowledge` int(2) DEFAULT 0,
  `initiative` int(2) DEFAULT 0,
  `reliability` int(2) DEFAULT 0,
  `job_attitude` int(2) DEFAULT 0,
  `work_habits` int(2) DEFAULT 0,
  `personal_relation` int(2) DEFAULT 0,
  `integrity` int(2) DEFAULT 0,
  `self_discipline` int(2) DEFAULT 0,
  `ability_to_learn` int(2) DEFAULT 0,
  `ability_to_organize` int(2) DEFAULT 0,
  `cooperation` int(2) DEFAULT 0,
  `development_orientation` int(2) DEFAULT 0,
  `planning_capability` int(2) DEFAULT 0,
  `peer_total` decimal(4,2) DEFAULT 0.00,
  `evaluation_status` enum('draft','submitted','completed') DEFAULT 'draft',
  `evaluation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `submitted_date` timestamp NULL DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peer_evaluation_assignments`
--

CREATE TABLE `peer_evaluation_assignments` (
  `assignment_id` int(11) NOT NULL,
  `evaluatee_staff_id` int(11) NOT NULL,
  `evaluator_staff_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `evaluator_type` enum('department_head','same_department_peer','outsider') NOT NULL,
  `assignment_status` enum('pending','in_progress','completed','overdue') DEFAULT 'pending',
  `assigned_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_date` timestamp NULL DEFAULT NULL,
  `assigned_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `employment_type` enum('full_time','part_time') DEFAULT 'full_time',
  `category_id` int(11) NOT NULL,
  `department_head_id` int(11) DEFAULT NULL,
  `is_department_head` tinyint(1) DEFAULT 0 COMMENT 'only for non-teaching employees(teaching employee can''t be head if there''s already a dept head)',
  `status` enum('active','inactive','archived') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_categories`
--

CREATE TABLE `staff_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_categories`
--

INSERT INTO `staff_categories` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'Teaching', 'Faculty members who handle classes'),
(2, 'Non-Teaching', 'Administrative and support personnel');

-- --------------------------------------------------------

--
-- Table structure for table `teaching_evaluations`
--

CREATE TABLE `teaching_evaluations` (
  `evaluation_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `evaluator_user_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `dean_eval` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 7 points',
  `student_eval` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 7 points',
  `peer_eval` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 6 points',
  `committee_chair_eval` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 5 points',
  `dept_head_eval` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 10 points',
  `seminar_attendance` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 3 points - can be auto from certificates or manual',
  `publications` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 3 points',
  `scholarly_achievement` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 3 points',
  `research_conducted` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 3 points',
  `graduate_units` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 5 points',
  `teaching_experience` decimal(5,2) DEFAULT 0.00 COMMENT 'Max 2 points',
  `total_points` decimal(8,2) DEFAULT 0.00 COMMENT 'Sum of all above',
  `evaluation_status` enum('draft','pending','completed') DEFAULT 'pending',
  `evaluation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_date` timestamp NULL DEFAULT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_yearly_points`
--

CREATE TABLE `teaching_yearly_points` (
  `yearly_points_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `teaching_competence` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 20 points',
  `effectiveness` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 15 points',
  `professional_growth` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 15 points',
  `teaching_experience` decimal(6,2) DEFAULT 0.00 COMMENT 'Max 2 points',
  `total_points` decimal(8,2) DEFAULT 0.00 COMMENT 'Total points for the year (Max 52)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `email`, `role_id`, `staff_id`, `is_active`, `last_login`, `created_at`) VALUES
(1, 'superadmin', '$2b$12$/D4e/e1Yx69tKK0tqwFv7u3Uu93OiGjLFt/YC2/titkwGqRRN6vOy', 'superadmin@email.com', 5, NULL, 1, '2025-11-05 16:53:31', '2025-11-05 15:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`role_id`, `role_name`, `role_description`, `created_at`) VALUES
(1, 'Teaching Evaluator', 'Department Head for Teaching Employees', '2025-10-12 07:58:09'),
(2, 'Non-Teaching Evaluator', 'HR Head responsible for non-teaching staff', '2025-10-12 07:58:09'),
(3, 'Teaching Employee', 'Teaching staff being evaluated', '2025-10-12 07:58:09'),
(4, 'Non-Teaching Employee', 'Non-teaching staff being evaluated', '2025-10-12 07:58:09'),
(5, 'Super_Admin', 'The one who handles all of the users of the system', '2025-11-05 06:21:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`year_id`),
  ADD UNIQUE KEY `year_code` (`year_code`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificate_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `evaluator_id` (`evaluator_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Indexes for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  ADD PRIMARY KEY (`period_id`),
  ADD UNIQUE KEY `unique_year_semester` (`year_id`,`semester`);

--
-- Indexes for table `nonteaching_evaluations`
--
ALTER TABLE `nonteaching_evaluations`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD UNIQUE KEY `unique_staff_period` (`staff_id`,`period_id`),
  ADD KEY `evaluator_user_id` (`evaluator_user_id`),
  ADD KEY `period_id` (`period_id`);

--
-- Indexes for table `nonteaching_yearly_points`
--
ALTER TABLE `nonteaching_yearly_points`
  ADD PRIMARY KEY (`yearly_points_id`),
  ADD UNIQUE KEY `unique_staff_year` (`staff_id`,`academic_year_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `academic_year_id` (`academic_year_id`);

--
-- Indexes for table `peer_evaluations`
--
ALTER TABLE `peer_evaluations`
  ADD PRIMARY KEY (`peer_eval_id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `nonteaching_evaluation_id` (`nonteaching_evaluation_id`);

--
-- Indexes for table `peer_evaluation_assignments`
--
ALTER TABLE `peer_evaluation_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD UNIQUE KEY `unique_assignment` (`evaluatee_staff_id`,`evaluator_staff_id`,`period_id`),
  ADD KEY `evaluator_staff_id` (`evaluator_staff_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `assigned_by_user_id` (`assigned_by_user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `department_head_id` (`department_head_id`),
  ADD KEY `fk_staff_department` (`department_id`);

--
-- Indexes for table `staff_categories`
--
ALTER TABLE `staff_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `teaching_evaluations`
--
ALTER TABLE `teaching_evaluations`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD UNIQUE KEY `unique_staff_period` (`staff_id`,`period_id`),
  ADD KEY `evaluator_user_id` (`evaluator_user_id`),
  ADD KEY `period_id` (`period_id`);

--
-- Indexes for table `teaching_yearly_points`
--
ALTER TABLE `teaching_yearly_points`
  ADD PRIMARY KEY (`yearly_points_id`),
  ADD UNIQUE KEY `unique_staff_year` (`staff_id`,`academic_year_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `academic_year_id` (`academic_year_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `year_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `certificate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nonteaching_evaluations`
--
ALTER TABLE `nonteaching_evaluations`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nonteaching_yearly_points`
--
ALTER TABLE `nonteaching_yearly_points`
  MODIFY `yearly_points_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peer_evaluations`
--
ALTER TABLE `peer_evaluations`
  MODIFY `peer_eval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peer_evaluation_assignments`
--
ALTER TABLE `peer_evaluation_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_categories`
--
ALTER TABLE `staff_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teaching_evaluations`
--
ALTER TABLE `teaching_evaluations`
  MODIFY `evaluation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teaching_yearly_points`
--
ALTER TABLE `teaching_yearly_points`
  MODIFY `yearly_points_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`period_id`) REFERENCES `evaluation_periods` (`period_id`),
  ADD CONSTRAINT `certificates_ibfk_3` FOREIGN KEY (`evaluator_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `evaluation_periods`
--
ALTER TABLE `evaluation_periods`
  ADD CONSTRAINT `evaluation_periods_ibfk_1` FOREIGN KEY (`year_id`) REFERENCES `academic_years` (`year_id`);

--
-- Constraints for table `nonteaching_evaluations`
--
ALTER TABLE `nonteaching_evaluations`
  ADD CONSTRAINT `nonteaching_evaluations_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `nonteaching_evaluations_ibfk_2` FOREIGN KEY (`evaluator_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `nonteaching_evaluations_ibfk_3` FOREIGN KEY (`period_id`) REFERENCES `evaluation_periods` (`period_id`);

--
-- Constraints for table `nonteaching_yearly_points`
--
ALTER TABLE `nonteaching_yearly_points`
  ADD CONSTRAINT `nonteaching_yearly_points_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nonteaching_yearly_points_ibfk_2` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`year_id`) ON DELETE CASCADE;

--
-- Constraints for table `peer_evaluations`
--
ALTER TABLE `peer_evaluations`
  ADD CONSTRAINT `peer_evaluations_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `peer_evaluation_assignments` (`assignment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peer_evaluations_ibfk_2` FOREIGN KEY (`nonteaching_evaluation_id`) REFERENCES `nonteaching_evaluations` (`evaluation_id`) ON DELETE CASCADE;

--
-- Constraints for table `peer_evaluation_assignments`
--
ALTER TABLE `peer_evaluation_assignments`
  ADD CONSTRAINT `peer_evaluation_assignments_ibfk_1` FOREIGN KEY (`evaluatee_staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `peer_evaluation_assignments_ibfk_2` FOREIGN KEY (`evaluator_staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `peer_evaluation_assignments_ibfk_3` FOREIGN KEY (`period_id`) REFERENCES `evaluation_periods` (`period_id`),
  ADD CONSTRAINT `peer_evaluation_assignments_ibfk_4` FOREIGN KEY (`assigned_by_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `staff_categories` (`category_id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`department_head_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `teaching_evaluations`
--
ALTER TABLE `teaching_evaluations`
  ADD CONSTRAINT `teaching_evaluations_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `teaching_evaluations_ibfk_2` FOREIGN KEY (`evaluator_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `teaching_evaluations_ibfk_3` FOREIGN KEY (`period_id`) REFERENCES `evaluation_periods` (`period_id`);

--
-- Constraints for table `teaching_yearly_points`
--
ALTER TABLE `teaching_yearly_points`
  ADD CONSTRAINT `teaching_yearly_points_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaching_yearly_points_ibfk_2` FOREIGN KEY (`academic_year_id`) REFERENCES `academic_years` (`year_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
