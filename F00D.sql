-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2023 at 06:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `F00D`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'Masakan Indonesia', 'Pilih dari beragam makanan lezat kami.', '2023-11-10 18:16:28'),
(2, 'Minuman Indonesia', 'Pilih minuman favorit Anda!', '2023-11-09 18:17:14'),
(3, 'Sambal Indonesia', 'Pilih dari beragam sambal lezat kami.', '2023-11-10 18:17:43'),
(4, 'Jajanan Indonesia', 'Menawarkan beragam pilihan untuk eksplorasi kuliner.', '2023-11-10 18:19:10'),
(5, 'Jamu Tradisional', 'Kombinasi berbagai bahan alami untuk mengatasi masalah kesehatan.', '2023-11-08 21:58:58'),
(6, 'Sayur Indonesia', 'Pilih dari beragam sayuran lezat kami.', '2023-11-07 07:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `foodId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `foodId` int(12) NOT NULL,
  `foodName` varchar(255) NOT NULL,
  `foodPrice` int(12) NOT NULL,
  `foodDesc` text NOT NULL,
  `foodCategorieId` int(12) NOT NULL,
  `foodPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`foodId`, `foodName`, `foodPrice`, `foodDesc`, `foodCategorieId`, `foodPubDate`) VALUES
(1, 'Nasi Goreng\r\n', 25000, 'Perpaduan nasi, bumbu seperti kecap manis, bawang, bawang putih, dan daging atau seafood \r\n\r\n', 1, '2023-11-07 21:03:26'),
(2, 'Rendang\r\n', 65000, 'Hidangan berbahan dasar daging yang dihasilkan dari proses memasak suhu rendah dalam waktu lama dengan menggunakan aneka rempah-rempah dan santan. \r\n\r\n', 1, '2023-11-07 21:20:58'),
(3, 'Sate Ayam\r\n', 45000, 'Potongan daging ayam yang ditusuk kemudian dipanggang dan disajikan dengan saus kacang \r\n\r\n', 1, '2023-11-07 21:22:07'),
(4, 'Gado-gado\r\n', 25000, 'Salad sayur-sayuran dengan tahu, tempe, telur, dan lontong, disajikan dengan saus kacang. \r\n\r\n', 1, '2023-11-07 21:23:05'),
(5, 'Soto Ayam\r\n', 45000, 'Sup ayam dengan kuah kaldu yang kaya rasa, disajikan dengan mie, telur, tauge, dan daun bawang. \r\n\r\n', 1, '2023-11-07 21:23:48'),
(6, 'Ikan Bakar\r\n', 70000, 'Ikan yang dibumbui dan dipanggang, sering disajikan dengan sambal dan nasi.\r\n\r\n', 1, '2023-11-07 21:24:38'),
(7, 'Sop Buntut\r\n', 55000, 'Sup dengan buntut sapi sebagai bahan utamanya, dimasak dengan berbagai rempah-rempah. \r\n\r\n', 1, '2023-11-07 21:25:42'),
(8, 'Ayam Goreng\r\n', 25000, 'Ayam yang digoreng kering dengan bumbu rempah, biasanya disajikan dengan nasi. \r\n\r\n', 1, '2023-11-07 21:26:31'),
(9, 'Es Cendol\r\n', 15000, 'Minuman segar yang terbuat dari butiran tepung beras hijau yang disajikan dalam santan kelapa manis dengan es serut. \r\n\r\n', 2, '2023-11-08 21:34:37'),
(10, 'Wedang Jahe\r\n', 12000, 'Minuman jahe hangat yang diolah dengan menambahkan gula, daun pandan, dan seringkali tambahan rempah lain seperti kayu manis. \r\n\r\n', 2, '2023-11-08 21:35:31'),
(11, 'Bandrek\r\n', 15000, 'Minuman tradisional Sunda yang terbuat dari jahe, kelapa parut, gula merah, dan bubuk ketumbar. \r\n\r\n', 2, '2023-11-08 21:36:36'),
(12, 'Sekoteng\r\n', 10000, 'Minuman hangat yang terdiri dari campuran berbagai bahan seperti kacang hijau, kolang-kaling, biji salak, dan potongan roti. \r\n\r\n', 2, '2023-11-08 21:37:21'),
(13, 'Wedang Ronde\r\n', 319, 'Ronde terbuat dari tepung ketan yang dicampur sedikit air dan dibentuk menjadi bola, direbus, dan disajikan dengan kuah manis \r\n\r\n', 2, '2023-11-08 21:38:13'),
(14, 'Es Dawet', 8500, 'Minuman dingin yang terbuat dari santan, air daun pandan, agar-agar hijau, dan biji selasih. \r\n\r\n', 2, '2023-11-08 21:39:49'),
(15, 'Es Teler', 8500, 'Minuman dingin yang terdiri dari potongan buah seperti kelapa muda, alpukat, dan nangka, yang disajikan dalam es serut dengan susu kental manis dan sirup kental. \r\n\r\n', 2, '2023-11-08 21:40:58'),
(16, 'Wedang Uwuh\r\n', 7500, 'Minuman hangat yang terbuat dari campuran daun jati, serai, jahe, daun pandan, dan kayu manis. \r\n\r\n', 2, '2023-11-08 21:41:49'),
(17, 'Sambal Terasi\r\n', 5000, 'Sambal ini dibuat dengan mencampurkan cabai, terasi, garam, dan bahan-bahan lainnya. \r\n\r\n', 3, '2023-11-09 21:44:44'),
(18, 'Sambal Bawang\r\n', 7000, 'Sambal ini menonjolkan cita rasa bawang yang kuat. Biasanya terdiri dari cabai, bawang merah, garam, dan minyak. \r\n\r\n', 3, '2023-11-09 21:45:34'),
(19, 'Sambal Tomat\r\n', 6500, 'Dibuat dari cabai dan tomat, memberikan kombinasi pedas dan asam yang segar. \r\n\r\n', 3, '2023-11-09 21:46:21'),
(20, 'Sambal Petis\r\n', 4500, 'Menggunakan petis (pasta udang hitam) sebagai bahan utama, memberikan rasa khas yang gurih. \r\n\r\n', 3, '2023-11-09 21:47:07'),
(21, 'Sambal Ijo\r\n', 10500, 'Terbuat dari cabai hijau, tomat hijau, dan bahan-bahan lainnya. Rasanya segar dan cocok untuk makanan laut. \r\n\r\n', 3, '2023-11-09 21:47:51'),
(22, 'Sambal Matah\r\n', 9500, 'Khas Bali, terdiri dari cabai rawit, bawang merah, serai, jeruk limo, dan minyak kelapa. Disajikan mentah. \r\n\r\n', 3, '2023-11-09 21:48:44'),
(23, 'Sambal Cobek\r\n', 9500, 'Dibuat dengan cara tradisional menggunakan cobek (ulekan). Biasanya terdiri dari cabai, terasi, dan garam. \r\n\r\n', 3, '2023-11-09 21:49:36'),
(24, 'Sambal Bakar\r\n', 10000, 'Sambal ini dibuat dengan cara dipanggang, memberikan rasa yang berbeda dan aroma khas panggangan. \r\n\r\n', 3, '2023-11-09 21:50:20'),
(25, 'Cireng', 10500, 'Makanan ringan berbentuk batang yang terbuat dari tepung tapioka.', 4, '2023-11-09 22:01:33'),
(26, 'Jagung Bakar\r\n', 7500, 'Jagung yang dipanggang dan diberi bumbu. \r\n\r\n', 4, '2023-11-09 22:02:50'),
(27, 'Klepon Bugis\r\n', 10500, 'Kue klepon yang berasal dari Sulawesi Selatan. \r\n\r\n', 4, '2023-11-09 22:03:44'),
(28, 'Asinan Betawi\r\n', 20000, 'Sayuran yang diiris tipis dan disajikan dengan saus kacang. \r\n\r\n', 4, '2023-11-09 22:05:08'),
(29, 'Kue Lapis\r\n', 15000, 'Kue tradisional yang terbuat dari tepung beras berlapis-lapis berwarna. \r\n\r\n', 4, '2023-11-09 22:06:06'),
(30, 'Siomay', 22000, 'Dimsum yang berisi ikan, udang, dan tahu yang disajikan dengan saus kacang. \r\n\r\n', 4, '2023-11-09 22:06:59'),
(31, 'Kerak Telor\r\n', 15000, 'Nasi goreng dengan telur dan kelapa parut yang di atasnya diberi bumbu. \r\n\r\n', 4, '2023-11-09 22:08:13'),
(32, 'Serabi', 7500, 'Kue dadar berbentuk bulat dengan isian kelapa parut. \r\n\r\n', 4, '2023-11-09 22:08:58'),
(33, 'Jamu Kunyit Asam\r\n', 17500, 'Terbuat dari kunyit dan asam jawa, membantu pencernaan, menyehatkan kulit, dan antioksidan. \r\n\r\n', 5, '2023-11-10 22:12:53'),
(34, 'Jamu Beras Kencur\r\n', 18500, 'Minuman ini juga digolongkan sebagai jamu karena memiliki khasiat meningkatkan nafsu makan. \r\n\r\n', 5, '2023-11-10 22:13:38'),
(35, 'Jamu Temulawak\r\n', 16500, 'Tumbuhan obat yang tergolong dalam suku temu-temuan. \r\n\r\n', 5, '2023-11-10 22:14:24'),
(36, 'Jamu Daun Sirih\r\n', 15000, 'Daun sirih ditumbuk dan dicampur dengan air. \r\n\r\n', 5, '2023-11-10 22:16:29'),
(37, 'Jamu Pahitan\r\n', 14000, 'Mengandung kunyit, temulawak, dan andaliman. \r\n\r\n', 5, '2023-11-10 22:17:08'),
(38, 'Sayur Asem', 14500, 'Ada banyak variasi lokal sayur asam seperti sayur asam Jakarta, sayur asam kangkung, dan sayur asam ikan asin. \r\n\r\n', 6, '2023-11-10 07:57:27'),
(39, 'Sayur Lodeh', 17500, 'Sayur lodeh mempunyai berbagai macam variasi terutama pada bumbunya, ada yang santannya berwarna putih dan ada juga yang santannya berwarna kuning kemerahan. \r\n\r\n', 6, '2023-11-10 07:59:52'),
(40, 'Sayur Tumis labu siam\r\n', 16500, 'Labu siam rendah kalori tetapi kaya akan kalium dan natrium, vitamin A dan vitamin C. \r\n\r\n', 6, '2023-11-10 08:00:39'),
(41, 'Tumis kangkung\r\n\r\n', 18000, 'Kangkung (Ipomoea aquatica) digoreng tumis dengan campuran berbagai sayuran, bumbu, dan terkadang daging. \r\n\r\n', 6, '2023-11-10 08:01:29'),
(42, 'Tumis Tauge\r\n', 18500, 'Tumis tauge kaya manfaat bagi kesehatan tubuh karena mengandung banyak nutrisi. \r\n\r\n', 6, '2023-11-10 08:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'ITF', 'muh.iqbal.hakim@gmail.com', 81939497547, 85934670423, 'Jln. Jawa 6 no.5', '2023-11-10 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 81939497547, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`foodId`);
ALTER TABLE `food` ADD FULLTEXT KEY `foodName` (`foodName`,`foodDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `foodId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
