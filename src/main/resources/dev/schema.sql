DROP TABLE IF EXISTS HASHTAG;
DROP TABLE IF EXISTS MEMBER;
DROP TABLE IF EXISTS CATEGORY;
DROP TABLE IF EXISTS FOLLOW;
DROP TABLE IF EXISTS POST;
DROP TABLE IF EXISTS POST_HASHTAG;
DROP TABLE IF EXISTS POST_IMAGE;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS BOOKMARK;
DROP TABLE IF EXISTS COMMENT;


CREATE TABLE `HASHTAG`
(
    `ID`         BIGINT(20) NOT NULL AUTO_INCREMENT,
    `TAG_NAME`   VARCHAR(255) DEFAULT NULL,
    `CHOSUNG`    VARCHAR(255) DEFAULT NULL COMMENT '초성',
    `CREATED_AT` DATETIME(6) DEFAULT NULL COMMENT '생성일자',
    PRIMARY KEY (`ID`)
);


-- TYPHOONSHOP.`MEMBER` DEFINITION

CREATE TABLE `MEMBER`
(
    `ID`          BIGINT(20) NOT NULL AUTO_INCREMENT,
    `EMAIL`       VARCHAR(255) NOT NULL COMMENT '이메일',
    `PASSWORD`    VARCHAR(255) NOT NULL COMMENT '비밀번호',
    `LOGIN_TYPE`  ENUM('BASIC','GOOGLE','KAKAO','NAVER') NOT NULL COMMENT '로그인타입4가지',
    `SHOP_NAME`   VARCHAR(255) NOT NULL COMMENT '상점명 (젤많이쓸거)',
    `DESCRIPTION` VARCHAR(255) NOT NULL COMMENT '상점 설명',
    `LOGO_PATH`   VARCHAR(255) DEFAULT NULL COMMENT '상점 로고',
    `REAL_NAME`   VARCHAR(20)  NOT NULL COMMENT '실명',
    `PHONE`       VARCHAR(20)  DEFAULT NULL COMMENT '핸드폰번호',
    `CREATED_AT`  DATETIME(6) DEFAULT NULL COMMENT '생성일자',
    `MODIFIED_AT` DATETIME(6) DEFAULT NULL COMMENT '마지막수정일',
    PRIMARY KEY (`ID`),
    UNIQUE KEY `UK_C619BAFWE6254FNNMNB83MF54` (`EMAIL`),
    UNIQUE KEY `UK_5VJPM97QFWTSCSQH0C0WETFN0` (`SHOP_NAME`)
);


-- TYPHOONSHOP.CATEGORY DEFINITION

CREATE TABLE `CATEGORY`
(
    `ID`         BIGINT(20) NOT NULL,
    `PARENT_ID`  BIGINT(20) DEFAULT NULL,
    `NAME`       VARCHAR(255) NOT NULL COMMENT '카테고리영',
    `CREATED_AT` DATETIME(6) DEFAULT NULL COMMENT '카테고리생성일자',
    PRIMARY KEY (`ID`),
    KEY          `FKN3KEKNTR7PM8G9V8ASK698ATO` (`PARENT_ID`)
);


-- TYPHOONSHOP.FOLLOW DEFINITION

CREATE TABLE `FOLLOW`
(
    `ID`           BIGINT(20) NOT NULL AUTO_INCREMENT,
    `FOLLOWING_ID` BIGINT(20) DEFAULT NULL COMMENT '팔로잉당하는사람',
    `FOLLOWER_ID`  BIGINT(20) DEFAULT NULL COMMENT '팔로우하는 사람',
    `CREATED_AT`   DATETIME(6) DEFAULT NULL COMMENT '생성일자',
    PRIMARY KEY (`ID`),
    KEY            `FKAYJ28DLILJ0UMT082PAAHYS70` (`FOLLOWER_ID`),
    KEY            `FK90TERFT5D3K916JIBWCYX0R1V` (`FOLLOWING_ID`)

);


-- TYPHOONSHOP.POST DEFINITION

CREATE TABLE `POST`
(
    `ID`          BIGINT(20) NOT NULL AUTO_INCREMENT,
    `MEMBER_ID`   BIGINT(20) DEFAULT NULL,
    `CATEGORY_ID` BIGINT(20) DEFAULT NULL,
    `TITLE`       VARCHAR(255) NOT NULL COMMENT '제목',
    `CONTENT`     VARCHAR(255) NOT NULL COMMENT '내용',
    `STATUS`      ENUM('ON_SALE','RESERVED','SOLD_OUT') DEFAULT NULL COMMENT '판매상태',
    `PRICE`       INT(11) DEFAULT NULL COMMENT '가격',
    `IS_DELETED`  BIT(1)       NOT NULL,
    `CREATED_AT`  DATETIME(6) DEFAULT NULL COMMENT '생성일자',
    `MODIFIED_AT` DATETIME(6) DEFAULT NULL COMMENT '마지막수정일',
    PRIMARY KEY (`ID`),
    KEY           `FKT21ROSLDBSCRVL6B2DXXS9FN9` (`CATEGORY_ID`),
    KEY           `FKJFLCUMS7YP2NUBHUAF5TT21O1` (`MEMBER_ID`)
);

-- TYPHOONSHOP.POST_HASHTAG DEFINITION

CREATE TABLE `POST_HASHTAG`
(
    `ID`         BIGINT(20) NOT NULL AUTO_INCREMENT,
    `POST_ID`    BIGINT(20) DEFAULT NULL,
    `HASHTAG_ID` BIGINT(20) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY          `FK1WN601B276D4EOFJEM1XTXJ9H` (`HASHTAG_ID`),
    KEY          `FK6SDVEPR6V3L1SHJMG7SCT0P6C` (`POST_ID`)
);


-- TYPHOONSHOP.POST_IMAGE DEFINITION

CREATE TABLE `POST_IMAGE`
(
    `ID`           BIGINT(20) NOT NULL AUTO_INCREMENT,
    `POST_ID`      BIGINT(20) DEFAULT NULL,
    `IS_THUMBNAIL` BIT(1)       NOT NULL DEFAULT B'0' COMMENT '섬네일 여부',
    `IMAGE_PATH`   VARCHAR(255) NOT NULL COMMENT '이미지경로',
    PRIMARY KEY (`ID`),
    KEY            `FK11GUHHHNJMK1UOEIHMJUVUJPK` (`POST_ID`)
);

-- TYPHOONSHOP.REVIEW DEFINITION

CREATE TABLE `REVIEW`
(
    `ID`          BIGINT(20) NOT NULL AUTO_INCREMENT,
    `RATING`      INT(11) DEFAULT NULL,
    `REVIEWER_ID` BIGINT(20) NOT NULL,
    `REVIEWEE_ID` BIGINT(20) NOT NULL,
    `CONTENT`     VARCHAR(255)    DEFAULT NULL,
    `IS_DELETED`  BIT(1) NOT NULL DEFAULT B'0',
    `CREATED_AT`  DATETIME(6) DEFAULT NULL COMMENT '생성일자',
    `MODIFIED_AT` DATETIME(6) DEFAULT NULL COMMENT '마지막수정일',
    PRIMARY KEY (`ID`),
    KEY           `FK7R9NAC8PHTP8SJ0DHE7PQOXFS` (`REVIEWEE_ID`),
    KEY           `FK9LBKYFVWDWC5IXUMPKIGU8NW8` (`REVIEWER_ID`)
);


-- TYPHOONSHOP.BOOKMARK DEFINITION

CREATE TABLE `BOOKMARK`
(
    `ID`         BIGINT(20) NOT NULL AUTO_INCREMENT,
    `MEMBER_ID`  BIGINT(20) DEFAULT NULL,
    `POST_ID`    BIGINT(20) DEFAULT NULL,
    `CREATED_AT` DATETIME(6) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY          `FK3FCALWBT22PG1M5D5DYGUIDXK` (`MEMBER_ID`),
    KEY          `FKTAQACRYANVG2VU1SX1O33QVAX` (`POST_ID`)
);


-- TYPHOONSHOP.COMMENT DEFINITION

CREATE TABLE `COMMENT`
(
    `ID`           BIGINT(20) NOT NULL AUTO_INCREMENT,
    `POST_ID`      BIGINT(20) DEFAULT NULL,
    `COMMENTER_ID` BIGINT(20) DEFAULT NULL,
    `CONTENT`      VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY            `FKMX69B7YFRWATVMN64JUJDO25W` (`COMMENTER_ID`),
    KEY            `FKMAITM7CS4POAUHPTAY7EHMGE3` (`POST_ID`)
);

CREATE TABLE POST_VIEW_COUNT
(
    `POST_ID`      BIGINT(20) NOT NULL,
    `VIEW_COUNT`   INT(11) DEFAULT NULL,
    `LastViewedAt` DATETIME(6) DEFAULT NULL,
    PRIMARY KEY (`ID`),
    KEY            `FKMX69B7YFRWATVMN64JUJDO25W` (`POST_ID`);
);

CREATE TABLE POST_VIEW_COUNT
(
    ID         BIGINT AUTO_INCREMENT,
    POST_ID    BIGINT,
    VIEW_COUNT BIGINT,
    VIEW_DAY   DATE,
    PRIMARY KEY (ID),
    INDEX      post_view_idx (POST_ID, VIEW_DAY) -- 다중인덱스
);