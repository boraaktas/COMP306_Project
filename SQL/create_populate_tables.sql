-- Active: 1681438043765@@127.0.0.1@3306@class_booking
DROP DATABASE IF EXISTS class_booking;
CREATE DATABASE class_booking;
USE class_booking;
SET GLOBAL event_scheduler = ON;


DROP TABLE IF EXISTS JOINS;
DROP TABLE IF EXISTS RESERVATIONS;
DROP TABLE IF EXISTS CONNECTIONS;
DROP TABLE IF EXISTS CLASSES;
DROP TABLE IF EXISTS REGULAR_USERS;
DROP TABLE IF EXISTS ADMINS;
DROP TABLE IF EXISTS USERS;


CREATE TABLE USERS 
	(ku_id              CHAR(5)	        NOT NULL,
         firstname	    VARCHAR(20)		NOT NULL,
         lastname           VARCHAR(20)         NOT NULL,
         mail	            VARCHAR(50)		NOT NULL,
         password	    VARCHAR(20)		NOT NULL,    
        PRIMARY KEY (ku_id),
        UNIQUE (mail))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('10537', 'Emir', 'Polat', 'arın44@example.net', 'f520dc1a699b583a608c');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('10832', 'Derin', 'Canberk', 'polat.armağan@example.org', 'a53b3794d6b7054ea294');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('11474', 'Burak', 'Polat', 'arhan.ada@example.org', 'b9643592ce617431054f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('12338', 'Rasha', 'Serhan', 'berke.aşkın@example.org', '065bf2ea8351bb52efb8');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('12463', 'Rüzgar', 'Arın', 'sarila.bora@example.org', '54aee1019fa17d0c910d');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('14061', 'Çınar', 'Mövsümov', 'urüzgar@example.com', 'b5522d8260550d89d259');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('14364', 'Güney', 'Ege', 'lemre@example.net', '6104182a04917f4d24d4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('16697', 'Emre', 'Tuna', 'göktürk.arhan@example.com', '5b581b2a41be1b88218f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('17955', 'Ege', 'Cemşid', 'çınar.kağan@example.net', '037d283cd899e625791b');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('18057', 'Aliye', 'Canberk', 'barlas.türker@example.org', '0835f09b5e0bd1594bca');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('18478', 'Dağhan', 'Utku', 'sarp.zeynep@example.net', '1b8ea42d99ac10652964');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('18488', 'Efe', 'Meriç', 'wdağhan@example.org', '012e66dce05f5eb0fdc8');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('19074', 'Fatimah', 'Deniz', 'doruk.berke@example.org', '2999931c0cc0b6537e7e');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('19515', 'Burak', 'Polat', 'qderin@example.com', '681589839b3da85050b9');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('21071', 'Burak', 'Rüzgar', 'aliye37@example.net', '97d93babf27bd64494d7');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('22215', 'Arhan', 'Tuna', 'meriç40@example.org', '38226627f643af24af95');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('23604', 'Toprak', 'Toprak', 'derin.fatimah@example.net', '7d9ee4bd2903e2f05f56');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('24041', 'Cem', 'Koray', 'ada46@example.com', 'fcc3a1e7f4e42db26752');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('24986', 'Meriç', 'Berk', 'lefe@example.org', '8aa4b72a95093bff307e');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('25213', 'Sarila', 'Serhan', 'başkın@example.org', 'bbeff7dd02f1ec7d8910');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('25513', 'Sarp', 'İrtegün', 'armağan.zeynep@example.net', 'c188b107d25cfe2ecefe');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('27608', 'Rasha', 'Sarp', 'kağan.barlas@example.com', '11484ca6fc0823bfaca0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('27908', 'Naila', 'Derin', 'naila.i̇rtegün@example.com', 'a49f9a6b7c3ad8f204db');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('28097', 'Kutay', 'Arhan', 'tyağız@example.org', '6c7bb5c62a400a7a1c9b');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('28860', 'Fatimah', 'Emirhanlı', 'serhan.doruk@example.net', '835cc16486333a469e5f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('29419', 'Toprak', 'Bartu', 'garhan@example.net', '88e3a6a802bbe96853a1');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('29850', 'Zeynep', 'Güney', 'berk.emre@example.org', '980ecd8f6943a6dd166a');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('30257', 'Rasha', 'Mövsümov', 'myiğit@example.com', 'fa829a5fd10626360b99');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('30553', 'Serhan', 'Berkay', 'yağız44@example.org', '1e5bcfbd091a4322f81f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('30657', 'Meriç', 'Mövsümov', 'emre03@example.com', '7d432c88a6e04604fdbc');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('30767', 'Bora', 'Ege', 'bcemşid@example.net', '9ad902598441ebd2a3aa');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('31422', 'Naila', 'İrtegün', 'mert00@example.net', 'bc58060b27a727b3ddff');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('34189', 'Sarp', 'Toprak', 'bartu.dağhan@example.com', '67c47379881cf35aacdb');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('34327', 'Bora', 'Koray', 'yiğit42@example.org', '69109b4692492d1798b9');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('35374', 'Rasha', 'Armağan', 'tyiğit@example.org', 'c8357c91f7e8c65f02be');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('35683', 'Meriç', 'Onur', 'aşkın.derin@example.org', 'b2d26bc5cddf359701c0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('36313', 'Görkem', 'Yiğit', 'tburak@example.org', '9ccf5b7986271c0163e0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('36619', 'Derin', 'Rüzgar', 'arhan.çağan@example.com', '8922e52cd07b0b312206');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('40916', 'Rasha', 'Emirhan', 'derin.berke@example.org', '15c4e5c89ab39aeb0b7b');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('41210', 'Emre', 'Utku', 'bora.barlas@example.com', '80aa88463d026d3af160');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('42393', 'Meriç', 'Arhan', 'yağız.i̇rtegün@example.com', '03d0ae658924c24763df');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('42482', 'Güney', 'Aşkın', 'adoruk@example.net', '878f07908dd9c446ac0e');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('43934', 'Sarila', 'Sarp', 'sarp.sarila@example.com', '5b6b3ce2a5e54f4abfc4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('44077', 'Arın', 'Mert', 'burak.koray@example.com', '7dfda0771121fb11a9d7');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('44253', 'Derin', 'İrtegün', 'ugörkem@example.net', '8057df40c54cac2dfe22');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('44741', 'Meriç', 'Arın', 'baran59@example.net', 'f5ae75b95774d0bab56b');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('45207', 'Mert', 'Ege', 'kağan.baran@example.net', '07049f6acb153d588cac');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('45503', 'Meriç', 'Derin', 'emre.mövsümov@example.com', '06061f284a39c09de65c');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('45605', 'Emir', 'Yiğit', 'zgörkem@example.com', '0b30e338d3712041ead5');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('45783', 'Derin', 'Utku', 'qmeriç@example.com', '262a5904ec3b9c0d9c81');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('46115', 'Ferid', 'Emre', 'kkerem@example.org', '72a761e091cd9f926edb');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('46387', 'Emirhan', 'Canberk', 'yiğit.onur@example.org', '51837ba969bbcbab6740');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('46683', 'Emirhan', 'Güney', 'arın.göktürk@example.com', '12622f97fafc8761821c');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('49826', 'Efe', 'Bora', 'barlas.çağan@example.org', '67c3264f454dc8b250c3');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('49997', 'Meriç', 'Berk', 'aliye.ege@example.net', '7b04cb1758ba2ce2b359');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('50062', 'Zeynep', 'Bora', 'emir.koray@example.net', '9e8b5afada7da6196918');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('56374', 'Bora', 'Şükür', 'gburak@example.net', 'f93b561beaf98ea0cdd4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('58462', 'Cem', 'Derin', 'onur.meriç@example.org', 'd06a6c9c20f516e16616');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('59170', 'Rasha', 'Sarp', 'emirhan.aliye@example.org', '42a9a4c7e0c09cf7f915');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('60404', 'Yağız', 'Ege', 'aşkın.arın@example.net', '59c4c1e4d0a4ea455bb4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('62913', 'Sarp', 'Göktürk', 'mberke@example.org', 'de60cf8f00abd0693983');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('62970', 'Naila', 'Atakan', 'arhan.meriç@example.com', '7b88605329b16c18e6a0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('63001', 'Sarila', 'Şükür', 'berkay.berkay@example.org', '6e0df24ebcee4aef08e5');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('64388', 'Ada', 'Ada', 'akerem@example.net', '982753592316b99927d9');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('65932', 'Onur', 'Güney', 'dağhan78@example.net', '4eafea53903b9160c3d3');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('71472', 'Ada', 'Yiğit', 'polat.emirhan@example.com', '191f95f6f2195c8e73c4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('72819', 'Polat', 'Meriç', 'meriç.görkem@example.net', 'c239cddbe444cf120f42');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('74028', 'Rasha', 'Ege', 'i̇rtegün.yiğit@example.com', '26755d4bfdcf11e7f093');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('77330', 'Dağhan', 'Yiğit', 'pberke@example.com', 'cc332b6a04d9a1cac169');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('78716', 'Polat', 'Ada', 'efe.emirhanlı@example.org', '519c1dfdb83cb7c17eee');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('78991', 'Kağan', 'Kerem', 'bartu11@example.org', 'd134bdd85cba88443f44');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('81430', 'Arhan', 'Berkay', 'derin.yiğit@example.org', '27836e2a374b3de325e0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('82498', 'Ada', 'Şentürk', 'görkem.arın@example.org', '820de7a63d074ef83143');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('82668', 'Sarila', 'Kutay', 'efe.fatimah@example.net', 'e5b8e3cb489ed9fbcb06');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('83299', 'Emir', 'Emirhanlı', 'burak32@example.com', 'cb5eb19694524e5ead6c');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('83772', 'Arın', 'Aşkın', 'deniz.fatimah@example.net', 'b3ce7968636a83dbf2f9');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('84731', 'Zeynep', 'Yağız', 'derin59@example.com', '7aec79702adb5dff5189');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('86190', 'Yiğit', 'Deniz', 'ada.burak@example.net', '231cdb12b4468b8383ca');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('87282', 'Çağan', 'Tuna', 'fatimah.sarp@example.net', '8b1783d5ec0ccbb9a351');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('87771', 'Sarila', 'Deniz', 'ege.derin@example.org', '494c729bee278c951dba');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('88820', 'Onur', 'Alp', 'utku.mert@example.net', 'c60a60c23ad27cffb627');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('89519', 'Ada', 'Derin', 'bpolat@example.net', '5130675f3585b9c768d3');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('89901', 'Meriç', 'Sarp', 'aliye.bartu@example.net', 'd064da9aec3da924521f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('89988', 'Arın', 'Yağız', 'aberkay@example.net', '86021cbaf3381a554967');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('90201', 'Utku', 'Emre', 'meriç.berk@example.com', '1d3ed87eea49ee6c00a5');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('90438', 'Fatimah', 'Mert', 'gonur@example.net', 'e5ac8e9e519fb709d2bf');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('90859', 'Fatimah', 'Alp', 'bora.ege@example.com', '9d3ea8b37dcd721b3775');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('91658', 'Emirhan', 'Bartu', 'şentürk.toprak@example.com', 'c51c81fefc4dcffbe8d1');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('91816', 'Zeynep', 'Armağan', 'oaşkın@example.net', '9173a13ef8c503bbd7d2');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('92614', 'Aliye', 'Dağhan', 'abarlas@example.net', '8ff4589964b44ec4dedf');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('93857', 'Polat', 'Derin', 'fatimah34@example.net', '89ef4a573a42591b772e');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('94844', 'Berkay', 'Deniz', 'derin.canberk@example.org', 'b6efe3cfb75ecc3c56fd');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('94875', 'Dağhan', 'Utku', 'berkay45@example.com', 'e394e36e6816f5a33339');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('95067', 'Naila', 'Berke', 'ada.atakan@example.org', '3372032106455e288629');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('96470', 'Aliye', 'Ege', 'hemirhan@example.com', '9c90549642240ba7862f');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('96836', 'Rüzgar', 'Polat', 'fatimah03@example.com', '8b55fc2580c32bba4fc5');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('96852', 'Rasha', 'Mövsümov', 'fatimah65@example.org', '88879f8bfa4e8826ddf4');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('97507', 'Zeynep', 'Baran', 'hkoray@example.net', 'b11a7f936525311919d0');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('98121', 'Meriç', 'Emirhan', 'görkem.arhan@example.net', '095e99e2b2c64c0e3fc7');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('71812', 'Sude', 'Güngör', 'rgungor19@ku.edu.tr', 'sude');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('99013', 'Rasha', 'Ege', 'uefe@example.org', 'f891737bd37e8fabd468');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('71461', 'Bora', 'Aktas', 'baktas19@ku.edu.tr', 'mylittlepony');
INSERT INTO `USERS` (`ku_id`, `firstname`, `lastname`, `mail`, `password`) VALUES ('00000', 'admin', 'admin', 'admin', 'admin');



CREATE TABLE ADMINS
        (ku_id              CHAR(5)         NOT NULL,
        PRIMARY KEY (ku_id),
        FOREIGN KEY (ku_id) REFERENCES USERS(ku_id))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `ADMINS` (`ku_id`) VALUES ('00000');


CREATE TABLE REGULAR_USERS
        (ku_id              CHAR(5)             NOT NULL,
         academic_level     VARCHAR(20),
         faculty            VARCHAR(10),
         gender             VARCHAR(20)         NOT NULL,   
         birthdate          DATE                NOT NULL,   
        CONSTRAINT academic_level_chk CHECK (academic_level IN ('Freshman', 'Sophomore', 'Junior', 'Senior', 'PhD', 'Masters')),
        CONSTRAINT faculty CHECK (faculty IN ('CASE', 'CS', 'CSSH', 'CE', 'SOM', 'SON', 'LAW')),
        CONSTRAINT gender_chk CHECK (gender IN ('Male', 'Female', 'Non-binary')), 
        PRIMARY KEY (ku_id),
        FOREIGN KEY (ku_id) REFERENCES USERS(ku_id))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('71812', 'Junior', 'CSSH', 'Female', '2001-07-07');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('10537', 'PhD', 'SOM', 'Female', '1972-07-02');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('10832', 'PhD', 'CASE', 'Non-binary', '2017-07-24');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('11474', 'Junior', 'CE', 'Female', '2008-07-07');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('12338', 'PhD', 'SOM', 'Non-binary', '2016-08-27');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('12463', 'Masters', 'LAW', 'Male', '1982-02-28');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('14061', 'Masters', 'CSSH', 'Non-binary', '1979-11-28');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('14364', 'Junior', 'CE', 'Male', '1996-02-29');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('16697', 'Junior', 'SOM', 'Female', '1987-01-23');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('17955', 'PhD', 'CE', 'Female', '1983-07-05');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('18057', 'Sophomore', 'CE', 'Non-binary', '2007-02-26');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('18478', 'Sophomore', 'LAW', 'Male', '2004-08-05');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('18488', 'Masters', 'CE', 'Female', '2005-04-21');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('19074', 'Freshman', 'SOM', 'Male', '1971-04-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('19515', 'Sophomore', 'CE', 'Male', '1981-11-05');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('21071', 'Senior', 'CE', 'Male', '2009-10-17');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('22215', 'Sophomore', 'CS', 'Non-binary', '1973-03-22');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('23604', 'Freshman', 'SON', 'Male', '2009-03-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('24041', 'Freshman', 'SOM', 'Non-binary', '1996-10-21');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('24986', 'Freshman', 'CS', 'Non-binary', '2021-04-27');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('25213', 'Masters', 'CSSH', 'Male', '2003-01-25');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('25513', 'Masters', 'LAW', 'Female', '2020-08-07');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('27608', 'Junior', 'LAW', 'Female', '2017-07-25');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('27908', 'Junior', 'LAW', 'Female', '2007-09-16');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('28097', 'Masters', 'SOM', 'Female', '1985-06-09');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('28860', 'Junior', 'SON', 'Female', '2002-07-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('29419', 'Masters', 'CS', 'Male', '1971-02-25');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('29850', 'PhD', 'SON', 'Female', '2022-06-26');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('30257', 'Sophomore', 'SON', 'Female', '1997-07-17');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('30553', 'Senior', 'SON', 'Male', '2013-04-04');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('30657', 'Masters', 'SOM', 'Male', '2021-05-10');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('30767', 'Senior', 'LAW', 'Non-binary', '1976-06-11');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('31422', 'PhD', 'SON', 'Male', '1996-02-18');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('34189', 'Senior', 'CSSH', 'Male', '1981-04-21');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('34327', 'Sophomore', 'SOM', 'Female', '1999-06-29');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('35374', 'Sophomore', 'SOM', 'Female', '2000-11-14');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('35683', 'Freshman', 'CS', 'Male', '2002-08-23');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('36313', 'Junior', 'LAW', 'Female', '1976-09-24');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('36619', 'Masters', 'SON', 'Female', '1987-03-09');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('40916', 'Sophomore', 'CS', 'Female', '2012-08-12');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('41210', 'Sophomore', 'CASE', 'Female', '1970-11-07');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('42393', 'Sophomore', 'CE', 'Female', '2004-08-14');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('42482', 'Masters', 'CS', 'Non-binary', '2005-06-27');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('43934', 'Masters', 'CE', 'Non-binary', '2015-08-26');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('44077', 'PhD', 'CASE', 'Female', '2011-09-12');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('44253', 'PhD', 'CSSH', 'Male', '1989-01-20');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('44741', 'Junior', 'CASE', 'Female', '1972-08-12');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('45207', 'PhD', 'SON', 'Non-binary', '1985-04-01');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('45503', 'Sophomore', 'CSSH', 'Male', '1974-08-13');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('45605', 'PhD', 'SON', 'Female', '1999-12-19');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('45783', 'Sophomore', 'CASE', 'Female', '1986-10-19');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('46115', 'Freshman', 'CSSH', 'Male', '1991-07-24');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('46387', 'Junior', 'SOM', 'Male', '2010-03-28');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('46683', 'Masters', 'SOM', 'Non-binary', '1990-07-12');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('49826', 'Freshman', 'LAW', 'Non-binary', '1982-01-02');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('49997', 'Freshman', 'SON', 'Female', '2015-12-13');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('50062', 'Sophomore', 'CE', 'Female', '2001-07-23');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('56374', 'Masters', 'CE', 'Male', '1989-06-04');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('58462', 'Freshman', 'SON', 'Non-binary', '1970-01-02');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('59170', 'Junior', 'LAW', 'Male', '1982-10-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('60404', 'Masters', 'SOM', 'Male', '1981-07-29');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('62913', 'Freshman', 'CSSH', 'Male', '1997-06-30');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('62970', 'Senior', 'SOM', 'Male', '2000-02-13');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('63001', 'Masters', 'CS', 'Female', '1975-12-17');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('64388', 'Masters', 'CE', 'Female', '1977-03-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('65932', 'Masters', 'SOM', 'Non-binary', '2002-11-09');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('71472', 'Sophomore', 'CS', 'Male', '1985-04-04');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('72819', 'Junior', 'CSSH', 'Female', '2005-08-30');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('74028', 'Senior', 'CSSH', 'Non-binary', '2007-04-01');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('77330', 'Senior', 'CS', 'Female', '2003-04-27');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('78716', 'Sophomore', 'CS', 'Male', '2017-07-05');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('78991', 'Masters', 'CSSH', 'Non-binary', '1993-12-20');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('81430', 'Sophomore', 'CASE', 'Non-binary', '2017-09-27');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('82498', 'Senior', 'CS', 'Female', '2000-09-14');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('82668', 'PhD', 'CASE', 'Male', '1978-03-31');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('83299', 'Sophomore', 'SOM', 'Male', '1975-11-02');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('83772', 'Sophomore', 'CASE', 'Female', '1991-09-26');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('84731', 'Senior', 'CASE', 'Female', '1972-07-18');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('86190', 'Senior', 'SOM', 'Female', '2004-09-21');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('87282', 'Senior', 'CE', 'Male', '1988-07-24');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('87771', 'Freshman', 'SOM', 'Female', '2006-08-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('88820', 'PhD', 'CS', 'Non-binary', '2011-05-20');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('89519', 'Sophomore', 'CE', 'Non-binary', '2000-12-28');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('89901', 'Junior', 'CASE', 'Male', '1975-12-10');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('89988', 'Senior', 'CSSH', 'Male', '2020-08-22');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('90201', 'Senior', 'CE', 'Non-binary', '2022-11-17');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('90438', 'Junior', 'SON', 'Male', '1974-11-04');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('90859', 'Masters', 'SOM', 'Non-binary', '2001-01-01');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('91658', 'Freshman', 'LAW', 'Non-binary', '1987-10-20');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('91816', 'Freshman', 'CSSH', 'Female', '1974-02-20');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('92614', 'Masters', 'CSSH', 'Male', '1972-01-09');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('93857', 'Masters', 'SON', 'Non-binary', '1985-05-24');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('94844', 'Freshman', 'SON', 'Female', '1983-06-05');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('94875', 'Senior', 'LAW', 'Male', '1970-03-12');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('95067', 'Freshman', 'CSSH', 'Male', '1973-02-16');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('96470', 'PhD', 'CS', 'Non-binary', '1977-12-29');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('96836', 'Masters', 'CS', 'Non-binary', '2012-03-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('96852', 'Freshman', 'CS', 'Non-binary', '2002-01-29');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('97507', 'Freshman', 'CE', 'Non-binary', '2022-08-15');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('98121', 'Masters', 'CSSH', 'Non-binary', '1983-01-23');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('99013', 'PhD', 'CS', 'Non-binary', '2016-05-22');
INSERT INTO `REGULAR_USERS` (`ku_id`, `academic_level`, `faculty`, `gender`, `birthdate`) VALUES ('71461', 'Junior', 'CE', 'Male', '2000-12-20');



CREATE TABLE CLASSES
        (building           VARCHAR(5)      NOT NULL,
         floor              VARCHAR(5)      NOT NULL,
         class_no           VARCHAR(10)     NOT NULL,
         capacity           INT,
         no_boards          INT,
         no_projectors      INT,
         allow_individual   BOOLEAN,
         has_window         BOOLEAN,
         has_Cam            BOOLEAN,
         has_docCam         BOOLEAN,
         has_outlets        BOOLEAN,
         has_lectureCap     BOOLEAN,
         has_touchScreen    BOOLEAN,
         image_url          VARCHAR(100),
        PRIMARY KEY (building, floor, class_no))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO CLASSES VALUES ('SCI', 'Z', '42', 48, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '43', 34, 0, 1, 0, 1, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '242', 50, 0, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '149', 105, 0, 3, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '220', 35, 0, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '50', 30, 0, 1, 0, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', '1', '28', 39, 4, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'Z', '21', 38, 2, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '19', 32, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '08', 21, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'Z', '15', 58, 4, 1, 0, 1, 1, 1, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '72', 28, 4, 1, 0, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '53', 45, 6, 1, 0, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '52', 24, 4, 1, 1, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '11', 54, 4, 1, 0, 0, 1, 1, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '19', 30, 4, 1, 0, 1, 1, 0, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'Z', '50', 22, 0, 3, 1, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '08', 107, 4, 2, 0, 0, 1, 1, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '30', 80, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'Z', '27', 40, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'Z', '21', 39, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'Z', '15', 12, 0, 1, 1, 1, 0, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'Z', '14', 25, 1, 1, 1, 1, 0, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '35', 28, 1, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '30', 21, 4, 1, 1, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '29', 21, 4, 1, 1, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '28', 21, 4, 1, 1, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '21', 107, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '16', 54, 0, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '10', 107, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '07', 107, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', '1', '45', 23, 4, 1, 1, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', '1', '44', 23, 4, 1, 1, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', '1', '04', 40, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', '1', '03', 40, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '84', 42, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B1', '73', 47, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '52', 104, 2, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '51', 45, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '42', 67, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '22', 154, 0, 2, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '21', 154, 0, 2, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '11', 22, 4, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'A', '44', 40, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '61', 24, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '59', 65, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '58', 70, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '57', 50, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '56', 50, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '22', 18, 4, 1, 1, 1, 1, 0, 1, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '04', 50, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', '1', '03', 50, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '32', 25, 4, 1, 1, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '29', 24, 2, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '24', 92, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '09', 21, 2, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '08', 21, 2, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '07', 33, 4, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', 'Z', '06', 21, 1, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', '1', '29', 44, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', '1', '26', 23, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', '1', '25', 22, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SCI', '1', '03', 48, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'Z', '21A', 50, 2, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '42', 42, 2, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '32', 41, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '29', 80, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '21', 35, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '20B', 24, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '20A', 25, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '18', 36, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '16', 36, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '15', 35, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '11', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '06', 18, 2, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', 'B', '05', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ENG', '1', '20', 20, 0, 1, 1, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '15', 27, 0, 1, 0, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '13', 27, 0, 1, 0, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '12', 28, 0, 1, 0, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '10', 40, 0, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '09', 28, 0, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '07', 25, 0, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '06', 24, 0, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '04', 21, 0, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', 'B', '03', 21, 0, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('ELC', '1', '15', 60, 0, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '48', 79, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '33', 34, 4, 1, 0, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '27', 55, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '26', 35, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '25', 36, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '24', 58, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '16C', 23, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '16B', 23, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '16A', 23, 4, 1, 1, 1, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'Z', '08', 53, 4, 1, 0, 0, 1, 1, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '41', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '40', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '39', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '38', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '35', 24, 4, 1, 1, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '34', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '33', 34, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '31', 34, 4, 1, 0, 0, 1, 0, 1, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '30B', 17, 2, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '30A', 20, 2, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '26', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '24', 64, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '15', 16, 2, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '13', 34, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', 'B', '12', 22, 2, 1, 1, 0, 1, 0, 0, 0, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', '2', '16', 39, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', '1', '36', 26, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', '1', '34', 34, 4, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', '1', '33', 33, 2, 1, 0, 1, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('CASE', '1', '24', 40, 4, 1, 0, 0, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');


CREATE TABLE CONNECTIONS
        (building           VARCHAR(5)      NOT NULL,
         floor              VARCHAR(5)      NOT NULL,
         class_no           VARCHAR(10)     NOT NULL,
         connection_type    VARCHAR(20)     NOT NULL,
         PRIMARY KEY (building, floor, class_no, connection_type),
         FOREIGN KEY (building, floor, class_no) REFERENCES CLASSES(building, floor, class_no))
         ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO CONNECTIONS VALUES ('ENG', '1', '28', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'Z', '21', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '19', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '19', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'Z', '15', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'Z', '15', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '72', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '72', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '53', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '53', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '52', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '52', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '11', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '11', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '19', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '19', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '08', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '08', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '30', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '30', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '27', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '27', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '21', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '21', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '15', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '15', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '14', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'Z', '14', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '35', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '30', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '29', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '28', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '21', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '21', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '16', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '16', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '10', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '10', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '07', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '07', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '45', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '44', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '04', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '04', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '03', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', '1', '03', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '84', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '84', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '73', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B1', '73', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '52', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '52', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '42', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '42', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '21', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '21', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '11', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '11', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '44', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'A', '44', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '61', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '61', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '59', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '59', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '58', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '58', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '22', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', '1', '22', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '32', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '29', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '29', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '24', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '24', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '09', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '08', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '07', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '07', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SCI', 'Z', '06', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '29', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '29', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '26', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '25', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '03', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SCI', '1', '03', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'Z', '21A', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '42', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '42', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '32', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '29', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '29', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '21', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '20B', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '20A', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '18', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '16', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '16', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '15', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '11', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '06', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', 'B', '05', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', '1', '20', 'Vga');
INSERT INTO CONNECTIONS VALUES ('ENG', '1', '20', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '48', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '48', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '48', 'Mini Display Port');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '33', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '33', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '27', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '27', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '26', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '26', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '25', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '25', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '24', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '24', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16C', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16C', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16B', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16B', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16A', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '16A', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '08', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'Z', '08', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '41', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '41', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '41', 'Mini Display Port');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '40', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '40', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '40', 'Mini Display Port');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '39', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '39', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '38', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '38', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '35', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '35', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '34', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '34', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '33', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '33', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '31', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '31', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '30B', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '30A', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '26', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '26', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '24', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '24', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '15', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '13', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '13', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '12', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', 'B', '12', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', '2', '16', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', '2', '16', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '36', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '36', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '34', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '34', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '33', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '33', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '24', 'Vga');
INSERT INTO CONNECTIONS VALUES ('CASE', '1', '24', 'HDMI');



CREATE TABLE RESERVATIONS
        (ku_id              CHAR(5)         NOT NULL,
         building           VARCHAR(5)      NOT NULL,
         floor              VARCHAR(5)      NOT NULL,
         class_no           VARCHAR(10)     NOT NULL,
         res_time           DATETIME        NOT NULL,
         res_status         VARCHAR(20)     NOT NULL,
         study_type         VARCHAR(20),
        CONSTRAINT res_status_chk CHECK (res_status IN ('RESERVED', 'FINISHED')),
        CONSTRAINT study_type_chk CHECK (study_type IN ('Group', 'Individual')),
        PRIMARY KEY (ku_id, building, floor, class_no, res_time),
        FOREIGN KEY (ku_id) REFERENCES REGULAR_USERS(ku_id),
        FOREIGN KEY (building, floor, class_no) REFERENCES CLASSES(building, floor, class_no))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE EVENT IF NOT EXISTS reservation_status_update
        ON SCHEDULE EVERY 1 MINUTE
		STARTS CONCAT(CURRENT_DATE, ' 00:00:00')
		ENDS CONCAT(CURRENT_DATE, ' 23:59:59')
        DO
		UPDATE RESERVATIONS
		SET res_status = 'FINISHED'
		WHERE res_time < CURRENT_TIMESTAMP AND res_status = 'RESERVED';



CREATE TABLE JOINS
        (ku_id              CHAR(5)         NOT NULL,
         building           VARCHAR(5)      NOT NULL,
         floor              VARCHAR(5)      NOT NULL,
         class_no           VARCHAR(10)     NOT NULL,
         join_time          DATETIME        NOT NULL,
         join_status        VARCHAR(20)     NOT NULL,
        CONSTRAINT join_status_chk CHECK (join_status IN ('JOINED', 'FINISHED')),
        PRIMARY KEY (ku_id, building, floor, class_no, join_time),
        FOREIGN KEY (ku_id) REFERENCES REGULAR_USERS(ku_id),
        FOREIGN KEY (building, floor, class_no) REFERENCES CLASSES(building, floor, class_no))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DELIMITER //
CREATE TRIGGER join_status_update
        AFTER UPDATE ON RESERVATIONS
        FOR EACH ROW
                BEGIN
                        IF NEW.res_status = 'FINISHED' THEN
                                UPDATE JOINS
                                SET join_status = 'FINISHED'
                                WHERE building = NEW.building AND floor = NEW.floor AND class_no = NEW.class_no AND join_time = NEW.res_time AND join_status = 'JOINED';
                            END IF;
                END //
DELIMITER ;
