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
        $studyType = 'Individual';
        $res_time = $date ." ". $formattedHour;
        echo $res_time;
        
        // Build the SQL query
        $sql = "INSERT INTO reservations (ku_id, building, floor, class_no, res_time, res_status, study_type)  values ('$ku_id', '$building' , '$floor' , '$class_no', '$res_time', 'RESERVED', '$studyType')";

        echo $sql;
        $result = mysqli_query($db, $sql);
        
        if ($result) {
            echo "reservation added";
        }
        
        

        


    }

?>