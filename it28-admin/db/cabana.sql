-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2024 at 11:00 AM
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
-- Database: `cabana`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(6) UNSIGNED NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street_address`, `city`, `state`, `postal_code`, `country`, `created_at`) VALUES
(1, '', '', '', '', '', '2024-05-27 07:08:03'),
(2, '', '', '', '', '', '2024-05-27 07:08:06'),
(3, 'dfgh', 'fj', 'fhj', 'fhj', 'fhj', '2024-05-27 09:28:52'),
(4, 'DGYYUJTY', 'TUITY', 'TYI', 'YIS', 'R56', '2024-05-27 09:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(6) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `product_name`, `price`, `payment_method`, `created_at`) VALUES
(1, 'croptop', 99.00, 'PayMaya', '2024-05-27 09:28:27'),
(2, '', 0.00, 'PayMaya', '2024-05-27 09:28:39'),
(3, '', 0.00, 'PayMaya', '2024-05-27 09:28:39'),
(4, '', 0.00, 'PayMaya', '2024-05-27 09:28:40'),
(5, '', 0.00, 'PayMaya', '2024-05-27 09:28:40'),
(6, '', 0.00, 'PayMaya', '2024-05-27 09:28:41'),
(7, '', 0.00, 'PayMaya', '2024-05-27 09:28:42'),
(8, '', 0.00, 'PayMaya', '2024-05-27 09:28:43'),
(9, 'YERY', 99.00, 'GCash', '2024-05-27 09:31:20'),
(10, 'sword', 124.00, 'PayMaya', '2024-05-29 01:52:15'),
(11, '', 0.00, 'PayMaya', '2024-05-29 01:52:19'),
(12, 'sword', 199.00, 'GCash', '2024-05-29 02:05:28'),
(13, '', 0.00, 'PayPal', '2024-05-29 08:49:12');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rrp` decimal(10,0) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`) VALUES
(1, 'Summit Shaper', 'Base ATK: 46\r\n2nd Stat: ATK +10.8%', 199, 199, 50, 'https://staticg.sportskeeda.com/editor/2021/10/27cd9-16346723738881-1920.jpg', '2024-05-08 00:00:00'),
(2, 'Uraku Misugiri', 'Base ATK: 44\r\n2nd Stat: CRIT DMG +19.20%', 249, 249, 30, 'https://zilliongamer.com/uploads/genshin-impact/weapons/uraku-misugiri/uraku.jpg', '2024-05-08 00:00:00'),
(3, 'Splendor of Waters', 'Base ATK: 44\r\n2nd Stat: CRIT DMG +19.20%', 300, 300, 25, 'https://landofgames.ru/uploads/posts/2023-10/zast.jpg', '2024-05-08 00:00:00'),
(4, 'Light of Foliar Incision', 'Base ATK: 44\r\n2nd Stat: CRIT DMG +19.20%', 599, 599, 15, 'https://images.gamebanana.com/img/ss/mods/64342a4f008b6.jpg', '2024-05-08 00:00:00'),
(6, 'Key of Khaj-Nisut', 'Base ATK: 44\r\n2nd Stat: HP +14.4%', 500, 500, 35, 'https://staticg.sportskeeda.com/editor/2022/10/5b8a9-16654955338547-1920.jpg?w=1200', '2024-05-27 17:30:38'),
(7, 'Haran Geppaku Futsu', 'Base ATK: 46\r\n2nd Stat: CRIT Rate +7.2%', 799, 799, 8, 'https://i.etsystatic.com/22660927/r/il/a4fd91/3804723266/il_794xN.3804723266_fxcv.jpg', '2024-05-29 08:50:13'),
(8, 'Mistsplitter Reforged', 'Base ATK: 48\r\n2nd Stat: CRIT DMG +9.6 %', 800, 800, 23, 'https://staticg.sportskeeda.com/editor/2021/07/50d3f-16263709778740-800.jpg', '2024-05-29 08:51:36'),
(9, 'Skyward Blade', 'Base ATK: 46\r\n2nd Stat: Energy Recharge +12.0%', 999, 999, 3, 'https://files.cults3d.com/uploaders/26691099/illustration-file/c35d98f6-7c9d-4849-99ca-1c4c8c97b5f4/1-3.jpg', '2024-05-29 08:52:47'),
(10, 'The Alley Flash', 'Base ATK: 45\r\n2nd Stat: Elemental Mastery +12', 1120, 1120, 4, 'https://upload-os-bbs.mihoyo.com/upload/2021/03/18/59966683/242f5ebcdfac90ce168444229682d45b_8752453067455374847.png', '2024-05-29 08:54:22'),
(11, 'Sapwood Blade', 'Base ATK: 44\r\n2nd Stat: Energy Recharge +6.7%', 1500, 1500, 4, 'https://gamesfuze.b-cdn.net/wp-content/uploads/2022/08/Arakalari-Sword.jpg', '2024-05-29 08:57:29'),
(12, 'Kagotsurube Isshin', 'Base ATK: 42\r\n2nd Stat: ATK +9.0%', 2210, 2210, 3, 'https://i.etsystatic.com/22660927/r/il/98a749/4165719013/il_1140xN.4165719013_rsbl.jpg', '2024-05-29 08:58:41'),
(13, 'Cinnabar Spindle', 'Base ATK: 41\r\n2nd Stat: DEF +15.0%', 2599, 2599, 2, 'https://www.ginx.tv/uploads2/Genshin_Impact/cinnabar_spindle/genshin-impact-cinnabar-spindle-weapon-mihoyo.JPG', '2024-05-29 09:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$kGp4g1TjBK4XwLIwRbBHSeZ4W5FpPbYoB1ap5NfFUjUPAcE3KR5QG', '2024-04-29 16:39:58'),
(2, 'Angelo', '$2y$10$qwbKDxw6t5q1JDybNK7cK.EgdGUQRBKMug4DgCAjdO4GagYl56d1q', '2024-05-29 17:19:28'),
(3, 'Anjuuu', '$2y$10$NgwrcnJ49Xy6M.0dMx0auOy/nuAM4mHMzfHeDIMcQxXoT0dY.qEmi', '2024-05-29 17:20:04'),
(4, 'Anjuuu', '$2y$10$sM7Nx9dYW9eiPmugG5OAN.o6nduUPNPg2WTCuYFnef8TL0NJrkEg6', '2024-05-29 17:21:42'),
(5, 'anjuuu', '$2y$10$NYI8ZBZRuIViL1mV2MwwL.085KtY5llXBOtbBup84F8OwXABEoP3W', '2024-05-29 16:41:55'),
(6, 'anjuuu2', '$2y$10$4433mJ.4IcicI1ArJgKmK.L1y2n0ExKevff4lAsHeSmnOCsUxZDQi', '2024-05-29 16:42:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
