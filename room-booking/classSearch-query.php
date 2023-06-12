<?php
include "config.php";
include "classSearch.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $currentdate_time = date("Y-m-d H:00:00", strtotime("+1 hour"));

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
    $selectedAvailability = $_POST["availability"];
}

if($_SERVER["REQUEST_METHOD"] === "POST") {

    // print availability 

    //echo '<h2 class="text-primary">Current date and time: ' . $currentdate_time . '</h2>';
    
    // Build the SQL query
    $sql = "SELECT DISTINCT classes.building, classes.floor, classes.class_no, classes.image_url,
                            (classes.capacity - IFNULL(reserved.total_reservations, 0) - IFNULL(joined.total_joins, 0)) AS remaining_capacity,
                            IFNULL(reserved.total_reservations, 0) +  IFNULL(joined.total_joins, 0) AS total_occupancy,
                            classes.capacity,
                            IFNULL(reserved.study_type, 'Not Reserved') AS reserved_study_type
            FROM classes LEFT JOIN connections
                                    ON classes.building = connections.building AND classes.floor = connections.floor AND classes.class_no = connections.class_no
                         LEFT JOIN (
                                    SELECT building, floor, class_no, COUNT(*) AS total_reservations, study_type
                                    FROM reservations
                                    WHERE res_time = '$currentdate_time' AND res_status = 'RESERVED'
                                    GROUP BY building, floor, class_no, study_type
                                ) reserved ON classes.building = reserved.building AND classes.floor = reserved.floor AND classes.class_no = reserved.class_no
                         LEFT JOIN (
                                    SELECT building, floor, class_no, COUNT(*) AS total_joins
                                    FROM joins
                                    WHERE join_time = '$currentdate_time' AND join_status = 'JOINED'
                                    GROUP BY building, floor, class_no
                                ) joined ON classes.building = joined.building AND classes.floor = joined.floor AND classes.class_no = joined.class_no
            WHERE 1 = 1";

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

    if ($selectedAvailability !== "all") {
        if ($selectedAvailability == "available") {
            $sql .= " AND ((classes.capacity - IFNULL(reserved.total_reservations, 0) - IFNULL(joined.total_joins, 0)) > 0
                            AND (reserved.study_type is NULL OR reserved.study_type = 'GROUP'))";
        } else if ($selectedAvailability == "non_available") {
            $sql .= " AND ((classes.capacity - IFNULL(reserved.total_reservations, 0) - IFNULL(joined.total_joins, 0)) <= 0
                            OR (reserved.study_type = 'INDIVIDUAL'))";
        }
    }
    
    $result = mysqli_query($db, $sql);

    # print number of rows returned

    echo '<div class="num_classes-container">
                <h2 class="num_classes">Number of classes found: ' . mysqli_num_rows($result) . '</h2>
            </div>';

    //visualization of the query results
    
    if (mysqli_num_rows($result) > 0) {
        echo '<div class="class-grid">';

        while ($row = mysqli_fetch_assoc($result)) {
            $building = $row['building'];
            $floor = $row['floor'];
            $classNo = $row['class_no'];
            $imageURL = $row['image_url'];
            $capacity = $row['capacity'];
            $remainingCapacity = $row['remaining_capacity'];
            $totalOccupancy = $row['total_occupancy'];
            $reserved_study_type = $row['reserved_study_type'];

            $availability = $remainingCapacity > 0 && ($reserved_study_type == 'Not Reserved' || $reserved_study_type == 'Group') ? 'Available' : 'Not Available';

            echo '<div class="class-card">
                    <img src="' . $imageURL . '" alt="Class Photo">
                    <div class="class-details">
                        <div class="class_main_infos">
                            <h3>' . $building . ' ' . $floor . '' . $classNo . '</h3>
                        </div>

                        <div class="class_capacity">
                            <p>Max Capacity: ' . $capacity . '</p>
                            <p>Remaining Capacity: ' . $remainingCapacity . '</p>
                            <p>Total Occupancy: ' . $totalOccupancy . '</p>
                            <p>Reservation Type: ' . $reserved_study_type . '</p>
                        </div>

                        <div class="class_availability">
                            <p>Availability: ' . $availability . '</p>
                        </div>

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
        margin-right: 20px;
        margin-left: 20px;
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

    .num_classes {
        margin-top: 20px;
        margin: 0 auto;
    }

    .num_classes-container {
        display: flex;
        justify-content: center;
        background-color: #fff;
        margin-right: 20px;
        margin-left: 20px;
    }

</style>