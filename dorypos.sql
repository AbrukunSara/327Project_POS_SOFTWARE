-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2020 at 07:11 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dorypos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `root` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `contact`, `email`, `password`, `root`) VALUES
(7, 'Sara', 1631706287, 'sara@nsu.com', '1234', 1),
(8, 'Sara', 1631706287, 'sara@nsu.com', '1234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_brand`
--

CREATE TABLE `dorypos_brand` (
  `brand_id` int(10) NOT NULL,
  `brand_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_category`
--

CREATE TABLE `dorypos_category` (
  `category_id` int(255) NOT NULL,
  `category_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_customer`
--

CREATE TABLE `dorypos_customer` (
  `customer_id` int(255) NOT NULL,
  `created_date` varchar(255) NOT NULL,
  `verify` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_ex`
--

CREATE TABLE `dorypos_ex` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_order`
--

CREATE TABLE `dorypos_order` (
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_discount` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_product`
--

CREATE TABLE `dorypos_product` (
  `p_id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `cost` float NOT NULL,
  `price` float NOT NULL,
  `in_quantity` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `brand_id` int(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_sale`
--

CREATE TABLE `dorypos_sale` (
  `sale_id` int(11) NOT NULL,
  `customer_id` int(255) NOT NULL,
  `total_price` float NOT NULL,
  `discount_percent` float NOT NULL,
  `final_discount` float NOT NULL,
  `net_price` float NOT NULL,
  `date` date NOT NULL,
  `discount_round` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dorypos_vendor`
--

CREATE TABLE `dorypos_vendor` (
  `vendor_id` int(10) NOT NULL,
  `vendor_name` varchar(255) NOT NULL,
  `vendor_phone` int(255) NOT NULL,
  `vendor_address` varchar(255) NOT NULL,
  `vendor_brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dorypos_brand`
--
ALTER TABLE `dorypos_brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `dorypos_category`
--
ALTER TABLE `dorypos_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `dorypos_customer`
--
ALTER TABLE `dorypos_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `dorypos_ex`
--
ALTER TABLE `dorypos_ex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dorypos_order`
--
ALTER TABLE `dorypos_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `dorypos_product`
--
ALTER TABLE `dorypos_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `dorypos_sale`
--
ALTER TABLE `dorypos_sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `dorypos_vendor`
--
ALTER TABLE `dorypos_vendor`
  ADD PRIMARY KEY (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dorypos_brand`
--
ALTER TABLE `dorypos_brand`
  MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dorypos_category`
--
ALTER TABLE `dorypos_category`
  MODIFY `category_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dorypos_customer`
--
ALTER TABLE `dorypos_customer`
  MODIFY `customer_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `dorypos_ex`
--
ALTER TABLE `dorypos_ex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dorypos_order`
--
ALTER TABLE `dorypos_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `dorypos_product`
--
ALTER TABLE `dorypos_product`
  MODIFY `p_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `dorypos_sale`
--
ALTER TABLE `dorypos_sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `dorypos_vendor`
--
ALTER TABLE `dorypos_vendor`
  MODIFY `vendor_id` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
