-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.18-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `shop`;

-- 테이블 shop.auth_info 구조 내보내기
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE IF NOT EXISTS `auth_info` (
  `auth_code` int(11) NOT NULL,
  `auth_memo` text NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`auth_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.auth_info:~0 rows (대략적) 내보내기
DELETE FROM `auth_info`;
/*!40000 ALTER TABLE `auth_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_info` ENABLE KEYS */;

-- 테이블 shop.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `goods_code` int(11) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `cart_quantity` int(11) NOT NULL COMMENT '카트 물건 수량',
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`goods_code`,`customer_id`),
  KEY `FK_cart_customer` (`customer_id`),
  CONSTRAINT `FK_cart_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.cart:~0 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 shop.customer 구조 내보내기
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_code` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  `customer_pw` varchar(100) NOT NULL COMMENT '반정규화',
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(100) NOT NULL,
  `point` int(11) NOT NULL COMMENT '반정규화',
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`customer_code`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.customer:~0 rows (대략적) 내보내기
DELETE FROM `customer`;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- 테이블 shop.customer_address 구조 내보내기
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `address_code` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`address_code`),
  KEY `FK__customer` (`customer_id`),
  CONSTRAINT `FK__customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.customer_address:~0 rows (대략적) 내보내기
DELETE FROM `customer_address`;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;

-- 테이블 shop.emp 구조 내보내기
DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
  `emp_code` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(100) NOT NULL,
  `emp_pw` varchar(100) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT 'Y 계정사용가능, N 계정사용불가',
  `auth_code` int(11) DEFAULT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`emp_code`),
  UNIQUE KEY `emp_id` (`emp_id`),
  KEY `FK_emp_auth_info` (`auth_code`),
  CONSTRAINT `FK_emp_auth_info` FOREIGN KEY (`auth_code`) REFERENCES `auth_info` (`auth_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.emp:~0 rows (대략적) 내보내기
DELETE FROM `emp`;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;

-- 테이블 shop.goods 구조 내보내기
DROP TABLE IF EXISTS `goods`;
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_code` int(11) NOT NULL AUTO_INCREMENT,
  `category_no` int(11) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `goods_price` int(11) NOT NULL,
  `goods_content` text NOT NULL,
  `goods_stock` int(11) NOT NULL,
  `emp_id` varchar(100) NOT NULL COMMENT '상품등록한 스텝ID',
  `hit` int(11) NOT NULL DEFAULT 0,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`goods_code`),
  KEY `FK_goods_goods_category` (`category_no`),
  CONSTRAINT `FK_goods_goods_category` FOREIGN KEY (`category_no`) REFERENCES `goods_category` (`category_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.goods:~11 rows (대략적) 내보내기
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goods_code`, `category_no`, `goods_name`, `goods_price`, `goods_content`, `goods_stock`, `emp_id`, `hit`, `createdate`) VALUES
	(2, 3, '촉촉한 몽블랑', 3500, '내용', 100, 'youngwoo', 5, '2023-01-05 10:15:15'),
	(3, 3, '진한 크림치즈 롤파이', 2800, '내용', 100, 'youngwoo', 7, '2023-01-05 10:15:50'),
	(4, 3, '프렌치크라상', 2500, '내용', 100, 'youngwoo', 8, '2023-01-05 10:16:31'),
	(5, 3, '갈릭고구마페스츄리', 2800, '내용', 100, 'youngwoo', 8, '2023-01-05 10:16:55'),
	(6, 3, '치즈소시지페스츄리', 2500, '내용', 100, 'youngwoo', 4, '2023-01-05 10:17:25'),
	(7, 3, '미니초코칩트위스트', 3500, '내용', 100, 'youngwoo', 3, '2023-01-05 10:17:49'),
	(8, 3, '달콤한 뀐아망', 3200, '내용', 100, 'youngwoo', 5, '2023-01-05 10:18:07'),
	(9, 3, '뺑오레쟁', 2800, '내용', 50, 'youngwoo', 6, '2023-01-05 10:18:45'),
	(12, 3, '달콤한-딸기롤파이', 3000, '내용', 100, 'youngwoo', 8, '2023-01-06 10:06:40'),
	(18, 3, '크림치즈데니쉬', 2800, '내용', 100, 'youngwoo', 4, '2023-01-06 10:18:37');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 shop.goods_category 구조 내보내기
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE IF NOT EXISTS `goods_category` (
  `category_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_kind` enum('빵','케이크','델리','디저트','음료') NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.goods_category:~12 rows (대략적) 내보내기
DELETE FROM `goods_category`;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` (`category_no`, `category_kind`, `category_name`, `createdate`) VALUES
	(1, '빵', '식빵', '2023-01-06 10:29:45'),
	(2, '빵', '간식빵', '2023-01-06 10:30:07'),
	(3, '빵', '파이', '2023-01-06 10:30:23'),
	(4, '빵', '도넛', '2023-01-06 10:30:28'),
	(5, '케이크', '생크림케이크', '2023-01-06 10:31:38'),
	(6, '케이크', '스페셜케이크', '2023-01-06 10:31:50'),
	(7, '케이크', '조각케이크', '2023-01-06 10:31:59'),
	(8, '델리', '샌드위치', '2023-01-06 10:32:16'),
	(9, '델리', '샐러드', '2023-01-06 10:33:51'),
	(10, '디저트', '디저트', '2023-01-06 10:34:10'),
	(11, '음료', '티', '2023-01-06 10:34:28'),
	(12, '음료', '에이드', '2023-01-06 10:35:55');
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;

-- 테이블 shop.goods_img 구조 내보내기
DROP TABLE IF EXISTS `goods_img`;
CREATE TABLE IF NOT EXISTS `goods_img` (
  `goods_code` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `origin_name` varchar(100) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`goods_code`),
  CONSTRAINT `FK_goods_img_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.goods_img:~11 rows (대략적) 내보내기
DELETE FROM `goods_img`;
/*!40000 ALTER TABLE `goods_img` DISABLE KEYS */;
INSERT INTO `goods_img` (`goods_code`, `filename`, `origin_name`, `content_type`, `createdate`) VALUES
	(2, '촉촉한-몽블랑1.jpg', '촉촉한-몽블랑.jpg', 'image/jpeg', '2023-01-05 10:15:15'),
	(3, '진한-크림치즈-롤파이1.jpg', '진한-크림치즈-롤파이.jpg', 'image/jpeg', '2023-01-05 10:15:50'),
	(4, '프렌치크라상1.jpg', '프렌치크라상.jpg', 'image/jpeg', '2023-01-05 10:16:31'),
	(5, '갈릭고구마페스츄리1.jpg', '갈릭고구마페스츄리.jpg', 'image/jpeg', '2023-01-05 10:16:55'),
	(6, '치즈소시지페스츄리1.png', '치즈소시지페스츄리.png', 'image/png', '2023-01-05 10:17:25'),
	(7, '미니초코칩트위스트3.jpg', '미니초코칩트위스트.jpg', 'image/jpeg', '2023-01-05 10:17:49'),
	(8, '달콤한-뀐아망1.jpg', '달콤한-뀐아망.jpg', 'image/jpeg', '2023-01-05 10:18:07'),
	(9, '뺑오레쟁1.jpg', '뺑오레쟁.jpg', 'image/jpeg', '2023-01-05 10:18:45'),
	(12, '달콤한-딸기롤파이2.jpg', '달콤한-딸기롤파이.jpg', 'image/jpeg', '2023-01-06 10:06:40'),
	(18, '크림치즈데니쉬8.jpg', '크림치즈데니쉬.jpg', 'image/jpeg', '2023-01-06 10:18:37');
/*!40000 ALTER TABLE `goods_img` ENABLE KEYS */;

-- 테이블 shop.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_code` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(200) NOT NULL,
  `notice_content` text NOT NULL,
  `emp_id` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`notice_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.notice:~0 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 shop.orders 구조 내보내기
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_code` int(11) NOT NULL AUTO_INCREMENT,
  `goods_code` int(11) NOT NULL,
  `customer_id` varchar(100) NOT NULL,
  `address_code` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `order_price` int(11) NOT NULL,
  `order_state` enum('결제','취소','배송중','배송완료','구매확정') NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`order_code`),
  KEY `FK_orders_goods` (`goods_code`),
  KEY `FK_orders_customer` (`customer_id`),
  KEY `FK_orders_customer_address` (`address_code`),
  CONSTRAINT `FK_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_customer_address` FOREIGN KEY (`address_code`) REFERENCES `customer_address` (`address_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_goods` FOREIGN KEY (`goods_code`) REFERENCES `goods` (`goods_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.orders:~0 rows (대략적) 내보내기
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 테이블 shop.outid 구조 내보내기
DROP TABLE IF EXISTS `outid`;
CREATE TABLE IF NOT EXISTS `outid` (
  `id` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp() COMMENT '탈퇴일'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='새로운 아이디 생성시 outid + emp + customer 존재하지 않는 아이디 생성가능';

-- 테이블 데이터 shop.outid:~0 rows (대략적) 내보내기
DELETE FROM `outid`;
/*!40000 ALTER TABLE `outid` DISABLE KEYS */;
/*!40000 ALTER TABLE `outid` ENABLE KEYS */;

-- 테이블 shop.point_history 구조 내보내기
DROP TABLE IF EXISTS `point_history`;
CREATE TABLE IF NOT EXISTS `point_history` (
  `order_code` int(11) NOT NULL,
  `point_kind` enum('적립','사용') NOT NULL,
  `point` int(11) NOT NULL,
  `createdate` int(11) NOT NULL,
  PRIMARY KEY (`order_code`,`point_kind`),
  CONSTRAINT `FK__orders` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='포인트 이력테이블';

-- 테이블 데이터 shop.point_history:~0 rows (대략적) 내보내기
DELETE FROM `point_history`;
/*!40000 ALTER TABLE `point_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_history` ENABLE KEYS */;

-- 테이블 shop.pw_history 구조 내보내기
DROP TABLE IF EXISTS `pw_history`;
CREATE TABLE IF NOT EXISTS `pw_history` (
  `customer_id` varchar(100) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`customer_id`,`pw`),
  CONSTRAINT `FK__pw_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='pw변경이력이 고객댕 최근 3개까지만';

-- 테이블 데이터 shop.pw_history:~0 rows (대략적) 내보내기
DELETE FROM `pw_history`;
/*!40000 ALTER TABLE `pw_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_history` ENABLE KEYS */;

-- 테이블 shop.question 구조 내보내기
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_code` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` int(11) NOT NULL,
  `category` enum('배송','반품','교환','기타') NOT NULL,
  `question_memo` text NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`question_code`),
  KEY `FK_question_orders` (`order_code`) USING BTREE,
  CONSTRAINT `FK_question_order` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.question:~0 rows (대략적) 내보내기
DELETE FROM `question`;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 shop.question_comment 구조 내보내기
DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE IF NOT EXISTS `question_comment` (
  `comment_code` int(11) NOT NULL AUTO_INCREMENT,
  `question_code` int(11) NOT NULL,
  `comment_memo` text NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`comment_code`),
  KEY `FK__question` (`question_code`),
  CONSTRAINT `FK__question` FOREIGN KEY (`question_code`) REFERENCES `question` (`question_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.question_comment:~0 rows (대략적) 내보내기
DELETE FROM `question_comment`;
/*!40000 ALTER TABLE `question_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_comment` ENABLE KEYS */;

-- 테이블 shop.review 구조 내보내기
DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `order_code` int(11) NOT NULL,
  `review_memo` text NOT NULL,
  `createdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`order_code`),
  CONSTRAINT `FK_review_orders` FOREIGN KEY (`order_code`) REFERENCES `orders` (`order_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='orders테이블에서 order_state값이 구매확정이 되면 고객이 review 등록 가능';

-- 테이블 데이터 shop.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 shop.site__counter 구조 내보내기
DROP TABLE IF EXISTS `site__counter`;
CREATE TABLE IF NOT EXISTS `site__counter` (
  `counter_date` date NOT NULL DEFAULT curdate(),
  `counter_num` int(11) NOT NULL,
  PRIMARY KEY (`counter_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 테이블 데이터 shop.site__counter:~0 rows (대략적) 내보내기
DELETE FROM `site__counter`;
/*!40000 ALTER TABLE `site__counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `site__counter` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
