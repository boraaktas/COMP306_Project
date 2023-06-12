<?php
    session_start();
    include "config.php";
    include "header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    $ku_id = $_SESSION['ku_id'];

    $sql .= "SELECT r.ku_id, 'Reservation' AS type, r.building, r.floor, r.class_no,
                    r.study_type as study_type, r.res_status as status, r.res_time AS date_time
                FROM reservations as r
                WHERE r.ku_id = '$ku_id'
                UNION ALL
                SELECT j.ku_id, 'Join' AS type, j.building, j.floor, j.class_no,
                    'Group' as study_type, j.join_status as status, j.join_time AS date_time
                FROM joins as j
                WHERE j.ku_id = '$ku_id'
                ORDER BY date_time DESC;";

    $result = mysqli_query($db, $sql);

    $ku_ids = array(); 
    $types = array();
    $buildings = array();
    $floors = array();
    $class_nos = array();
    $study_types = array();
    $statuses = array();
    $date_times = array();


    while ($row = mysqli_fetch_array($result)) {
        $ku_ids[] = $row['ku_id'];
        $types[] = $row['type'];
        $buildings[] = $row['building'];
        $floors[] = $row['floor'];
        $class_nos[] = $row['class_no'];
        $study_types[] = $row['study_type'];
        $statuses[] = $row['status'] == "JOINED" || $row['status'] == "RESERVED" ? "Ongoing" : "Finished";
        $date_times[] = $row['date_time'];
    }


?>



<script>

    function cancelReservation(ku_id, building, floor, class_no, date_time) {
        var r = confirm("Are you sure you want to cancel this reservation? If you cancel, all of the joins to this reservation will be cancelled as well.");
        if (r == true) {
            window.location.href = "bookings_cancel_reservation.php?ku_id=" + ku_id + "&building=" + building + "&floor=" + floor + "&class_no=" + class_no + "&date_time=" + date_time;
        }
    }

    function cancelJoin(ku_id, building, floor, class_no, date_time) {
        var r = confirm("Are you sure you want to cancel this join?");
        if (r == true) {
            window.location.href = "bookings_cancel_join.php?ku_id=" + ku_id + "&building=" + building + "&floor=" + floor + "&class_no=" + class_no  + "&date_time=" + date_time;
        }
    }
    
</script>



<div class="table-container">
    <table>
        <div class="table-header">
            <th>KU ID</th>
            <th>Type</th>
            <th>Class</th>
            <th>Study Type</th>
            <th>Status</th>
            <th>Date & Time</th>
            <th>Cancel Button</th>
        </div>
        <div class="table-body">
            <?php
                for ($i = 0; $i < count($ku_ids); $i++) {
                    echo "<tr>";
                    echo "<td>" . $ku_ids[$i] . "</td>";
                    echo "<td>" . $types[$i] . "</td>";
                    echo "<td>" . $buildings[$i] . " " . $floors[$i] . "" . $class_nos[$i] . "</td>";
                    echo "<td>" . $study_types[$i] . "</td>";
                    echo "<td>" . $statuses[$i] . "</td>";
                    echo "<td>" . $date_times[$i] . "</td>";
                    if ($statuses[$i] == "Ongoing") {
                        if ($types[$i] == "Reservation") {
                            echo "<td><button class='button' onclick='cancelReservation(\"" . $ku_ids[$i] . "\", \"" . $buildings[$i] . "\", \"" . $floors[$i] . "\", \"" . $class_nos[$i] . "\", \"" . $date_times[$i] . "\")'>Cancel Reservation</button></td>";
                        } else {
                            echo "<td><button class='button' onclick='cancelJoin(\"" . $ku_ids[$i] . "\", \"" . $buildings[$i] . "\", \"" . $floors[$i] . "\", \"" . $class_nos[$i] . "\", \"" . $date_times[$i] . "\")'>Cancel Join</button></td>";
                        }
                    } else {
                        echo "<td><button class='button' disabled>Finished</button></td>";
                    }
                    echo "</tr>";
                }
            ?>
        </div>
    </table>
</div>


<style>
    .button:disabled {
        background-color: gray;
        color: black;
        border: 2px solid #d9d9d9;
        cursor: not-allowed;
    }

    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 90%;
        margin: 0 auto;
    }

    .table-container table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px;
        
    }


    .table-container th {
        text-align: center;
        padding: 8px;
        background-color: #009c05;
        color: white;
    }

    .table-container td {
        text-align: center;
        padding: 8px;
        background-color: #d9d9d9;
        border-bottom: 1px solid #009c05;
    }

    .table-container tr:hover {
        background-color: wheat;
    }

    .table-body {
        height: 200px;
        overflow-y: scroll;
    }

    td.button {
        -webkit-appearance: button;
        -moz-appearance: button;
        appearance: button;
        text-decoration: none;
        color: initial;
        background-color: #009c05;

    }

</style>
