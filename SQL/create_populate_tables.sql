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


INSERT INTO USERS VALUES ('71461', 'Bora', 'Aktas', 'baktas19@ku.edu.tr', 'b1o2r3a8GS?');
INSERT INTO USERS VALUES ('12345', 'admin', 'admin', 'admin@ku.edu.tr', 'admin');
INSERT INTO USERS VALUES ('11111', 'John', 'Doe', 'johndoe@example.com', 'password123');
INSERT INTO USERS VALUES ('54321', 'Admin', 'Smith', 'adminsmith@example.com', 'adminpassword');
INSERT INTO USERS VALUES ('98765', 'Jane', 'Doe', 'janedoe@example.com', '123456789');
INSERT INTO USERS VALUES ('67890', 'Alice', 'Johnson', 'alicejohnson@example.com', 'alicepass');
INSERT INTO USERS VALUES ('13579', 'Bob', 'Williams', 'bobwilliams@example.com', 'bobby123');
INSERT INTO USERS VALUES ('24680', 'Admin', 'Brown', 'adminbrown@example.com', 'passwordadmin');
INSERT INTO USERS VALUES ('86420', 'Emily', 'Davis', 'emilydavis@example.com', 'emily1234');
INSERT INTO USERS VALUES ('97531', 'Michael', 'Miller', 'michaelmiller@example.com', 'mikepass');
INSERT INTO USERS VALUES ('35791', 'Sarah', 'Anderson', 'sarahanderson@example.com', 'password456');
INSERT INTO USERS VALUES ('01928', 'Admin', 'Taylor', 'admintaylor@example.com', 'admin1234');


CREATE TABLE ADMINS
        (ku_id              CHAR(5)         NOT NULL,
        PRIMARY KEY (ku_id),
        FOREIGN KEY (ku_id) REFERENCES USERS(ku_id))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO ADMINS VALUES ('12345');
INSERT INTO ADMINS VALUES ('54321');
INSERT INTO ADMINS VALUES ('24680');
INSERT INTO ADMINS VALUES ('01928');


CREATE TABLE REGULAR_USERS
        (ku_id              CHAR(5)             NOT NULL,
         academic_level     VARCHAR(20),
         faculty            VARCHAR(10),
         gender             VARCHAR(20)         NOT NULL,   
         birthdate          DATE                NOT NULL,   
        CONSTRAINT academic_level_chk CHECK (academic_level IN ('Freshman', 'Sophomore', 'Junior', 'Senior', 'PhD', 'Masters')),
        CONSTRAINT faculty CHECK (faculty IN ('CASE', 'CS', 'CSSH', 'CE', 'SOM', 'SON', 'LAW')),
        CONSTRAINT gender_chk CHECK (gender IN ('Male', 'Female', 'LGBT+')), 
        PRIMARY KEY (ku_id),
        FOREIGN KEY (ku_id) REFERENCES USERS(ku_id))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO REGULAR_USERS VALUES ('71461', 'Junior', 'CE', 'Male', '2000-12-20');
INSERT INTO REGULAR_USERS VALUES ('11111', 'Freshman', 'CASE', 'Male', '2002-03-15');
INSERT INTO REGULAR_USERS VALUES ('98765', 'Sophomore', 'CS', 'Female', '2001-06-28');
INSERT INTO REGULAR_USERS VALUES ('67890', 'Junior', 'CSSH', 'Male', '2000-09-10');
INSERT INTO REGULAR_USERS VALUES ('13579', 'PhD', 'LAW', 'Male', '2000-09-10');
INSERT INTO REGULAR_USERS VALUES ('86420', 'Masters', 'SON', 'Female', '2001-07-11');
INSERT INTO REGULAR_USERS VALUES ('97531', 'Senior', 'LAW', 'Female', '2003-07-11');
INSERT INTO REGULAR_USERS VALUES ('35791', 'Sophomore', 'SOM', 'Male', '2001-12-22');


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
INSERT INTO CLASSES VALUES ('SNA', 'B', '172', 28, 4, 1, 0, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '153', 45, 6, 1, 0, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '152', 24, 4, 1, 1, 0, 1, 0, 1, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SOS', 'B', '11', 54, 4, 1, 0, 0, 1, 1, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '119', 30, 4, 1, 0, 1, 1, 0, 0, 1, 1, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
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
INSERT INTO CLASSES VALUES ('SNA', 'B', '184', 42, 4, 1, 0, 0, 1, 0, 0, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
INSERT INTO CLASSES VALUES ('SNA', 'B', '173', 47, 4, 1, 0, 1, 1, 0, 1, 1, 0, 'https://vegfest.istanbul/wp-content/uploads/2022/09/ege-ugur-amasya.jpg');
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
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '172', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '172', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '153', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '153', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '152', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '152', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '11', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SOS', 'B', '11', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '119', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '119', 'HDMI');
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
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '184', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '184', 'HDMI');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '173', 'Vga');
INSERT INTO CONNECTIONS VALUES ('SNA', 'B', '173', 'HDMI');
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


INSERT INTO RESERVATIONS VALUES ('71461', 'SNA', 'A', '43', '2023-05-27 09:00:00', 'RESERVED', 'Group');
INSERT INTO RESERVATIONS VALUES ('11111', 'SCI', 'Z', '42', '2023-05-27 10:00:00', 'RESERVED', 'Group');
INSERT INTO RESERVATIONS VALUES ('11111', 'SCI', 'Z', '42', '2023-05-27 11:00:00', 'RESERVED', 'Group');
INSERT INTO RESERVATIONS VALUES ('67890', 'ELC', 'B', '08', '2023-05-27 10:00:00', 'RESERVED', 'Individual');
INSERT INTO RESERVATIONS VALUES ('67890', 'ELC', 'B', '08', '2023-05-27 19:00:00', 'RESERVED', 'Individual');


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



INSERT INTO JOINS VALUES ('98765', 'SNA', 'A', '43', '2023-05-27 09:00:00', 'JOINED');
INSERT INTO JOINS VALUES ('35791', 'SCI', 'Z', '42', '2023-05-27 11:00:00', 'JOINED');


