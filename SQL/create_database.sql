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
         firstname	        VARCHAR(20)		NOT NULL,
         lastname           VARCHAR(20)         NOT NULL,
         mail	            VARCHAR(50)		NOT NULL,
         password	        VARCHAR(20)		NOT NULL,    
        PRIMARY KEY (ku_id),
        UNIQUE (mail))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE ADMINS
        (ku_id              CHAR(5)         NOT NULL,
        PRIMARY KEY (ku_id),
        FOREIGN KEY (ku_id) REFERENCES USERS(ku_id))
        ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



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



CREATE TABLE CONNECTIONS
        (building           VARCHAR(5)      NOT NULL,
         floor              VARCHAR(5)      NOT NULL,
         class_no           VARCHAR(10)     NOT NULL,
         connection_type    VARCHAR(20)     NOT NULL,
         PRIMARY KEY (building, floor, class_no, connection_type),
         FOREIGN KEY (building, floor, class_no) REFERENCES CLASSES(building, floor, class_no))
         ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



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



-- To keep track of which bookings are finished,
-- we schedule an event to run every 1 hour to update the status of the reservations and joins
CREATE EVENT IF NOT EXISTS reservation_status_update
        ON SCHEDULE EVERY 1 MINUTE
		STARTS CONCAT(CURRENT_DATE, ' 00:00:00')
		ENDS CONCAT(CURRENT_DATE, ' 23:59:59')
        DO
		UPDATE RESERVATIONS
		SET res_status = 'FINISHED'
		WHERE res_time < CURRENT_TIMESTAMP AND res_status = 'RESERVED';



-- When a reservation is finished all the joins for that reservation are also finished
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


-- When a reservation is deleted all the joins for that reservation are also deleted
DELIMITER //
CREATE TRIGGER join_status_delete
        AFTER DELETE ON RESERVATIONS
        FOR EACH ROW
                BEGIN
                        DELETE FROM JOINS
                        WHERE building = OLD.building AND floor = OLD.floor AND class_no = OLD.class_no AND join_time = OLD.res_time;
                END //
DELIMITER ;


