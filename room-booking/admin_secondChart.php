<?php

    session_start();
    include "config.php";
    include "admin_header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    if (isset($_GET['start_date']) && isset($_GET['end_date'])) {
        $start_date = $_GET['start_date'];
        $end_date = $_GET['end_date'];
    } else {
        header('Location: admin_range.php');
    }


    $sql = "SELECT c.building,
            (IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) AS total_usages,
            (SUM(IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) OVER ()) AS total_sum,
            ((IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) / (SUM(IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0)) OVER ())) * 100 AS usage_percentage
            FROM
                CLASSES c
                LEFT JOIN (
                    SELECT building, COUNT(*) AS total_reservations
                    FROM RESERVATIONS
                    WHERE res_time BETWEEN '$start_date' AND '$end_date' AND res_status = 'FINISHED'
                    GROUP BY building
                ) r ON c.building = r.building
                LEFT JOIN (
                    SELECT building, COUNT(*) AS total_joins
                    FROM JOINS
                    WHERE join_time BETWEEN '$start_date' AND '$end_date' AND join_status = 'FINISHED'
                    GROUP BY building
                ) j ON c.building = j.building
            GROUP BY
                c.building;";


    $result = mysqli_query($db, $sql);

    $buildings = array();
    $total_usages = array();
    $total_sum = array();
    $usage_percentage = array();
    

    while ($row = mysqli_fetch_array($result)) {
        $buildings[] = $row['building'];
        $total_usages[] = $row['total_usages'];
        $total_sum[] = $row['total_sum'];
        $usage_percentage[] = $row['usage_percentage'];
    }

    # plot a pie chart for each building with the percentage of usage

    $data = array();

    for ($i = 0; $i < count($buildings); $i++) {
        $data[] = array(
            "label" => $buildings[$i],
            "y" => $usage_percentage[$i]
        );
    }
    

?>


<script>

    window.onload = function () {
        var chart = new CanvasJS.Chart("chartContainer", {
            animationEnabled: true,
            animationDuration: 500,
            title: {
                text: "Percentage of Usage for Each Building"
            },
            subtitles: [{
                text: "from <?php echo $start_date; ?> to <?php echo $end_date; ?>"
            }],
            data: [{
                type: "pie",
                yValueFormatString: "#,##0.00\"%\"",
                indexLabel: "{label} ({y})",
                dataPoints: <?php echo json_encode($data, JSON_NUMERIC_CHECK); ?>
            }]
        });

        chart.render();
    }

</script>


<!DOCTYPE html>
<html>
    <head>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </head>
    <body>

        <div class="chartContainer" id="chartContainer"></div>

        <div class="buttons">
            <div class="prev_analysis">
                <button onclick="window.location.href='admin_firstChart.php?start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>'">Previous Analysis</button>
            </div>

            <div class="next_analysis">
                <button onclick="window.location.href='admin_thirdChart.php?start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>'">Next Analysis</button>
            </div>
        </div>

    </body>
</html>


<style>

    .chartContainer {
        background-color: white;
        width: 70%;
        height: 70%;
        margin: 0 auto;
        border: 1px solid black;
    }

    .next_analysis {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .next_analysis button {
        margin: 0 auto;
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .prev_analysis {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .prev_analysis button {
        margin: 0 auto;
        background-color: #f44336;
        color: white;
        padding: 10px;
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .buttons {
        background-color: opaque;
        margin: 0 auto;
        width: 70%;
        padding: 10px;
        display: flex;
    }
    

</style>









