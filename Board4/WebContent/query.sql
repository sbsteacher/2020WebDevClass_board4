-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- board3 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `board3` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `board3`;

-- 테이블 board3.t_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_board` (
  `i_board` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typ` int(10) unsigned NOT NULL COMMENT '게시판 종류',
  `seq` int(10) unsigned NOT NULL COMMENT '글번호',
  `title` varchar(100) NOT NULL,
  `ctnt` varchar(1000) NOT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `i_user` int(10) unsigned DEFAULT NULL COMMENT '글쓴이',
  PRIMARY KEY (`i_board`),
  UNIQUE KEY `typ` (`typ`,`seq`),
  KEY `i_user` (`i_user`),
  CONSTRAINT `t_board_ibfk_1` FOREIGN KEY (`i_user`) REFERENCES `t_user` (`i_user`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 board3.t_board:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_board` DISABLE KEYS */;
INSERT INTO `t_board` (`i_board`, `typ`, `seq`, `title`, `ctnt`, `r_dt`, `hits`, `i_user`) VALUES
	(1, 1, 1, '게임 첫글!!!', '반갑습니다.', '2020-12-17 18:44:02', 0, 1),
	(4, 2, 1, '스포츠 첫번째 글!', 'ㅁㄴ이라ㅓㅁㄴ어ㅏㅣㄻㄴ이ㅓㅏ리ㅓㅏ', '2020-12-17 18:49:22', 0, 1),
	(5, 3, 1, '연예/방송 첫번째 글!!', 'ㅁㄴ어ㅏㅣㅁㄴ어ㅏㅣㅁㄴㅇ리ㅓㅏㅁㄴ이ㅓㅏㄻ니ㅓㅏㅇㄹ', '2020-12-17 18:49:52', 0, 1),
	(6, 1, 4, '나는 리모콘입니다.', 'ㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ', '2020-12-17 19:34:48', 0, 3),
	(8, 2, 2, 'ㅎㅎㅎㅎㅎ', 'ㅁㅁㅁㅁㅁ', '2020-12-18 18:08:59', 0, 1),
	(9, 2, 3, '33333', 'ㅁㄴㅇㄻㄴㅇㄹ', '2020-12-18 18:09:38', 0, 1),
	(10, 1, 5, 'zzzz1111', 'dddd1111', '2020-12-21 18:50:26', 0, 1),
	(11, 3, 2, '2222', 'ㅁㄴㅇㄻㄴㅇㄹ', '2020-12-21 20:15:47', 0, 1),
	(12, 1, 6, '', '', '2021-01-12 20:31:23', 0, 1),
	(13, 1, 7, '', '', '2021-01-12 20:31:40', 0, 1),
	(14, 1, 8, 'ddddd', 'aaaaa', '2021-01-12 20:36:10', 0, 1),
	(15, 2, 4, 'gggg', 'adsafawsdff', '2021-01-12 20:36:42', 0, 1),
	(16, 3, 3, '88888', 'fcdfddd', '2021-01-12 20:36:49', 0, 1);
/*!40000 ALTER TABLE `t_board` ENABLE KEYS */;

-- 테이블 board3.t_board_cmt 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_board_cmt` (
  `i_cmt` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `i_board` int(10) unsigned NOT NULL,
  `i_user` int(10) unsigned DEFAULT NULL,
  `ctnt` varchar(200) NOT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`i_cmt`),
  KEY `i_board` (`i_board`),
  KEY `i_user` (`i_user`),
  CONSTRAINT `t_board_cmt_ibfk_1` FOREIGN KEY (`i_board`) REFERENCES `t_board` (`i_board`),
  CONSTRAINT `t_board_cmt_ibfk_2` FOREIGN KEY (`i_user`) REFERENCES `t_user` (`i_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 board3.t_board_cmt:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_board_cmt` DISABLE KEYS */;
INSERT INTO `t_board_cmt` (`i_cmt`, `i_board`, `i_user`, `ctnt`, `r_dt`) VALUES
	(2, 6, 1, '안녕하세요232222dddd', '2020-12-22 19:26:38'),
	(3, 6, 1, '하하하하1111', '2020-12-22 19:26:41'),
	(5, 6, 3, '나의 댓글 나는 리모콘', '2020-12-22 19:37:52'),
	(7, 10, 1, 'asdfasdf', '2020-12-23 18:03:46'),
	(8, 10, 1, 'asdfㅇㅇㅇㅇㅇ', '2020-12-23 18:03:47');
/*!40000 ALTER TABLE `t_board_cmt` ENABLE KEYS */;

-- 테이블 board3.t_board_favorite 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_board_favorite` (
  `i_board` int(10) unsigned NOT NULL,
  `i_user` int(10) unsigned NOT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`i_board`,`i_user`),
  KEY `i_user` (`i_user`),
  CONSTRAINT `t_board_favorite_ibfk_1` FOREIGN KEY (`i_board`) REFERENCES `t_board` (`i_board`),
  CONSTRAINT `t_board_favorite_ibfk_2` FOREIGN KEY (`i_user`) REFERENCES `t_user` (`i_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 board3.t_board_favorite:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_board_favorite` DISABLE KEYS */;
INSERT INTO `t_board_favorite` (`i_board`, `i_user`, `r_dt`) VALUES
	(1, 1, '2020-12-24 20:44:41'),
	(1, 4, '2021-01-12 21:29:00'),
	(4, 1, '2021-01-12 21:28:35');
/*!40000 ALTER TABLE `t_board_favorite` ENABLE KEYS */;

-- 테이블 board3.t_manage_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_manage_board` (
  `typ` int(10) unsigned NOT NULL,
  `nm` varchar(20) NOT NULL,
  `orderby` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 board3.t_manage_board:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_manage_board` DISABLE KEYS */;
INSERT INTO `t_manage_board` (`typ`, `nm`, `orderby`) VALUES
	(1, '게임', 1),
	(2, '스포츠', 2),
	(3, '연예/방송', 3),
	(4, 'IT', 4),
	(5, '교육', 5);
/*!40000 ALTER TABLE `t_manage_board` ENABLE KEYS */;

-- 테이블 board3.t_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_user` (
  `i_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL COMMENT '유저 아이디',
  `user_pw` varchar(150) NOT NULL COMMENT '유저 비밀번호',
  `salt` varchar(50) NOT NULL,
  `nm` varchar(10) NOT NULL,
  `gender` int(1) unsigned DEFAULT NULL,
  `ph` char(13) DEFAULT NULL,
  `r_dt` datetime DEFAULT current_timestamp(),
  `m_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`i_user`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 board3.t_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` (`i_user`, `user_id`, `user_pw`, `salt`, `nm`, `gender`, `ph`, `r_dt`, `m_dt`) VALUES
	(1, 'mic', 'f5da95d62965224d1b8b3e6dfebcc6cb9cb160826a9341653b16b6814709775be12bb04eb10a66f7765d8de932720d81227e8e74393189909d1d3c2498f72fe2', 'HA3Li70a1Pau3/VvQZtsQA==', '도흠', 0, '010-1111-1111', '2020-12-15 19:22:18', '2020-12-15 19:22:18'),
	(3, 'remocon', '2f9aa530e40cf1a7a4df66f8c30fd4876e8676574b1fc248a09a9547761fd79aa91fd893810934230ed39e591a32541584b4fa132b521419a74f33253ef6f78d', 'gH5TzjUREZcJex3ca7A6gg==', '리모콘', 1, '010-1234-1234', '2020-12-16 18:23:27', '2020-12-16 18:23:27'),
	(4, 'ppp', '5a9ecc7859acd0616b0f15083286b89009a8390b7688035f1d17788c2e7a7b507ff0e919f91e7bc6c7a935a6f319ecd3f66d1f9c93411841a628cce4899b7ce9', 'LNjseLZ+cqE/+dxr05R5zA==', '아아아아아', 0, '010-2222-1111', '2021-01-07 20:21:57', '2021-01-07 20:21:57');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
