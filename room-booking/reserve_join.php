<?php

    include "config.php";
    include 'reservation.php';

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    // check url parameters
    
    if (isset($_GET["building"]) && isset($_GET["floor"]) && isset($_GET["class_no"]) && isset($_GET["date"]) && isset($_GET["hour"])) {
        $building = $_GET["building"];
        $floor = $_GET["floor"];
        $class_no = $_GET["class_no"];
        $date = $_GET["date"];
        
        $hour = $_GET["hour"];
        $formattedHour = sprintf("%02d:00", $hour);

        $ku_id = $_SESSION['ku_id'];
        $studyType = 'Join';
        $res_time = $date ." ". $formattedHour;
        
        // Build the SQL query
        $sql = "INSERT INTO joins (ku_id, building, floor, class_no, join_time, join_status)  values ('$ku_id', '$building' , '$floor' , '$class_no', '$res_time', 'JOINED')";

        $result = mysqli_query($db, $sql);
        
        if ($result) {
            echo "<h2>Joined Successfully</h2>";
            echo "<table border='1' style='border-collapse: collapse;'>
            <tr>
                <th style='background-color: #009c05; color: white;'>Building</th>
                <th style='background-color: #009c05; color: white;'>Floor</th>
                <th style='background-color: #009c05; color: white;'>Class No</th>
                <th style='background-color: #009c05; color: white;'>Reservation Time</th>
            </tr>";
            echo "<tr>";
            echo "<td style='background-color: #d9d9d9;'>" . $building . "</td>";
            echo "<td style='background-color: #d9d9d9;'>" . $floor . "</td>";
            echo "<td style='background-color: #d9d9d9;'>" . $class_no . "</td>";
            echo "<td style='background-color: #d9d9d9;'>" . $res_time . "</td>";
            echo "</tr>";
            echo "</table>";
            echo "<br>";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($db);
        } 

    }

?>