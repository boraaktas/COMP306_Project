<?php
include "config.php";
include "classSearch.php";

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
}

if($_SERVER["REQUEST_METHOD"] === "POST") {
    
    // Build the SQL query
    $sql = "SELECT DISTINCT classes.building, classes.floor, classes.class_no, classes.image_url
            FROM classes LEFT JOIN connections ON classes.building = connections.building AND classes.floor = connections.floor AND classes.class_no = connections.class_no
            WHERE 1=1";

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

    # print number of rows returned
    echo '<h2 class="text-primary">Number of classes found: ' . mysqli_num_rows($result) . '</h2>';



   

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

<style>
    .class-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 20px;
        margin-top: 20px;
    }

    .class-card {
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .class-card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .class-card .class-details {
        padding: 20px;
    }

    .class-card .class-details h3 {
        margin: 0;
        padding: 0;
        color: #111;
        font-size: 20px;
        margin-bottom: 10px;
    }

    .class-card .class-details p {
        margin: 0;
        padding: 0;
        color: #777;
        font-size: 14px;
        margin-bottom: 10px;
    }

    .class-card .class-details a {
        display: inline-block;
        margin-top: 10px;
        padding: 8px 20px;
        background-color: #f44336;
        color: #fff;
        border-radius: 5px;
        text-decoration: none;
    }

    .class-card .class-details a:hover {
        background-color: #ff5722;
    }
</style>
