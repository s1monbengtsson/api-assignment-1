-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: b6zdynmsbtatqsyclhbw-mysql.services.clever-cloud.com:3306
-- Generation Time: Feb 07, 2023 at 07:42 PM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b6zdynmsbtatqsyclhbw`
--

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int UNSIGNED NOT NULL,
  `order_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total` int UNSIGNED NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(1, 'Simon', 'Bengtsson', 'Hillerödsvägen 6C', '21747', 'Malmö', 'simonbengan8@gmail.com', '+46766119874', 14),
(2, 'Simon', 'Bengtsson', 'Hillerödsvägen 6C', '21747', 'Malmö', 'simonbengan8@gmail.com', '+46766119874', 35),
(3, 'Simon', 'Bengtsson', 'Hillerödsvägen 6C', '21747', 'Malmö', 'simonbengan8@gmail.com', '+46766119874', 24),
(4, 'Simon', 'Bengtsson', 'Hillerödsvägen 6C', '21747', 'Malmö', 'simonbengan8@gmail.com', '0766119874', 12),
(5, 'Simon', 'Bengtsson', 'Hillerödsvägen 6C', '21747', 'Malmö', 'simonbengan8@gmail.com', '0766119874', 33);

-- --------------------------------------------------------

--
-- Table structure for table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `item_price` int UNSIGNED NOT NULL,
  `item_total` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OrderItems`
--

INSERT INTO `OrderItems` (`id`, `order_id`, `qty`, `product_id`, `item_price`, `item_total`) VALUES
(1, 1, 2, 1, 7, 14),
(2, 2, 5, 3, 7, 35),
(3, 3, 2, 6, 12, 24),
(4, 4, 1, 1, 7, 7),
(5, 4, 1, 2, 5, 5),
(6, 5, 1, 2, 5, 5),
(7, 5, 1, 3, 7, 7),
(8, 5, 1, 6, 12, 12),
(9, 5, 1, 5, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int UNSIGNED NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `description`, `price`, `images`, `stock_status`, `stock_quantity`) VALUES
(1, 'Pastellfisk', '<p>Gelé med fruktsmak</p>\n<p>Innehållsförteckning: Glukossirap, socker, stärkelse, syra (citronsyra), surhetsreglerandemedel (E331), vegetabiliska oljor (kokos, palm), aromer, ytbehandlingsmedel (bivax), färgämnen (E160e, E141, E160a).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 7, '{\"large\": \"/storage/products/200348.png\", \"thumbnail\": \"/storage/products/thumbnails/200348-300x300.png\"}', 'instock', 4),
(2, 'Polly Original', '<p>Dragerat skum med smak av arrak, smörkola, vanilj och choklad</p>\n<p>Innehållsförteckning: Socker, vegetabiliska fetter/oljor (palm, shea, kokos, raps), glukossirap, kakaomassa, invertsockersirap, HELMJÖLKSPULVER, VASSLEPULVER|(MJÖLK), gelatin, emulgeringsmedel (SOJALECITIN, E476), ytbehandlingsmedel (gummi arabicum, shellack), aromer (bl.a. vanillin), förtjockningsmedel (pektin), syra (citronsyra).</p>\n<p>Kan innehålla NÖTTER.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 5, '{\"large\": \"/storage/products/156907.png\", \"thumbnail\": \"/storage/products/thumbnails/156907-300x300.png\"}', 'instock', 10),
(3, 'Rabarberbitar', '<p>Fylld lakrits med fruktsmak.</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, VETEMJÖL, modifierad majs- och potatisstärkelse, helt härdat vegetabiliskt fett (palmkärna, kokos), fuktighetsbevarande medel (glycerol), emulgeringsmedel (mono- och diglycerider av fettsyror), förtjockningmedel (arabiskt gummi), surhetsreglerande medel (äppelsyra), salt, färgämnen (karmin, kurkumin), aromämnen, vegetabilisk olja (palm, palmkärna, kokos), ytbehandlingsmedel (karnaubavax), antioxidant (askorbinsyra).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 7, '{\"large\": \"/storage/products/200362.png\", \"thumbnail\": \"/storage/products/thumbnails/200362-300x300.png\"}', 'instock', 15),
(4, 'Salt Sill', '<p>Välkänd fisk i lakrits</p>\n<p>Innehållsförteckning: Socker, glukossirap, stärkelse, ammoniumklorid (salmiak), lakritsextrakt, vegetabiliska oljor (kokos, palm), färgämne (E153), stabiliseringsmedel (E471), arom, ytbehandlingsmedel (bivax).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 10, '{\"large\": \"/storage/products/200350.png\", \"thumbnail\": \"/storage/products/thumbnails/200350-300x300.png\"}', 'outofstock', 0),
(5, 'Skipper\'s Pipes', '<p>Välkänd pipa i lakrits. Garanterat rökfri!</p>\n<p>Innehållsförteckning: Glukossirap, VETEMJÖL, melass, socker, lakritsextrakt, färgämnen (E153, E120), salt, stärkelse (bl.a. VETE), konserveringsmedel (E200), förtjockningsmedel (gummi arabicum), kokosolja, arom, ytbehandlingsmedel (bivax).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 9, '{\"large\": \"/storage/products/947358.png\", \"thumbnail\": \"/storage/products/thumbnails/947358-300x300.png\"}', 'instock', 10),
(6, 'Sour Winegums', '<p>Sour Winegums i fruktsmaker</p>\n<p>Innehållsförteckning: Glukossirap (innehåller SULFITER), socker, stärkelse, gelatin, syror (äppelsyra, ättiksyra), färgämnen (antocyaner, vegetabilisk karbon, paprikaextrakt, lutein, kurkumin), surhetsreglerande medel (kalciumcitrater), palmolja, aromer.</p>\n<p>Kan innehålla VETE.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 12, '{\"large\": \"/storage/products/200336.png\", \"thumbnail\": \"/storage/products/thumbnails/200336-300x300.png\"}', 'instock', 2);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `applied_steps_count`) VALUES
('6bea9041-7b96-4a53-b1bf-f12bd500438f', 'c3f501f2517bcdeabcc4388c68d96be3336624d2f27abb451949928d42203eff', '2023-02-07 14:40:28.556', '20230207143525_product_order_order_items', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItems_product_id_fkey` (`product_id`),
  ADD KEY `OrderItems_order_id_fkey` (`order_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `OrderItems`
--
ALTER TABLE `OrderItems`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD CONSTRAINT `OrderItems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItems_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
