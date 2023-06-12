<?php

    session_start();
    include "config.php";
    include "admin_header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    if (isset($_GET['start_date']) && isset($_GET['end_date'])) {
        $start_date = $_GET['start_date'];
        $end_date = $_GET['end_date'];
    } else {
        header('Location: admin_range.php');
    }


    $sql = "SELECT ru.ku_id, u.firstname, u.lastname, ru.faculty, ru.academic_level,
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
            LIMIT 10;";

    
    $result = mysqli_query($db, $sql);

    $ku_ids = array();
    $firstnames = array();
    $lastnames = array();
    $faculties = array();
    $academic_levels = array();
    $ages = array();
    $total_reservations = array();
    $total_joins = array();
    $total_usages = array();

    while ($row = mysqli_fetch_array($result)) {
        $ku_ids[] = $row['ku_id'];
        $firstnames[] = $row['firstname'];
        $lastnames[] = $row['lastname'];
        $faculties[] = $row['faculty'];
        $academic_levels[] = $row['academic_level'];
        $ages[] = $row['age'];
        $total_reservations[] = $row['total_reservations'];
        $total_joins[] = $row['total_joins'];
        $total_usages[] = $row['total_usages'];
    }

    $data = array();

    for ($i = 0; $i < count($ku_ids); $i++) {
        $data[] = array(
            "ku_id" => $ku_ids[$i],
            "firstname" => $firstnames[$i],
            "lastname" => $lastnames[$i],
            "faculty" => $faculties[$i],
            "academic_level" => $academic_levels[$i],
            "age" => $ages[$i],
            "total_reservations" => $total_reservations[$i],
            "total_joins" => $total_joins[$i],
            "total_usages" => $total_usages[$i]
        );
    }

    // show the table of the top 10 users with the most usages

?>



<!DOCTYPE html>
<html>
    <body>

        <div class="top_users-container">
            <table class="top_users-table">

                <div class="top_users-title">
                    <tr>
                        <th colspan="9">Top 10 Users with the Most usages</th>
                        
                    </tr>
                    <tr>
                        <th colspan="9">from <?php echo $start_date; ?> to <?php echo $end_date; ?></th>
                    </tr>
                </div>

                <div class="top_users-header">
                    <tr>
                        <th>KU ID</th>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Faculty</th>
                        <th>Academic Level</th>
                        <th>Age</th>
                        <th>No. Reservations</th>
                        <th>No. Joins</th>
                        <th>Total</th>
                    </tr>
                </div>

                <div class="top_users-body">
                    </tr>
                        <?php
                            foreach ($data as $row) {
                                echo "<tr>";
                                echo "<td>" . $row['ku_id'] . "</td>";
                                echo "<td>" . $row['firstname'] . "</td>";
                                echo "<td>" . $row['lastname'] . "</td>";
                                echo "<td>" . $row['faculty'] . "</td>";
                                echo "<td>" . $row['academic_level'] . "</td>";
                                echo "<td>" . $row['age'] . "</td>";
                                echo "<td>" . $row['total_reservations'] . "</td>";
                                echo "<td>" . $row['total_joins'] . "</td>";
                                echo "<td>" . $row['total_usages'] . "</td>";
                                echo "</tr>";
                            }
                        ?>
                    </tr>
                </div>
            </table>
        </div>

        <div class="buttons">
            <div class="prev_analysis">
                <button onclick="window.location.href='admin_secondChart.php?start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>'">Previous Analysis</button>
            </div>
        </div>
    
    </body>
</html>


<style>

    .top_users-container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 90%;
        margin: 0 auto;
    }


    .top_users-table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px;
        
    }

    
    .top_users-container th {
        text-align: center;
        padding: 8px;
        background-color: #009c05;
        color: white;
    }

    .top_users-container td {
        text-align: center;
        padding: 8px;
        background-color: #d9d9d9;
        border-bottom: 1px solid #009c05;
    }

    .top_users-container tr:hover {
        background-color: wheat;
    }

    .top_users-body {
        height: 200px;
        overflow-y: scroll;
    }


    .prev_analysis {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .prev_analysis button {
        margin: 0 auto;
        background-color: #f44336;
        color: white;
        padding: 10px;
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .buttons {
        background-color: opaque;
        margin: 0 auto;
        width: 70%;
        padding: 10px;
        display: flex;
    }

</style>














