<?php
include "config.php";
include "header.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $selectedBuilding = $_POST["building"];
    $selectedFloor = $_POST["floor"];
    $selectedClassNo = $_POST["class_no"];
    $selectedCapacity = $_POST["capacity"];
    $selectedNoBoard = $_POST["no_boards"];
    $selectedIndv = $_POST["allow_individual"];
    $selectedWindow = $_POST["has_window"];
    $selectedCam= $_POST["has_Cam"];
    $selectedDocCam= $_POST["has_DocCam"];
    $selectedOutlets= $_POST["has_outlets"];
    $selectedLecCap= $_POST["has_lectureCap"];
    $selectedTouchScreen= $_POST["has_touchScreen"];
    $selectedConnectionType = $_POST["connection_type"];


    echo "Selected option 1: " . $selectedBuilding . "<br>";
    echo "Selected option 2: " . $selectedFloor . "<br>";
    echo "Selected option 3: " . $selectedClassNo . "<br>";
    echo "Selected option 4: " . $selectedCapacity . "<br>";
    echo "Selected option 5: " . $selectedNoBoard . "<br>";
    echo "Selected option 6: " . $selectedIndv . "<br>";
    echo "Selected option 7: " . $selectedWindow . "<br>";
    echo "Selected option 8: " . $selectedCam . "<br>";
    echo "Selected option 9: " . $selectedDocCam . "<br>";
    echo "Selected option 10: " . $selectedOutlets . "<br>";
    echo "Selected option 11: " . $selectedLecCap . "<br>";
    echo "Selected option 12: " . $selectedTouchScreen . "<br>";
    echo "Selected option 13: " . $selectedConnectionType . "<br>";


}



if($_SERVER["REQUEST_METHOD"] === "POST"){
    
    // Build the SQL query
    $sql = "SELECT classes.building, classes.floor, classes.class_no FROM classes INNER JOIN connections ON classes.building = connections.building AND classes.floor = connections.floor AND classes.class_no = connections.class_no WHERE 1=1";

    // Add WHERE conditions only if the user specified them
    if ($selectedBuilding !== "all") {
        $sql .= " AND classes.building = '$selectedBuilding'";
    }

    if ($selectedFloor !== "all") {
        $sql .= " AND classes.floor = '$selectedFloor'";
    }

    if ($selectedClassNo !== "") {
        $sql .= " AND classes.class_no = '$selectedClassNo'";
    }

    if ($selectedCapacity !== "all") {
        $sql .= " AND capacity $selectedCapacity";
    }

    if ($selectedNoBoard !== "all") {
        $sql .= " AND no_boards = '$selectedNoBoard'";
    }

    if ($selectedIndv !== "all") {
        $sql .= " AND allow_individual = '$selectedIndv'";
    }

    if ($selectedWindow !== "all") {
        $sql .= " AND has_window = '$selectedWindow'";
    }

    if ($selectedCam !== "all") {
        $sql .= " AND has_Cam = '$selectedCam'";
    }

    if ($selectedDocCam !== "all") {
        $sql .= " AND has_DocCam = '$selectedDocCam'";
    }
    if ($selectedOutlets !== "all") {
        $sql .= " AND has_outlets = '$selectedOutlets'";
    }
    if ($selectedLecCap !== "all") {
        $sql .= " AND has_lectureCap = '$selectedLecCap'";
    }
    if ($selectedTouchScreen !== "all") {
        $sql .= " AND has_touchScreen = '$selectedTouchScreen'";
    }
    if ($selectedConnectionType !== "all") {
        $sql .= " AND connection_type = '$selectedConnectionType'";
    }
    
    $result = mysqli_query($db, $sql);

   

    //visualization of the query results
    
    if (mysqli_num_rows($result) > 0) {
        echo '<div class="class-grid">';

        while ($row = mysqli_fetch_assoc($result)) {
            $building = $row['building'];
            $floor = $row['floor'];
            $classNo = $row['class_no'];

            // Retrieve additional information for each class
            $classInfoQuery = "SELECT * FROM classes WHERE building = '$building' AND floor = '$floor' AND class_no = '$classNo'";
            $classInfoResult = mysqli_query($db, $classInfoQuery);
            $classInfo = mysqli_fetch_assoc($classInfoResult);

            echo '<div class="class-card">
                    <img src="' . $classInfo['image_url'] . '" alt="Class Photo">
                    <div class="class-details">
                        <h3>' . $building . '</h3>
                        <p>Floor: ' . $floor . '</p>
                        <p>Class No: ' . $classNo . '</p>
                        <p>Capacity: ' . $classInfo['capacity'] . '</p>
                      
                       

                        <!-- Add more information here -->
                    </div>
                </div>';
        }
    }

        echo '</div>';
    } else {
        echo '<h2 class="text-danger">Class not found</h2>';
    }


?>
