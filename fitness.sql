-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2024 at 01:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_date` date NOT NULL,
  `activity_type` enum('workout','meal') NOT NULL,
  `activity_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `user_id`, `activity_date`, `activity_type`, `activity_details`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-06-01', 'workout', 'Performed Full Body Workout routine.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(2, 1, '2023-06-02', 'meal', 'Ate Grilled Chicken Salad for lunch.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(3, 2, '2023-06-01', 'workout', 'Completed HIIT Cardio session.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(4, 2, '2023-06-02', 'meal', 'Had Protein Smoothie after workout.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(7, 3, '2024-06-29', '', 'gig', '2024-06-29 10:03:04', '2024-06-29 10:03:04'),
(8, 3, '2024-06-29', '', 'gig', '2024-06-29 10:03:43', '2024-06-29 10:03:43'),
(9, 3, '2024-06-29', 'meal', 'gig', '2024-06-29 10:08:59', '2024-06-29 10:08:59'),
(10, 3, '2024-06-29', '', 'gig', '2024-06-29 10:11:56', '2024-06-29 10:11:56'),
(11, 3, '2024-06-29', 'workout', 'abcd', '2024-06-29 10:12:28', '2024-06-29 10:12:28'),
(12, 1, '2024-06-29', 'meal', 'abcd\r\n', '2024-06-29 10:19:17', '2024-06-29 10:19:17'),
(13, 4, '2024-06-29', 'workout', 'abcd\r\n', '2024-06-29 10:57:03', '2024-06-29 10:57:03'),
(14, 4, '2024-06-29', 'workout', 'abcd', '2024-06-29 11:40:07', '2024-06-29 11:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `exercise_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `exercise_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`exercise_id`, `plan_id`, `exercise_name`, `description`, `video_url`, `created_at`, `updated_at`) VALUES
(3, 2, 'Burpees', 'Perform 4 sets of 20 reps each with 1-minute rest between sets.', 'https://example.com/burpees', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(4, 2, 'Mountain Climbers', 'Perform 3 sets of 30 seconds each with 15 seconds rest between sets.', 'https://example.com/mountainclimbers', '2024-06-29 08:08:27', '2024-06-29 08:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `meal_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `meal_name` varchar(100) NOT NULL,
  `nutritional_info` text DEFAULT NULL,
  `recipe` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`meal_id`, `plan_id`, `meal_name`, `nutritional_info`, `recipe`, `created_at`, `updated_at`) VALUES
(1, 1, 'Grilled Chicken Salad', 'Calories: 350, Protein: 30g, Carbs: 15g, Fat: 20g', 'Grill chicken breast and mix with fresh vegetables and olive oil.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(2, 1, 'Protein Smoothie', 'Calories: 250, Protein: 25g, Carbs: 30g, Fat: 5g', 'Blend protein powder, almond milk, banana, and spinach.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(3, 2, 'Vegetable Stir-fry', 'Calories: 300, Protein: 15g, Carbs: 25g, Fat: 12g', 'Stir-fry mixed vegetables with tofu or chicken in olive oil.', '2024-06-29 08:08:27', '2024-06-29 08:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition_plans`
--

CREATE TABLE `nutrition_plans` (
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `dietary_preferences` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nutrition_plans`
--

INSERT INTO `nutrition_plans` (`plan_id`, `user_id`, `plan_name`, `dietary_preferences`, `created_at`, `updated_at`) VALUES
(1, 1, 'High Protein Diet', 'Focus on lean meats, fish, and plant-based proteins.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(2, 2, 'Low Carb Diet', 'Limit carbohydrates and focus on vegetables, lean proteins, and healthy fats.', '2024-06-29 08:08:27', '2024-06-29 08:08:27'),
(12, 4, '2', NULL, '2024-06-29 11:09:05', '2024-06-29 11:09:05'),
(13, 4, '12', NULL, '2024-06-29 11:09:31', '2024-06-29 11:09:31'),
(14, 4, '2', NULL, '2024-06-29 11:16:45', '2024-06-29 11:16:45'),
(19, 4, '1', NULL, '2024-06-29 11:26:11', '2024-06-29 11:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('user','trainer','admin') NOT NULL DEFAULT 'user',
  `age` int(11) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `fitness_goals` text DEFAULT NULL,
  `health_conditions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `role`, `age`, `gender`, `weight`, `height`, `fitness_goals`, `health_conditions`, `created_at`, `updated_at`) VALUES
(1, 'john_doe', 'password123', 'john@example.com', 'user', 30, 'male', 75.5, 180, 'Build muscle mass', 'None', '2024-06-29 08:08:26', '2024-06-29 08:08:26'),
(2, 'jane_smith', 'securepass', 'jane@example.com', 'user', 28, 'female', 60, 165, 'Lose weight and tone up', 'High blood pressure', '2024-06-29 08:08:26', '2024-06-29 08:08:26'),
(3, 'dhruvi', '123456', 'd@gmail.com', 'admin', 23, 'female', 56, 234, 'weight lose', 'good', '2024-06-29 08:39:49', '2024-06-29 08:43:53'),
(4, 'krisa', '123456', 'shahnamya66@gmail.com', 'user', 45, 'female', 78, 231, 'ggkhjgk', 'ggkg', '2024-06-29 10:47:48', '2024-06-29 10:47:48');

-- --------------------------------------------------------

--
-- Table structure for table `workout_plans`
--

CREATE TABLE `workout_plans` (
  `plan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `difficulty` enum('beginner','intermediate','advanced') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_plans`
--

INSERT INTO `workout_plans` (`plan_id`, `user_id`, `plan_name`, `difficulty`, `created_at`, `updated_at`) VALUES
(2, 2, 'HIIT Cardio', 'advanced', '2024-06-29 08:08:26', '2024-06-29 08:08:26'),
(6, 2, 'karela_juice', 'advanced', '2024-06-29 09:22:46', '2024-06-29 11:37:48'),
(7, 2, 'karela_juice', 'advanced', '2024-06-29 09:23:04', '2024-06-29 09:23:04'),
(8, 4, '2', 'beginner', '2024-06-29 11:18:21', '2024-06-29 11:18:21'),
(9, 4, '2', 'beginner', '2024-06-29 11:18:52', '2024-06-29 11:18:52'),
(10, 4, '1', 'beginner', '2024-06-29 11:22:55', '2024-06-29 11:22:55'),
(12, 2, 'new', 'beginner', '2024-06-29 11:37:57', '2024-06-29 11:37:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`exercise_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`meal_id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `nutrition_plans`
--
ALTER TABLE `nutrition_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `exercise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `meal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nutrition_plans`
--
ALTER TABLE `nutrition_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workout_plans`
--
ALTER TABLE `workout_plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `workout_plans` (`plan_id`) ON DELETE CASCADE;

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `meals_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `nutrition_plans` (`plan_id`) ON DELETE CASCADE;

--
-- Constraints for table `nutrition_plans`
--
ALTER TABLE `nutrition_plans`
  ADD CONSTRAINT `nutrition_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_plans`
--
ALTER TABLE `workout_plans`
  ADD CONSTRAINT `workout_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
