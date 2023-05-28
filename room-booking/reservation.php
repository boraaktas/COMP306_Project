<?php
 session_start();
 include "config.php";

 if ($_SERVER["REQUEST_METHOD"] === "POST") {
     // Check if the selected_option1 and selected_option2 fields are set in the $_POST array
     if (isset($_POST["room_id"]) && isset($_POST["hour"]) ) {
         $room_id = $_POST["room_id"];
         $hour = $_POST["hour"];
 
         echo "Selected option 1: " . $room_id . "<br>";
         echo "Selected option 2: " . $hour . "<br>";
    
     } else {
         echo "One or both options are not selected.";
     }
 }

 if($_SERVER["REQUEST_METHOD"] === "POST"){

    $ku_id = $_SESSION['ku_id'];
    // Database connection configuration
    $host = "localhost";
    $port = 3302;
    $username = "root"; //your username
    $password = ""; //your password
    $database = "room_booking";

    // Create a connection to the MySQL server
    $db = mysqli_connect($host, $username, $password, $database, $port);
    
    // Build the SQL query
    $sql = "INSERT INTO reservations values ($room_id, '1', '', $hour)";
    
    //mysql query
    $result = mysqli_query($db, $sql);
    echo "reservation added";
}

?>