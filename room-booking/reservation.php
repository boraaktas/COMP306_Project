<?php
 session_start();
 include "config.php";

 if ($_SERVER["REQUEST_METHOD"] === "POST") {
     // Check if the selected_option1 and selected_option2 fields are set in the $_POST array
     if (isset($_POST["building"]) && isset($_POST["floor"]) && isset($_POST["class_no"]) && isset($_POST["hour"]) && isset($_POST["study_type"]) ) {
         $building = $_POST["building"];
         $floor = $_POST["floor"];
         $class_no = $_POST["class_no"];
         $hour = $_POST["hour"];
         $studyType = $_POST["study_type"];

 
         /*echo "Selected option 1: " . $room_id . "<br>";
         echo "Selected option 2: " . $hour . "<br>";

         if ($studyType == 'Group') {
            echo '<input type="text" name="group_size">';
            echo '<input type="submit" value="Submit">';
         }

         if ($_SERVER["REQUEST_METHOD"] === "POST") {
            // Assuming the input box has the name "input_box"
            $groupSize = $_POST["group_size"];
        
            // Use the $inputValue variable as needed
            echo "Input value: " . $groupSize;
        }*/
    
     } else {
         echo "One or both options are not selected.";
     }
 }

 if($_SERVER["REQUEST_METHOD"] === "POST"){

    $ku_id = $_SESSION['ku_id'];
    
    // Build the SQL query
    $sql = "INSERT INTO reservations (ku_id, building, floor, class_no, res_time, res_status, study_type)  values ('$ku_id', '$building' , '$floor' , '$class_no', '$hour', 'RESERVED', '$studyType')";
    echo "$sql";
    //mysql query
    $result = mysqli_query($db, $sql);
    
    if ($result) {
        echo "reservation added";
    } else {
        echo "not regular_user";
    }

}

?>