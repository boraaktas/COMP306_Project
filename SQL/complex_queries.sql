-- (1) Explanations for Class Search Query:
-- 1. $currentdate_time is a variable that stores the current date and time.
-- 2. The query below is used to get the list of classes that is the initial user wants to see by adding filters.
-- 3. If there is filter specified, this specification will be added to the query after where statement as follows:
--    3.1.  "AND classes.building = '$building'".
--    3.2.  "AND classes.floor = '$floor'".
--    3.3.  "AND classes.class_no = '$class_no'".
--    3.4.  "AND classes.capacity >= '$capacity'".
--    ...
SELECT DISTINCT classes.building, classes.floor, classes.class_no, classes.image_url,
                (classes.capacity - IFNULL(reserved.total_reservations, 0) - IFNULL(joined.total_joins, 0)) AS remaining_capacity,
                IFNULL(reserved.total_reservations, 0) +  IFNULL(joined.total_joins, 0) AS total_occupancy,
                classes.capacity,
                IFNULL(reserved.study_type, 'Not Reserved') AS reserved_study_type
FROM classes LEFT JOIN connections
                ON classes.building = connections.building AND classes.floor = connections.floor AND classes.class_no = connections.class_no
             LEFT JOIN (
                    SELECT building, floor, class_no, COUNT(*) AS total_reservations, study_type
                    FROM reservations
                    WHERE res_time = '$currentdate_time' AND res_status = 'RESERVED'
                    GROUP BY building, floor, class_no, study_type
             ) reserved ON classes.building = reserved.building AND classes.floor = reserved.floor AND classes.class_no = reserved.class_no
             LEFT JOIN (
                    SELECT building, floor, class_no, COUNT(*) AS total_joins
                    FROM joins
                    WHERE join_time = '$currentdate_time' AND join_status = 'JOINED'
                    GROUP BY building, floor, class_no
             ) joined ON classes.building = joined.building AND classes.floor = joined.floor AND classes.class_no = joined.class_no
WHERE 1 = 1;




-- (2) Explanations for Data Visualization Query - 1 (for the time series plot)
-- 1. $start_date and $end_date are variables that stores the start date and end date of the time series plot.
-- 2. The query calculates total number of reservations and joins for each date within the range provided using the variables mentioned above.
WITH RECURSIVE date_range AS (
    SELECT '$start_date' AS date
    UNION ALL
    SELECT DATE_ADD(date, INTERVAL 1 DAY) AS date
    FROM date_range
    WHERE DATE_ADD(date, INTERVAL 1 DAY) <= '$end_date')

SELECT d.date, IFNULL(r.total_reservations, 0) AS total_reservations,
       IFNULL(j.total_joins, 0) AS total_joins, IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0) AS total
FROM date_range d
    LEFT JOIN (
        SELECT DATE(res_time) AS date, COUNT(*) AS total_reservations
        FROM RESERVATIONS
        WHERE res_time BETWEEN '$start_date' AND '$end_date' AND res_status = 'FINISHED'
        GROUP BY DATE(res_time)
    ) r ON d.date = r.date
    LEFT JOIN (
            SELECT DATE(join_time) AS date, COUNT(*) AS total_joins
            FROM JOINS
            WHERE join_time BETWEEN '$start_date' AND '$end_date' AND join_status = 'FINISHED'
            GROUP BY DATE(join_time)
        ) j ON d.date = j.date
    ORDER BY d.date;



-- (3) Explanations for Data Visualization Query - 2 (for the pie chart)
-- 1. $start_date and $end_date are variables that stores the start date and end date of the pie chart.
-- 2. it retrives the total usage of specified building and calculates the overall percentage of the building relative to other buildings 
SELECT c.building,
        (IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) AS total_usages,
        (SUM(IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) OVER ()) AS total_sum,
        ((IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) / (SUM(IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) OVER ())) * 100 AS usage_percentage
FROM
    CLASSES c
    LEFT JOIN (
        SELECT building, COUNT(*) AS total_reservations
        FROM RESERVATIONS
        WHERE res_time BETWEEN '$start_date' AND '$end_date' AND res_status = 'FINISHED'
        GROUP BY building
    ) r ON c.building = r.building
    LEFT JOIN (
        SELECT building, COUNT(*) AS total_joins
        FROM JOINS
        WHERE join_time BETWEEN '$start_date' AND '$end_date' AND join_status = 'FINISHED'
        GROUP BY building
    ) j ON c.building = j.building
GROUP BY c.building;




-- (4) Explanations for Data Visualization Query - 3 (for the top 10 user table)
-- 1. $start_date and $end_date are variables that stores the start date and end date of the top 10 user table.
-- 2. this query retrives the top 10 users in our database, it collects all users with a non-zero booking and then selects the top 10 only

SELECT ru.ku_id, u.firstname, u.lastname, ru.faculty, ru.academic_level,
        YEAR(CURDATE()) - YEAR(ru.birthdate) AS age, 
        IFNULL(r.total_reservations, 0) AS total_reservations,
        IFNULL(j.total_joins, 0) AS total_joins,
        IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0) AS total_usages
FROM REGULAR_USERS ru INNER JOIN USERS u ON ru.ku_id = u.ku_id
LEFT JOIN (
    SELECT ku_id, COUNT(*) AS total_reservations
    FROM RESERVATIONS
    WHERE res_status = 'FINISHED' AND res_time BETWEEN '$start_date' AND '$end_date'
    GROUP BY ku_id
) r ON ru.ku_id = r.ku_id
LEFT JOIN (
    SELECT ku_id, COUNT(*) AS total_joins
    FROM JOINS
    WHERE join_status = 'FINISHED' AND join_time BETWEEN '$start_date' AND '$end_date'
    GROUP BY ku_id
) j ON ru.ku_id = j.ku_id
WHERE (IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) > 0
ORDER BY total_usages DESC
LIMIT 10;

