-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2024 at 03:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_billing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(5, 'Meal', 'The food served and eaten especially at one of the customary, regular occasions for taking food during the day, as breakfast, lunch, or supper.'),
(6, 'Beverage', 'A beverage includes all types of edible drinks. From tea to coffee and various juices, mocktails, cocktails, soft drinks.'),
(7, 'Salads', 'A salad is a dish consisting of mixed ingredients, frequently vegetables.'),
(8, 'Desserts', 'A dessert is a type of food that is eaten after lunch or dinner, and sometimes after a light meal or snack'),
(9, 'Soups', 'Soup is a primarily liquid food, generally served warm or hot, that is made by combining ingredients of meat or vegetables with stock, milk, or water.'),
(10, 'Pizza', 'Pizza is a traditional Italian dish typically consisting of a flat base of leavened wheat-based dough topped with tomato, cheese, and other ingredients, baked at a high temperature, traditionally in a wood-fired oven.'),
(11, 'Short Eats', 'Quick Serve');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`) VALUES
(13, '973423691632', 750, 1000, 1, '2024-06-16 14:13:00'),
(14, '010313152027', 900, 5000, 2, '2024-06-16 14:15:19'),
(15, '837199444302', 1600, 0, 0, '2024-06-16 14:15:42'),
(16, '408978865260', 600, 600, 3, '2024-06-16 14:16:27'),
(17, '307903766923', 150, 500, 4, '2024-06-16 14:16:58'),
(20, '257237636711', 390, 500, 0, '2024-06-16 14:18:06'),
(22, '465919435130', 550, 1000, 123, '2024-07-07 09:04:23'),
(23, '803251861254', 340, 500, 102, '2024-07-07 16:19:48'),
(24, '572455673403', 350, 600, 103, '2024-07-07 16:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`) VALUES
(15, 13, 12, 1, 550, 550),
(16, 13, 27, 1, 200, 200),
(17, 14, 9, 1, 600, 600),
(18, 14, 35, 1, 300, 300),
(19, 15, 8, 1, 1000, 1000),
(20, 15, 14, 1, 600, 600),
(21, 16, 35, 2, 300, 600),
(22, 17, 17, 5, 150, 750),
(26, 20, 20, 1, 120, 120),
(27, 20, 17, 1, 150, 150),
(28, 20, 22, 1, 120, 120),
(30, 22, 12, 1, 550, 550),
(31, 22, 24, 2, 200, 400),
(32, 23, 39, 2, 50, 100),
(33, 23, 40, 3, 80, 240),
(34, 24, 31, 1, 350, 350);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Unavailable,1=Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`) VALUES
(5, 5, 'Rice & Curry - Chicken ', 'WITH Chicken ', 500, 1),
(6, 5, 'Rice & Curry - Fish', 'WITH FISH', 400, 1),
(7, 5, 'Rice & Curry - Vegetable', 'WITH VEGETABLE', 350, 1),
(8, 5, 'Mix Rice', 'Chicken, Pork, Sea Food, Sausages', 1000, 1),
(9, 5, 'Kottu - Chicken', 'With Chicken', 600, 1),
(10, 5, 'Kottu - Egg', 'With Egg', 500, 1),
(11, 5, 'Kottu - Vegetable', 'With Vegitable', 400, 1),
(12, 5, 'Fried Rice', 'Chicken, Egg, Vegi ', 550, 1),
(13, 5, 'Fried Rice - Set Menu', 'With Chicken, Chop Suey, Chili Paste', 500, 1),
(14, 5, 'Noodles', 'Chicken, Egg, Vegetable', 600, 1),
(15, 5, 'Biriyani', 'Basmathi Rice', 750, 1),
(17, 6, 'Milk Tea', 'Milk Tea', 150, 1),
(18, 6, 'Tea', 'Tea', 50, 1),
(19, 6, 'Coffee', 'Coffee', 100, 1),
(20, 6, 'Nescafe', 'Nescafe', 120, 1),
(21, 6, 'Orange Juice', 'Orange Juice', 150, 1),
(22, 6, 'Avocado Juice ', 'Avocado Juice ', 120, 1),
(23, 6, 'Papaya Juice ', 'Papaya Juice ', 130, 1),
(24, 8, ' Pudding', ' Pudding', 200, 1),
(25, 8, ' Chocolate Mousse', ' Chocolate Mousse', 250, 1),
(26, 8, 'Yogurt', 'Yogurt', 75, 1),
(27, 8, 'Watalappam', 'Watalappam', 200, 1),
(29, 8, 'Kiri Pani Ice Cream', 'Kiri Pani Ice Cream', 150, 1),
(30, 6, 'Sprite 250ml', 'Sprite 250ml', 150, 1),
(31, 7, 'Caesar Salad', 'Caesar Salad', 350, 1),
(32, 7, 'Caprese Salad', 'Caprese Salad', 300, 1),
(33, 7, 'Macaroni Salad', 'Macaroni Salad', 450, 1),
(34, 9, 'Vegetable Sourp', 'Vegetable Sourp', 200, 1),
(35, 9, 'Chicken Soups', 'Chicken Soups', 300, 1),
(36, 10, 'Chilli Chicken Pizza - L', 'Chilli Chicken Pizza', 3200, 1),
(37, 10, 'Hot & Spicy Chicken - L', 'Hot & Spicy Chicken - L', 3500, 1),
(38, 10, 'Devilled Chicken - L', 'Devilled Chicken', 3400, 1),
(39, 11, 'Cutlet', 'Vegetable', 50, 1),
(40, 11, 'Rolls', 'Fish Roles', 80, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'CAFÉ MANAGEMENT SYSTEM (CEYLON CAFÉ) ', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Chandima Rathnayaka', 'Chandima', '202cb962ac59075b964b07152d234b70', 2),
(3, 'Bineth Geenuka', 'Bineth', '202cb962ac59075b964b07152d234b70', 2),
(4, 'Cashier', 'Cashier', '202cb962ac59075b964b07152d234b70', 2),
(5, 'Test User', 'testuser', 'cc03e747a6afbbcbf8be7668acfebee5', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
