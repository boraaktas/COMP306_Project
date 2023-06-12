<?php
    include "config.php";
    include "bookings_ViewFilter.php";
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    }
    

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
        $selectedKUID = $_GET["ku_id"];
    }

    
    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $selectedType = $_POST["booking_type"];
        $selectedStatus = $_POST["booking_status"];
        $selectedStartDate = $_POST["start_time"];
        $selectedEndDate = $_POST["end_time"];

    } else {
        header('Location: bookings_ViewFilter.php');
        exit(); 
    }



    $sql = "";

    if ($selectedType == "all") {
        $sql .= "SELECT r.ku_id,  r.res_time AS date_time, r.res_status as status
                    FROM reservations as r
                    WHERE 1=1";
        if ($selectedStatus != "all") { 
            if ($selectedStatus == "Future") {
                $sql .= " AND r.res_status = 'RESERVED'"; 
            } else {
                    $sql .= " AND r.res_status = 'FINISHED'"; 
            } 
        }
        if ($selectedStartDate != "") { $sql .= " AND r.res_time >= '$selectedStartDate'"; }
        if ($selectedEndDate != "") { $sql .= " AND r.res_time <= '$selectedEndDate'"; }

        $sql .= " UNION ALL ";

        $sql .= "SELECT j.ku_id, j.join_status as status, j.join_time AS date_time
                    FROM joins as j
                    WHERE 1=1";

        if ($selectedKUID != "") { $sql .= " AND j.ku_id = '$selectedKUID'"; }
        if ($selectedStatus != "all") { 
            if ($selectedStatus == "Future") {
                $sql .= " AND j.join_status = 'JOINED'";
            } else {
                    $sql .= " AND j.join_status = 'FINISHED'";
            } 
        }
        if ($selectedStartDate != "") { $sql .= " AND j.join_time >= '$selectedStartDate'"; }
        if ($selectedEndDate != "") { $sql .= " AND j.join_time <= '$selectedEndDate'"; }
    
    } else if ($selectedType == "reservations") {

        $sql .= "SELECT r.ku_id,  r.res_status as status, r.res_time AS date_time
                    FROM reservation as r
                    WHERE 1=1";

        if ($selectedKUID != "") { $sql .= " AND r.ku_id = '$selectedKUID'"; }
        if ($selectedStatus != "all") { 
            if ($selectedStatus == "Future") {
                $sql .= " AND r.res_status = 'RESERVED'"; 
            } else {
                    $sql .= " AND r.res_status = 'FINISHED'"; 
            } 
        }
        if ($selectedStartDate != "") { $sql .= " AND r.res_time >= '$selectedStartDate'"; }
        if ($selectedEndDate != "") { $sql .= " AND r.res_time <= '$selectedEndDate'"; }

    } else if ($selectedType == "join") {

        $sql .= "SELECT j.ku_id, j.join_status as status, j.join_time AS date_time
                    FROM joins as j
                    WHERE 1=1";
   
        if ($selectedKUID != "") { $sql .= " AND j.ku_id = '$selectedKUID'"; }
        if ($selectedStatus != "all") { 
            if ($selectedStatus == "Future") {
                $sql .= " AND j.join_status = 'JOINED'";
            } else {
                    $sql .= " AND j.join_status = 'FINISHED'";
            } 
        }
        if ($selectedStartDate != "") { $sql .= " AND j.join_time >= '$selectedStartDate'"; }
        if ($selectedEndDate != "") { $sql .= " AND j.join_time <= '$selectedEndDate'"; }

    }

    $sql .= " ORDER BY date_time DESC;";


    $result = mysqli_query($db, $sql);


    $ku_ids = array();
    $types = array();
    $statuses = array();
    $date_times = array();


    while ($row = mysqli_fetch_array($result)) {
        array_push($ku_ids, $row['ku_id']);
        array_push($types, $row['booking_type']);
        array_push($statuses, $row['status']);
        array_push($date_times, $row['date_time']);
    }

?>


<script>

    // function cancelReservationUser(ku_id, study_type, date_time) {
    //     var r = confirm("Are you sure you want to cancel this reservation? If you cancel, all of the joins to this reservation will be cancelled as well.");
    //     if (r == true) {
    //         window.location.href = "admin_cancel_reservation.php?ku_id=" + ku_id  + "&date_time=" + date_time;
    //     }
    // }

    // function cancelJoinUser(ku_id, study_type, date_time) {
    //     var r = confirm("Are you sure you want to cancel this join?");
    //     if (r == true) {
    //         window.location.href = "admin_cancel_join.php?ku_id=" +  "&date_time=" + date_time;
    //     }
    // }
    
</script>


<div class="table-container">
    <table>
        <div class="table-header">
            <th>KU ID</th>
            <th>Type</th>
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
                    echo "<td>" . $statuses[$i] . "</td>";
                    echo "<td>" . $date_times[$i] . "</td>";
                    if ($statuses[$i] == "RESERVED") {
                        echo "<td><button class='button' onclick='cancelReservation(\"" . $ku_ids[$i] . "\", \"" . $types[$i] . "\", \"" . $date_times[$i] . "\")'>Cancel Reservation</button></td>";
                    } else if ($statuses[$i] == "JOINED") {
                        echo "<td><button class='button' onclick='cancelJoin(\"" . $ku_ids[$i] . "\", \"" . $types[$i] . "\", \"" . $date_times[$i] . "\")'>Cancel Join</button></td>";
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