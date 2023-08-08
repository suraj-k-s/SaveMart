-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2023 at 08:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_densy`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(20) NOT NULL,
  `admin_password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `booking_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_amount` varchar(50) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `booking_status` varchar(10) NOT NULL DEFAULT '0',
  `payment_status` varchar(10) NOT NULL DEFAULT '0',
  `delivery_address` varchar(50) NOT NULL DEFAULT '0',
  `pickup_date` varchar(200) DEFAULT '0',
  `pickup_time` varchar(20) NOT NULL DEFAULT '0',
  `pickup_parkingslot` varchar(10) NOT NULL DEFAULT '0',
  `delivery_mode` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`booking_id`, `booking_date`, `booking_amount`, `user_id`, `booking_status`, `payment_status`, `delivery_address`, `pickup_date`, `pickup_time`, `pickup_parkingslot`, `delivery_mode`) VALUES
(34, '2023-07-29', '381.00', 19, '3', '1', 'mvpa', '0', '0', '0', 'Home Delivery'),
(35, '2023-07-29', '755.00', 19, '5', '0', '0', '30/7/2023', '9-10', 'A12', 'Pick-up'),
(36, '2023-07-29', '310.00', 19, '1', '1', '0', '0', '0', '0', '0'),
(37, '2023-07-31', '179.00', 19, '1', '1', '0', '1/8/2023', '9-10', '0', 'Pick-up'),
(38, '2023-08-02', '256.00', 19, '1', '0', 'tdpa', '0', '0', '0', 'Home Delivery'),
(39, '2023-08-02', '608.00', 19, '1', '0', '0', '3/8/2023', '9-10', '0', 'Pick-up'),
(40, '2023-08-02', '256.00', 19, '1', '0', '0', '3/8/2023', '9-10', '0', 'Pick-up'),
(41, '2023-08-02', '54.00', 19, '1', '0', '0', '3/8/2023', '9-10', '0', 'Pick-up'),
(42, '2023-08-02', '44.00', 19, '1', '0', '0', '3/8/2023', '9-10', '0', 'Pick-up');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cart_id` int(11) NOT NULL,
  `cart_qty` varchar(20) NOT NULL DEFAULT '1',
  `cart_status` varchar(10) NOT NULL DEFAULT '0',
  `booking_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cart`
--

INSERT INTO `tbl_cart` (`cart_id`, `cart_qty`, `cart_status`, `booking_id`, `item_id`) VALUES
(90, '1', '1', 26, 12),
(91, '1', '1', 26, 26),
(92, '1', '1', 26, 13),
(93, '1', '1', 28, 3),
(94, '1', '1', 28, 5),
(95, '1', '1', 28, 12),
(96, '1', '1', 27, 3),
(97, '1', '1', 27, 34),
(98, '1', '1', 29, 3),
(99, '1', '1', 29, 22),
(100, '1', '1', 30, 4),
(101, '1', '1', 30, 5),
(102, '1', '1', 31, 5),
(103, '1', '1', 31, 3),
(104, '1', '1', 32, 12),
(105, '1', '1', 32, 3),
(124, '1', '0', 33, 3),
(125, '1', '0', 33, 4),
(126, '1', '1', 34, 3),
(127, '1', '1', 34, 22),
(128, '1', '1', 35, 4),
(129, '1', '1', 35, 5),
(130, '1', '1', 36, 3),
(131, '1', '1', 36, 13),
(132, '1', '1', 37, 5),
(133, '2', '1', 37, 26),
(134, '1', '1', 38, 3),
(135, '1', '1', 39, 4),
(136, '1', '1', 40, 3),
(137, '1', '1', 41, 13),
(138, '1', '1', 42, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_type` varchar(30) NOT NULL,
  `category_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_type`, `category_image`) VALUES
(1, 'Staples', 'FIle1925.jpg'),
(2, 'Beverages', 'FIle1295.png'),
(3, 'Fruits & Vegetables', 'FIle1547.png'),
(4, 'Dairy & Bakery', 'FIle1840.png'),
(5, 'Snacks & Branded Foods', 'FIle1364.jpg'),
(6, 'Homecare', 'FIle1684.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_title` varchar(20) NOT NULL,
  `complaint_content` varchar(50) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_status` varchar(10) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `complaint_reply` varchar(50) NOT NULL DEFAULT 'not replied'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_title`, `complaint_content`, `complaint_date`, `complaint_status`, `user_id`, `complaint_reply`) VALUES
(2, 'Service', 'Lag', '2023-06-02', '1', 1, 'Will Rectify Soon'),
(3, 'Delivery', 'Not on time', '2023-06-05', '0', 2, 'not replied'),
(4, 'Slow', 'The site is slow', '2023-06-08', '0', 4, 'not replied');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_content` varchar(50) NOT NULL,
  `feedback_date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_content`, `feedback_date`, `user_id`) VALUES
(1, 'good', '2023-06-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_details` varchar(50) NOT NULL,
  `item_price` varchar(10) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `item_image` varchar(50) NOT NULL,
  `item_rackno` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`item_id`, `item_name`, `item_details`, `item_price`, `subcategory_id`, `item_image`, `item_rackno`) VALUES
(3, 'Aashirvad Atta 5kg', 'Aashirvaad Superior MP Whole Wheat Atta 5kg', '256.00', 1, 'Item1778.webp', 'S10'),
(4, 'Nescafe Instant Coffee Powder', 'Nescafe Classic Instant Coffee Powder 200g', '608.00', 4, 'Item1210.avif', 'B11'),
(5, ' Eastea Tea Powder 500g', 'Eastea Tea Powder 500g', '147.00', 3, 'Item1166.jpg', 'B10'),
(12, 'Garlic Indian', 'Garlic 200 g', '44.00', 14, 'Item1294.png', 'FV12'),
(13, 'Amul Butter 100g(carton)', 'Amul Butter in Carton', '54.00', 7, 'Item1052.jpg', 'DB10'),
(14, 'Amulya Diary Whitener 1kg(Pouch)', 'Amulya Diary Whitener available in pouch for 1kg', '445.00', 7, 'Item1468.jpg', 'DB10'),
(17, 'Parle Hide & Seek', 'Parle Hide &Seek Chocolate Chip Cookies 100g', '25.00', 10, 'Item1056.jpg', 'SBF10'),
(21, 'Eastern Biriyani Masala 100g', 'Eastern Biriyani Masala 100gm', '48.00', 15, 'Item2033.webp', 'S12'),
(22, 'India Gate Basmati Rice 1kg', 'India Gate Durbar Basmati Rice 1kg', '125.00', 2, 'Item1615.webp', 'S11'),
(25, 'Apple Royal Gala', 'Apple Royal 1kg', '320.00', 5, 'Item1169.png', 'FV10'),
(26, 'Potato ', 'Potato 1 kg', '32.00', 6, 'Item1135.png', 'FV11'),
(27, 'Tomato', 'Tomato 1 kg', '49.00', 6, 'Item1875.png', 'FV11'),
(28, 'Britannia Milk Rusk', 'Britannia Milk Rusk Toastea 182g', '33.00', 8, 'Item2107.jpg', 'DB11'),
(29, 'Britannia Bake Rusk', 'Britannia Toastea Premium Bake Rusk 182g', '29.00', 8, 'Item1784.png', 'DB11'),
(30, 'Munch Yummy Treats', 'Munch 18 Yummy Treats 160.2g', '80.00', 11, 'Item1741.png', 'SBF11'),
(31, 'Surf Excel Detergent', 'Surf Excel Easy Wash Detergent Powder 5 kg', '670.00', 12, 'Item1748.png', 'HC10'),
(32, 'Vim Lemon Dishwash Liquid', 'Vim Lemon DIshwash Liquid 750ml', '139.00', 13, 'Item1689.png', 'HC11'),
(33, 'Quaker Oats 1kg', 'Quaker Oats 1kg ', '179.00', 16, 'Item1530.png', 'SBF12'),
(34, 'Eastern Chicken Masala 100g', 'Eastern Chicken Masala 100g', '42.00', 15, 'Item1837.png', 'S12'),
(36, 'Elite Maida 1kg', 'All Purpose Flour 1 kg', '57.00', 1, 'Item1414.png', 'S10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `notification_id` int(11) NOT NULL,
  `notification_date` date NOT NULL,
  `notification_title` varchar(50) NOT NULL,
  `notification_content` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`notification_id`, `notification_date`, `notification_title`, `notification_content`, `user_id`, `booking_id`) VALUES
(65, '2023-07-29', 'Booking Confirmed', 'Your order is confiremd.Wait for further details.', 19, 34),
(66, '2023-07-30', 'Order Shipped', 'Your order is shipped to your address.', 19, 34),
(67, '2023-07-30', 'Order Shipped', 'Your order is shipped to your address.', 19, 34),
(68, '2023-07-30', 'Booking Confirmed', 'Your order is confiremd.Wait for further details.', 19, 35),
(69, '2023-07-30', 'Items Packed', 'Your order is packed and ready for pickup.Thank you for placing orders.', 19, 35),
(70, '2023-07-30', 'Booking Confirmed', 'Your order is confiremd.Wait for further details.', 19, 35),
(71, '2023-07-30', 'Booking Confirmed', 'Your order is confiremd.Wait for further details.', 19, 35),
(72, '2023-07-30', 'Items Packed', 'Your order is packed and ready for pickup.Your pickup slot will ', 19, 35),
(73, '2023-07-30', 'Items Packed', 'Your order is packed and ready for pickup.', 19, 35),
(74, '2023-07-31', 'Parking Slot Details', '\'A10\' will be the parking slot.', 19, 35),
(75, '2023-07-31', 'Parking Slot Details', '\'A10\' will be the parking slot.', 19, 35),
(76, '2023-07-31', 'Parking Slot Details', 'A12 will be the parking slot', 19, 35);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock`
--

CREATE TABLE `tbl_stock` (
  `stock_id` int(11) NOT NULL,
  `stock_count` varchar(30) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_stock`
--

INSERT INTO `tbl_stock` (`stock_id`, `stock_count`, `item_id`) VALUES
(5, '110', 2),
(6, '55', 3),
(7, '26', 4),
(8, '35', 5),
(11, '10', 12),
(12, '10', 13),
(13, '10', 22),
(14, '4', 34),
(16, '10', 26);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_type` varchar(30) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`subcategory_id`, `subcategory_type`, `category_id`) VALUES
(1, 'Atta, Flours', 1),
(2, 'Rice & rice products', 1),
(3, 'Tea', 2),
(4, 'Coffee', 2),
(5, 'Fresh Fruits', 3),
(6, 'Fresh Vegetables', 3),
(7, 'Diary', 4),
(8, 'Toasts', 4),
(10, 'Biscuits & Cookies', 5),
(11, 'Chocolates', 5),
(12, 'Detergents', 6),
(13, 'Dishwash', 6),
(14, 'Herbs & Seasoning', 3),
(15, 'Masala', 1),
(16, 'Breakfast cereals', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(20) NOT NULL,
  `user_contact` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_contact`, `user_password`) VALUES
(1, 'Densy Sunny', 'densy.sunny@gmail.co', '9539130187', 'densy123'),
(2, 'Jossy Sunny', 'jossysunny10@gmail.c', '9495871812', 'jossy123'),
(3, 'Shamila', 'sam@gmail.com', '8281467390', 'sam@19'),
(4, 'Athul Varghese', 'athul@gmail.com', '8281467392', 'athul123'),
(5, 'Aleena Mathew', 'aleena@gmail.com', '9898090987', 'Aleena@12'),
(6, 'Aleena', 'aleenam@gmail.com', '9632589635', 'all'),
(10, 'alena', 'al@gmail.com', '963258', 'all'),
(15, 'Jes', 'jes@gmail.com', '9632587563', 'Jes@12'),
(19, 'Example', 'example@example.com', '9632587456', 'Abc@12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `tbl_stock`
--
ALTER TABLE `tbl_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
