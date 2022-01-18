-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- movie_chart 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `movie_chart` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `movie_chart`;

-- 테이블 movie_chart.movie_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_dtl` (
  `mov_idn` int(11) NOT NULL COMMENT '영화  아이디',
  `mov_trailer` varchar(1000) NOT NULL COMMENT '영화 트레일러',
  `mov_age` int(11) NOT NULL COMMENT '영화 상영일',
  `mov_runtime` varchar(50) NOT NULL COMMENT '영화 상영시간',
  `mov_story` varchar(10000) NOT NULL COMMENT '영화 줄거리',
  `mov_director` varchar(50) NOT NULL COMMENT '영화 감독',
  `mov_actor` varchar(50) NOT NULL COMMENT '영화 배우',
  `mov_actorchar` varchar(50) NOT NULL COMMENT '영화배우캐릭터',
  `mov_gross` float NOT NULL DEFAULT 0 COMMENT '영화 총수입',
  PRIMARY KEY (`mov_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_dtl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_dtl` ENABLE KEYS */;

-- 테이블 movie_chart.movie_expert 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_expert` (
  `mov_idn` int(11) NOT NULL COMMENT '영화  아이디',
  `mov_expertReview` varchar(500) DEFAULT NULL COMMENT '영화 평론가 리뷰',
  PRIMARY KEY (`mov_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_expert:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_expert` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_expert` ENABLE KEYS */;

-- 테이블 movie_chart.movie_genre 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_genre` (
  `gen_num` int(11) NOT NULL COMMENT '영화 장르 아이디',
  `genre` varchar(50) NOT NULL COMMENT '영화 장르',
  PRIMARY KEY (`gen_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_genre:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;

-- 테이블 movie_chart.movie_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_like` (
  `mov_idn` int(11) NOT NULL COMMENT '영화  아이디',
  `number` int(11) NOT NULL COMMENT '회원 넘버',
  PRIMARY KEY (`mov_idn`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_like:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_like` ENABLE KEYS */;

-- 테이블 movie_chart.movie_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_mst` (
  `mov_idn` int(20) NOT NULL COMMENT '영화  아이디',
  `mov_photo` varchar(1000) DEFAULT NULL COMMENT '영화 포스터',
  `mov_title` varchar(100) DEFAULT NULL COMMENT '영화 제목',
  `mov_release` date DEFAULT NULL COMMENT '영화 개봉 날짜',
  `mov_viewCnt` int(20) DEFAULT NULL COMMENT '영화 조회수',
  `mov_gnr1` int(11) DEFAULT NULL COMMENT '영화 장르1',
  `mov_gnr2` int(11) DEFAULT NULL COMMENT '영화장르2',
  `mov_gnr3` int(11) DEFAULT NULL COMMENT '영화장르3',
  `mov_rat` float DEFAULT NULL COMMENT '영화 별점',
  `mov_rat_cnt` int(20) DEFAULT NULL COMMENT '영화 별점 count',
  `mov_lik` int(10) DEFAULT NULL COMMENT '영화 좋아요',
  `mov_lik_cnt` int(10) DEFAULT NULL COMMENT '영화 좋아요 갯수',
  `mov_viw_list_idn` int(20) DEFAULT NULL COMMENT '영화 뷰 리스트아이디',
  `number` int(100) DEFAULT NULL COMMENT '회원 넘버',
  PRIMARY KEY (`mov_idn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_mst:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_mst` ENABLE KEYS */;

-- 테이블 movie_chart.movie_rating 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_rating` (
  `mov_idn` int(11) NOT NULL COMMENT '영화  아이디',
  `number` int(11) NOT NULL COMMENT '회원 넘버',
  `rating` int(11) DEFAULT NULL COMMENT '영화 별점',
  PRIMARY KEY (`mov_idn`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_rating:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_rating` ENABLE KEYS */;

-- 테이블 movie_chart.movie_review 구조 내보내기
CREATE TABLE IF NOT EXISTS `movie_review` (
  `mov_idn` int(11) NOT NULL COMMENT '영화  아이디',
  `number` int(100) NOT NULL DEFAULT 0 COMMENT '회원 넘버',
  `content` varchar(1000) NOT NULL COMMENT '유저 리뷰',
  `createdate` date NOT NULL COMMENT '생성날짜',
  `updatedate` date NOT NULL COMMENT '수정날짜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.movie_review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movie_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_review` ENABLE KEYS */;

-- 테이블 movie_chart.user_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_mst` (
  `number` int(100) NOT NULL AUTO_INCREMENT COMMENT '회원 넘버',
  `username` varchar(50) NOT NULL COMMENT '회원 아이디',
  `password` varchar(200) NOT NULL COMMENT '회원 비밀번호',
  `email` varchar(50) NOT NULL COMMENT '회원 이메일',
  `name` varchar(50) NOT NULL COMMENT '회원 이름',
  `telephone` varchar(50) DEFAULT NULL COMMENT '회원 연락처',
  `role` varchar(50) NOT NULL COMMENT '권한',
  `provider` varchar(50) DEFAULT NULL COMMENT '공급자',
  `createdate` date NOT NULL COMMENT '생성날짜',
  `updatedate` date NOT NULL COMMENT '수정날짜',
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.user_mst:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;

-- 테이블 movie_chart.watch_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `watch_list` (
  `mov_idn` int(20) NOT NULL COMMENT '영화  아이디',
  `number` int(100) NOT NULL COMMENT '회원 넘버',
  `createdate` date NOT NULL COMMENT '생성날짜',
  PRIMARY KEY (`mov_idn`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 movie_chart.watch_list:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `watch_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
