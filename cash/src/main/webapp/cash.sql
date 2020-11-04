-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.24-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- cash 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `cash`;
CREATE DATABASE IF NOT EXISTS `cash` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cash`;

-- 테이블 cash.cashbook 구조 내보내기
DROP TABLE IF EXISTS `cashbook`;
CREATE TABLE IF NOT EXISTS `cashbook` (
  `cashbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `cashbook_kind` enum('수입','지출') NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `cashbook_price` int(11) NOT NULL,
  `cashbook_content` mediumtext NOT NULL,
  `cashbook_date` date NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`cashbook_id`),
  KEY `FK_cashbook_category` (`category_name`),
  CONSTRAINT `FK_cashbook_category` FOREIGN KEY (`category_name`) REFERENCES `category` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 cash.cashbook:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cashbook` DISABLE KEYS */;
INSERT INTO `cashbook` (`cashbook_id`, `cashbook_kind`, `category_name`, `cashbook_price`, `cashbook_content`, `cashbook_date`, `create_date`, `update_date`) VALUES
	(1, '수입', '급여', 2000000, '급여:수입', '2020-11-02', '2020-11-04 09:38:39', '2020-11-04 09:38:40'),
	(2, '수입', '용돈', 100000, '용돈:수입', '2020-11-03', '2020-11-04 09:39:35', '2020-11-04 09:39:36'),
	(3, '지출', '생활', 50000, '생활:지출', '2020-11-03', '2020-11-04 09:40:28', '2020-11-04 09:40:29'),
	(8, '지출', '식비', 10000, '식비:지출', '2020-11-03', '2020-11-04 09:41:23', '2020-11-04 09:41:24'),
	(9, '수입', '급여', 10000000, '퇴직금', '2020-11-04', '2020-11-04 15:54:55', '2020-11-04 15:54:55'),
	(10, '지출', '식비', 5000, '점심', '2020-11-03', '2020-11-04 16:03:01', '2020-11-04 16:03:01'),
	(11, '지출', '식비', 7000, '저녁', '2020-11-03', '2020-11-04 16:04:02', '2020-11-04 16:04:02'),
	(12, '수입', '용돈', 10000, '용돈', '2020-11-03', '2020-11-04 16:04:44', '2020-11-04 16:04:44');
/*!40000 ALTER TABLE `cashbook` ENABLE KEYS */;

-- 테이블 cash.category 구조 내보내기
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_name` varchar(50) NOT NULL,
  `category_info` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 cash.category:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_name`, `category_info`) VALUES
	('급여', '수입'),
	('생활', '지출'),
	('식비', '지출'),
	('용돈', '수입'),
	('의료', '지출');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 cash.notice 구조 내보내기
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(200) NOT NULL,
  `notice_content` text NOT NULL,
  `notice_date` datetime NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 cash.notice:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`notice_id`, `notice_title`, `notice_content`, `notice_date`) VALUES
	(3, 'To do list', '1. cashbook날짜별 CRUD //수정 삭제 추가\r\n2.notice CRUD\r\n3.cagegory CRUD\r\n3. 통계페이지(년별 지출합, 수입합, 카테고리별,...)', '2020-11-04 13:40:35');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
