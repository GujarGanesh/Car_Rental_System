-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 06, 2025 at 05:13 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrentalp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `ac_price` float NOT NULL,
  `non_ac_price` float NOT NULL,
  `ac_price_per_day` float NOT NULL,
  `non_ac_price_per_day` float NOT NULL,
  `car_availability` varchar(10) NOT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `car_nameplate` (`car_nameplate`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_img`, `ac_price`, `non_ac_price`, `ac_price_per_day`, `non_ac_price_per_day`, `car_availability`) VALUES
(1, 'Audi A4', 'GA3KA6969', 'assets/img/cars/audi-a4.jpg', 36, 26, 5200, 2600, 'yes'),
(2, 'Hyundai Creta', 'BA2CH2020', 'assets/img/cars/creta.jpg', 22, 12, 2900, 1400, 'yes'),
(3, 'BMW 6-Series', 'BA10PA5555', 'assets/img/cars/bmw6.jpg', 39, 30, 6950, 5999, 'no'),
(4, 'Mercedes-Benz E-Class', 'BA10CH6009', 'assets/img/cars/mcec.jpg', 45, 30, 7200, 5200, 'yes'),
(6, 'Ford EcoSport', 'GA4PA2587', 'assets/img/cars/ecosport.png', 21, 13, 3890, 2600, 'yes'),
(7, 'Honda Amaze', 'PJ16YX8820', 'assets/img/cars/amaze.png', 14, 12, 2800, 2400, 'yes'),
(8, 'Land Rover Range Rover Sport', 'GA5KH9669', 'assets/img/cars/rangero.jpg', 36, 26, 6000, 4600, 'yes'),
(9, 'MG Hector', 'GA6PA6666', 'assets/img/cars/mghector.jpg', 20, 12, 2900, 1400, 'no'),
(10, 'Honda CR-V', 'TN17MS1997', 'assets/img/cars/hondacr.jpg', 22, 15, 2850, 1400, 'yes'),
(11, 'Mahindra XUV 500', 'KA12EX1883', 'assets/img/cars/Mahindra XUV.jpg', 15, 13, 3000, 2600, 'yes'),
(12, 'Toyota Fortuner', 'GA08MX1997', 'assets/img/cars/Fortuner.png', 16, 14, 3200, 2800, 'yes'),
(13, 'Hyundai Veloster', 'BA20PA5685', 'assets/img/cars/hyundai0.png', 23, 15, 4500, 3500, 'yes'),
(14, 'Jaguar XF', 'GA8KH8866', 'assets/img/cars/jaguarxf.jpg', 39, 29, 6100, 4380, 'yes'),
(15, 'Creta', 'MH 18 FG 4556', 'assets/img/cars/creta.jpg', 35, 30, 3000, 2500, 'no'),
(16, 'XCV 300', 'MH 20 GK 3421', 'assets/img/cars/download (1).jpeg', 35, 30, 3000, 2500, 'yes'),
(17, 'Hindustan Ambassador', 'MH 18 FO 4856', 'assets/img/cars/images (1).jpeg', 50, 45, 6000, 5500, 'yes'),
(18, 'Swift', 'MH 19 FG 4956', 'assets/img/cars/images.jpeg', 35, 30, 3500, 3000, 'yes'),
(19, 'Nexon', 'MH 20 RT 3561', 'assets/img/cars/nexon.jpg', 35, 30, 3000, 2500, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

DROP TABLE IF EXISTS `clientcars`;
CREATE TABLE IF NOT EXISTS `clientcars` (
  `car_id` int NOT NULL,
  `client_username` varchar(50) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `client_username` (`client_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `clientcars`
--

INSERT INTO `clientcars` (`car_id`, `client_username`) VALUES
(1, 'harry'),
(3, 'harry'),
(7, 'harry'),
(8, 'harry'),
(9, 'harry'),
(11, 'harry'),
(12, 'harry'),
(15, 'harry'),
(16, 'harry'),
(17, 'harry'),
(18, 'harry'),
(19, 'harry'),
(2, 'jenny'),
(4, 'jenny'),
(6, 'jenny'),
(10, 'jenny'),
(13, 'jenny'),
(14, 'jenny');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_estonian_ci NOT NULL,
  `client_password` varchar(20) NOT NULL,
  PRIMARY KEY (`client_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) VALUES
('harry', 'Harry Den', '9876543210', 'harryden@gmail.com', '2477  Harley Vincent Drive', 'password'),
('jenny', 'Jeniffer Washington', '7850000069', 'washjeni@gmail.com', '4139  Mesa Drive', 'jenny'),
('tom', 'Tommy Doee', '900696969', 'tom@gmail.com', '4645  Dawson Drive', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('antonio', 'Antonio M', '0785556580', 'antony@gmail.com', '2677  Burton Avenue', 'password'),
('christine', 'Christine', '8544444444', 'chr@gmail.com', '3701  Fairway Drive', 'password'),
('ethan', 'Ethan Hawk', '69741111110', 'thisisethan@gmail.com', '4554  Rowes Lane', 'password'),
('ganesh', 'Ganesh Gujar', '1234567890', 'ganesh@gmail.com', 'add', 'password'),
('james', 'James Washington', '0258786969', 'james@gmail.com', '2316  Mayo Street', 'password'),
('lucas', 'Lucas Rhoades', '7003658500', 'lucas@gmail.com', '2737  Fowler Avenue', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `dl_number` (`dl_number`),
  KEY `client_username` (`client_username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `client_username`, `driver_availability`) VALUES
(1, 'Bruno Den', '27840218658 ', '9547863157', '1782  Vineyard Drive', 'Male', 'harry', 'no'),
(2, 'Will Williams', '03191563155 ', '9147523684', '4354  Hillcrest Drive', 'Male', 'harry', 'no'),
(3, 'Steeve Rogers', '32346288078 ', '9147523682', '1506  Skinner Hollow Road', 'Male', 'harry', 'yes'),
(4, 'Ivy', '04316015965 ', '9187563240', '4680  Wayside Lane', 'Female', 'jenny', 'yes'),
(5, 'Pamela C Benson', '68799466631 ', '7584960123', 'Urkey Pen Road', 'Female', 'jenny', 'yes'),
(6, 'Billy Williams', '36740186040 ', '8421025476', '2898  Oxford Court', 'Male', 'tom', 'yes'),
(7, 'Nicolas', '44919316260 ', '7541023695', 'Breezewood Court', 'Male', 'harry', 'yes'),
(8, 'Stephen Strange', '94592817723', '5215557850', 'Fairview Street12', 'Male', 'jenny', 'yes'),
(9, 'Ram', '366653', '12324353', 'Shirpur', 'male', 'harry', 'yes'),
(10, 'Sham', '454543535', '12324353', 'Chopda', 'Male', 'harry', 'yes'),
(11, 'Nilesh', '5332223', '96849325323', 'Shirpur', 'Male', 'harry', 'yes'),
(12, 'Suresh', '5333253', '8734452345', 'Dhule', 'male', 'harry', 'yes'),
(13, 'Dinesh', '20053351', '7000404345', 'Karvand Naka Nashik', 'm', 'harry', 'no'),
(14, 'Mahesh', '5994634', '8999607664', 'Sakri', 'male', 'harry', 'yes'),
(15, 'Tushar', '33995593', '64949779433', 'Shirpur', 'male', 'harry', 'yes'),
(16, 'harshal', '39969945', '8969800697', 'Chopda', 'male', 'harry', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('Nikhil', 'nikhil@gmail.com', 'Hope this works.'),
('', '', ''),
('', '', ''),
('ganesh', 'ganesh@gmail.com', 'Nice car rental servies'),
('mahesh', 'mahes@gmail.com', 'best ride'),
('dinesh', 'dinesh@gmail.com', 'nice journy\r\n'),
('ganesh', 'g23@gmail.com', 'hello i am ganesh'),
('golu', 'g23@gmail.com', 'hello i am ganesh');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `PAY_ID` int NOT NULL AUTO_INCREMENT,
  `BOOK_ID` int NOT NULL,
  `CARD_NO` varchar(255) NOT NULL,
  `EXP_DATE` varchar(255) NOT NULL,
  `CVV` int NOT NULL,
  `PRICE` int NOT NULL,
  PRIMARY KEY (`PAY_ID`),
  UNIQUE KEY `BOOK_ID` (`BOOK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PAY_ID`, `BOOK_ID`, `CARD_NO`, `EXP_DATE`, `CVV`, `PRICE`) VALUES
(24, 68, '4444444444444444', '11/22', 333, 50000),
(26, 71, '5632147825632546', '02/05', 222, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `PAY_ID` int NOT NULL AUTO_INCREMENT,
  `BOOK_ID` int NOT NULL,
  `CARD_NO` varchar(16) NOT NULL,
  `EXP_DATE` varchar(5) NOT NULL,
  `CVV` varchar(4) NOT NULL,
  `PRICE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PAY_ID`),
  KEY `BOOK_ID` (`BOOK_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentedcars`
--

DROP TABLE IF EXISTS `rentedcars`;
CREATE TABLE IF NOT EXISTS `rentedcars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL,
  `distance_or_days` int NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_username` (`customer_username`),
  KEY `car_id` (`car_id`),
  KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=574681340 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `rentedcars`
--

INSERT INTO `rentedcars` (`id`, `customer_username`, `car_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`, `distance_or_days`, `amount`) VALUES
(574681246, 'james', 6, 6, '2018-07-18', '2018-06-01', '2018-06-28', '2018-07-18', 15, 'km', 69, 27, 5035, 'R', 0, 0),
(574681247, 'antonio', 3, 1, '2018-07-18', '2018-07-19', '2018-07-22', '2018-07-20', 13, 'km', 421, 3, 5473, 'R', 0, 0),
(574681248, 'ethan', 1, 2, '2018-07-20', '2018-07-28', '2018-07-29', '2018-07-20', 10, 'km', 69, 1, 690, 'R', 0, 0),
(574681249, 'james', 1, 2, '2018-07-23', '2018-07-24', '2018-07-25', '2018-07-23', 10, 'km', 500, 1, 5000, 'R', 0, 0),
(574681250, 'lucas', 3, 2, '2018-07-23', '2018-07-23', '2018-07-24', '2018-07-23', 2600, 'days', NULL, 1, 2600, 'R', 0, 0),
(574681251, 'james', 10, 1, '2018-07-23', '2018-07-25', '2018-07-30', '2018-07-23', 10, 'km', 60, 2, 600, 'R', 0, 0),
(574681252, 'christine', 11, 2, '2018-07-23', '2018-07-23', '2018-07-23', '2018-07-23', 13, 'km', 200, 0, 2600, 'R', 0, 0),
(574681253, 'christine', 6, 7, '2018-07-23', '2018-07-23', '2018-08-03', '2018-07-23', 2600, 'days', NULL, 11, 28600, 'R', 0, 0),
(574681254, 'ethan', 12, 5, '2018-07-23', '2018-07-23', '2018-07-26', '2018-07-23', 3200, 'days', NULL, 3, 9600, 'R', 0, 0),
(574681255, 'christine', 8, 5, '2018-07-23', '2018-07-23', '2018-08-08', '2018-07-23', 2400, 'days', NULL, 16, 38400, 'R', 0, 0),
(574681257, 'james', 7, 4, '2018-08-11', '2018-08-13', '2018-08-17', '2025-03-14', 14, 'km', 3, 4, 480242, 'R', 0, 0),
(574681258, 'lucas', 3, 1, '2021-03-24', '2021-03-24', '2021-03-25', '2021-03-24', 2600, 'days', NULL, 1, 2600, 'R', 0, 0),
(574681259, 'lucas', 14, 8, '2021-03-24', '2021-03-24', '2021-03-26', '2021-03-24', 6100, 'days', NULL, 2, 12200, 'R', 0, 0),
(574681260, 'lucas', 12, 2, '2025-03-06', '2025-03-18', '2025-04-02', '2025-03-07', 16, 'km', 34, 15, 544, 'R', 0, 0),
(574681264, 'lucas', 12, 1, '2025-03-06', '2025-03-10', '2025-03-12', '2025-03-07', 16, 'km', 23, 2, 368, 'R', 0, 0),
(574681265, 'lucas', 12, 1, '2025-03-06', '2025-03-10', '2025-03-12', '2025-03-07', 16, 'km', 43, 2, 688, 'R', 0, 0),
(574681277, 'lucas', 8, 2, '2025-03-07', '2025-03-17', '2025-03-21', '2025-03-07', 6000, 'days', NULL, 4, 24000, 'R', 0, 0),
(574681278, 'lucas', 12, 1, '2025-03-07', '2025-03-10', '2025-03-26', '2025-03-07', 16, 'km', 4, 16, 64, 'R', 0, 0),
(574681279, 'lucas', 12, 1, '2025-03-07', '2025-03-10', '2025-03-26', '2025-03-07', 16, 'km', 4, 16, 64, 'R', 0, 0),
(574681281, 'lucas', 12, 1, '2025-03-07', '2025-03-10', '2025-03-26', '2025-03-07', 16, 'km', 0, 16, 0, 'R', 0, 0),
(574681282, 'lucas', 11, 1, '2025-03-07', '2025-03-09', '2025-03-24', '2025-03-07', 15, 'km', 0, 15, 0, 'R', 0, 0),
(574681283, 'lucas', 11, 1, '2025-03-08', '2025-03-11', '2025-03-26', '2025-03-08', 15, 'km', 3, 15, 45, 'R', 0, 0),
(574681284, 'lucas', 12, 7, '2025-03-08', '2025-03-10', '2025-03-12', '2025-03-08', 16, 'km', 5, 2, 80, 'R', 0, 0),
(574681285, 'lucas', 8, 1, '2025-03-08', '2025-03-11', '2025-03-20', '2025-03-08', 6000, 'days', NULL, 9, 54000, 'R', 0, 0),
(574681286, 'ganesh', 10, 5, '2025-03-16', '2025-03-18', '2025-03-27', '2025-03-16', 2850, 'days', NULL, 9, 25650, 'R', 0, 0),
(574681287, 'ganesh', 9, 1, '2025-03-16', '2025-03-18', '2025-03-19', '2025-03-16', 2900, 'days', NULL, 1, 2900, 'R', 0, 0),
(574681288, 'ganesh', 11, 3, '2025-03-16', '2025-03-19', '2025-03-26', '2025-03-16', 3000, 'days', NULL, 7, 21000, 'R', 0, 0),
(574681289, 'ganesh', 3, 1, '2025-03-16', '2025-03-19', '2025-03-20', '2025-03-16', 6950, 'days', NULL, 1, 6950, 'R', 0, 0),
(574681290, 'ganesh', 3, 1, '2025-03-16', '2025-03-19', '2025-03-20', '2025-03-16', 6950, 'days', NULL, 0, 0, 'R', 0, 0),
(574681291, 'ganesh', 13, 8, '2025-03-16', '2025-03-17', '2025-03-25', '2025-03-16', 4500, 'days', NULL, 0, 0, 'R', 0, 0),
(574681292, 'ganesh', 14, 4, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 39, 'km', 0, 3, 0, 'R', 0, 0),
(574681293, 'ganesh', 4, 5, '2025-03-16', '2025-03-20', '2025-03-24', '2025-03-16', 45, 'km', 0, 4, 0, 'R', 0, 0),
(574681294, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-18', '2025-03-16', 6950, 'days', NULL, 0, 0, 'R', 0, 0),
(574681295, 'ganesh', 11, 2, '2025-03-16', '2025-03-18', '2025-03-22', '2025-03-16', 15, 'km', 0, 4, 0, 'R', 0, 0),
(574681296, 'ganesh', 9, 3, '2025-03-16', '2025-03-16', '2025-03-22', '2025-03-16', 2900, 'days', NULL, 0, 0, 'R', 0, 0),
(574681297, 'ganesh', 1, 3, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 5200, 'days', NULL, 0, 0, 'R', 0, 0),
(574681298, 'ganesh', 8, 7, '2025-03-16', '2025-03-19', '2025-03-28', '2025-03-16', 6000, 'days', NULL, 0, 0, 'R', 0, 0),
(574681299, 'ganesh', 9, 1, '2025-03-16', '2025-03-18', '2025-03-20', '2025-03-16', 20, 'km', 0, 2, 0, 'R', 0, 0),
(574681300, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-19', '2025-03-16', 39, 'km', 0, 2, 0, 'R', 0, 0),
(574681301, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-19', '2025-03-16', 39, 'km', 0, 2, 0, 'R', 0, 0),
(574681302, 'ganesh', 3, 1, '2025-03-16', '2025-03-20', '2025-03-20', '2025-03-16', 6950, 'days', NULL, 0, 0, 'R', 0, 0),
(574681303, 'ganesh', 3, 1, '2025-03-16', '2025-03-20', '2025-03-26', '2025-03-16', 6950, 'days', NULL, 0, 0, 'R', 0, 0),
(574681304, 'ganesh', 4, 5, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 45, 'km', 0, 3, 0, 'R', 0, 0),
(574681305, 'ganesh', 9, 1, '2025-03-16', '2025-03-16', '2025-03-19', '2025-03-16', 20, 'km', 0, 3, 0, 'R', 0, 0),
(574681306, 'ganesh', 2, 5, '2025-03-16', '2025-03-17', '2025-03-21', '2025-03-16', 22, 'km', 0, 4, 0, 'R', 0, 0),
(574681307, 'ganesh', 4, 4, '2025-03-16', '2025-03-19', '2025-03-25', '2025-03-16', 7200, 'days', NULL, 0, 0, 'R', 0, 0),
(574681308, 'ganesh', 1, 1, '2025-03-16', '2025-03-16', '2025-03-18', '2025-03-16', 36, 'km', 0, 2, 0, 'R', 0, 0),
(574681309, 'ganesh', 8, 2, '2025-03-16', '2025-03-18', '2025-03-27', '2025-03-16', 36, 'km', 0, 9, 0, 'R', 0, 0),
(574681310, 'ganesh', 8, 2, '2025-03-16', '2025-03-18', '2025-03-20', '2025-03-16', 36, 'km', 0, 2, 0, 'R', 0, 0),
(574681311, 'ganesh', 1, 3, '2025-03-16', '2025-03-17', '2025-03-19', '2025-03-16', 36, 'km', 0, 2, 0, 'R', 0, 0),
(574681312, 'ganesh', 2, 5, '2025-03-16', '2025-03-18', '2025-04-22', '2025-03-16', 22, 'km', 0, 35, 770, 'R', 0, 0),
(574681313, 'ganesh', 4, 8, '2025-03-16', '2025-03-26', '2025-03-27', '2025-03-16', 45, 'km', 0, 1, 45, 'R', 0, 0),
(574681314, 'ganesh', 12, 1, '2025-03-16', '2025-03-16', '2025-03-28', '2025-03-16', 3200, 'days', NULL, 0, 0, 'R', 0, 0),
(574681315, 'ganesh', 11, 1, '2025-03-16', '2025-03-18', '2025-03-28', '2025-03-16', 3000, 'days', NULL, 0, 30000, 'R', 0, 0),
(574681316, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-23', '2025-03-16', 6950, 'days', NULL, 0, 41700, 'R', 0, 0),
(574681317, 'ganesh', 4, 5, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 45, 'km', 0, 3, 135, 'R', 0, 0),
(574681318, 'ganesh', 8, 1, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 36, 'km', 0, 3, 108, 'R', 0, 0),
(574681319, 'ganesh', 2, 5, '2025-03-16', '2025-03-17', '2025-03-20', '2025-03-16', 22, 'km', 300, 3, 6600, 'R', 0, 0),
(574681320, 'ganesh', 1, 1, '2025-03-16', '2025-03-18', '2025-03-21', '2025-03-16', 36, 'km', 0, 3, 1080, 'R', 0, 0),
(574681321, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-19', '2025-03-16', 39, 'km', 0, 2, 11700, 'R', 0, 0),
(574681322, 'ganesh', 4, 8, '2025-03-16', '2025-03-19', '2025-03-25', '2025-03-16', 7200, 'days', NULL, 0, 43200, 'R', 0, 0),
(574681323, 'ganesh', 3, 1, '2025-03-16', '2025-03-18', '2025-03-20', '2025-03-16', 39, 'km', 0, 2, 7800, 'R', 0, 0),
(574681324, 'ganesh', 9, 1, '2025-03-16', '2025-03-17', '2025-03-26', '2025-03-16', 20, 'km', 499, 9, 9980, 'R', 0, 0),
(574681325, 'ganesh', 3, 1, '2025-03-16', '2025-03-17', '2025-03-19', '2025-03-16', 39, 'km', 200, 2, 7800, 'R', 0, 0),
(574681326, 'ganesh', 1, 2, '2025-03-16', '2025-03-17', '2025-03-21', '2025-03-31', 5200, 'days', NULL, 4, 22800, 'R', 0, 0),
(574681327, 'lucas', 3, 1, '2025-03-16', '2025-03-17', '2025-03-27', '2025-03-16', 6950, 'days', NULL, 0, 69500, 'R', 0, 0),
(574681328, 'lucas', 3, 1, '2025-03-16', '2025-03-18', '2025-03-27', '2025-03-16', 6950, 'days', NULL, 0, 62550, 'R', 0, 0),
(574681330, 'lucas', 3, 3, '2025-03-16', '2025-03-19', '2025-03-20', '2025-03-16', 39, 'km', 300, 1, 11700, 'R', 0, 0),
(574681331, 'lucas', 9, 3, '2025-03-16', '2025-03-17', '2025-03-28', '2025-03-16', 2900, 'days', NULL, 11, 31900, 'R', 0, 0),
(574681332, 'ganesh', 15, 13, '2025-03-31', '2025-03-31', '2025-04-02', NULL, 35, 'km', NULL, 2, 70, 'NR', 0, 0),
(574681333, 'ganesh', 16, 12, '2025-03-31', '2025-04-01', '2025-04-03', '2025-03-31', 35, 'km', 500, 2, 17500, 'R', 0, 0),
(574681334, 'ganesh', 3, 2, '2025-03-31', '2025-04-01', '2025-04-03', NULL, 6950, 'days', NULL, 2, 13900, 'NR', 0, 0),
(574681335, 'ganesh', 9, 1, '2025-03-31', '2025-04-01', '2025-04-05', NULL, 2900, 'days', NULL, 4, 11600, 'NR', 0, 0),
(574681336, 'ganesh', 2, 4, '2025-03-31', '2025-04-01', '2025-04-03', '2025-03-31', 2900, 'days', NULL, 2, 5800, 'R', 0, 0),
(574681337, 'ganesh', 2, 4, '2025-03-31', '2025-04-01', '2025-04-03', '2025-03-31', 2900, 'days', NULL, 2, 5800, 'R', 0, 0),
(574681338, 'ganesh', 10, 5, '2025-03-31', '2025-04-02', '2025-04-05', '2025-03-31', 2850, 'days', NULL, 3, 8550, 'R', 0, 0),
(574681339, 'ganesh', 16, 14, '2025-04-01', '2025-04-02', '2025-04-05', '2025-04-01', 35, 'km', 500, 3, 17500, 'R', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD CONSTRAINT `clientcars_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`),
  ADD CONSTRAINT `clientcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`);

--
-- Constraints for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD CONSTRAINT `rentedcars_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `rentedcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `rentedcars_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
