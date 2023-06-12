<?php

    include "config.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    if (isset($_GET["ku_id"]) && isset($_GET["building"]) && isset($_GET["floor"]) && isset($_GET["class_no"]) && isset($_GET["date_time"])) {

        $ku_id = $_GET["ku_id"];
        $building = $_GET["building"];
        $floor = $_GET["floor"];
        $class_no = $_GET["class_no"];
        $date_time = $_GET["date_time"];
        
        // Build the SQL query
        $sql = "DELETE FROM reservations
                WHERE ku_id = '$ku_id' AND building = '$building'
                      AND floor = '$floor' AND class_no = '$class_no' AND res_time = '$date_time'";

        $result = mysqli_query($db, $sql);
        
        if ($result) {
            header('Location: bookings_ViewQuery.php');
        }

    }

?>