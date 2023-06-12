<?php

    session_start();
    include "config.php";
    include "admin_header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    if (isset($_GET['start_date']) && isset($_GET['end_date'])) {
        $start_date = $_GET['start_date'];
        $end_date = $_GET['end_date'] . ' 23:59:59';
    } else {
        header('Location: admin_range.php');
    }


    # get the total number of reservations table and the total number of joins table for each day
    $sql = "WITH RECURSIVE date_range AS (
            SELECT '$start_date' AS date
            UNION ALL
            SELECT DATE_ADD(date, INTERVAL 1 DAY) AS date
            FROM date_range
            WHERE DATE_ADD(date, INTERVAL 1 DAY) <= '$end_date')

            SELECT d.date, IFNULL(r.total_reservations, 0) AS total_reservations,
                IFNULL(j.total_joins, 0) AS total_joins, IFNULL(r.total_reservations, 0) + IFNULL(j.total_joins, 0) AS total
            FROM date_range d
                LEFT JOIN (
                    SELECT DATE(res_time) AS date, COUNT(*) AS total_reservations
                    FROM RESERVATIONS
                    WHERE res_time BETWEEN '$start_date' AND '$end_date' AND res_status = 'FINISHED'
                    GROUP BY DATE(res_time)
                ) r ON d.date = r.date
                LEFT JOIN (
                        SELECT DATE(join_time) AS date, COUNT(*) AS total_joins
                        FROM JOINS
                        WHERE join_time BETWEEN '$start_date' AND '$end_date' AND join_status = 'FINISHED'
                        GROUP BY DATE(join_time)
                    ) j ON d.date = j.date
                ORDER BY d.date;";


    $result = mysqli_query($db, $sql);

    $dates = array();
    $total_reservations = array();
    $total_joins = array();
    $total = array();

    while ($row = mysqli_fetch_array($result)) {
        $dates[] = $row['date'];
        $total_reservations[] = $row['total_reservations'];
        $total_joins[] = $row['total_joins'];
        $total[] = $row['total'];
    }

?>


<script>

    function stepSize() {
        var number_of_days = <?php echo count($dates); ?>;
        var stepSize = 1;

        if (number_of_days > 7) {
            stepSize = Math.ceil(number_of_days / 7);
        }

        return stepSize;
    }

</script>


<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
    </head>
    <body>
        <div class="chart-container">
            <canvas id="myChart"></canvas>
        </div>

        <script>

            var stepSize = stepSize();

            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels:<?php echo json_encode($dates); ?>,
                    datasets: [{
                        label: 'Total',
                        data:<?php echo json_encode($total); ?>,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 5,
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'Total Number of Reservations and Joins',
                        fontSize: 20,
                        fontColor: 'black'
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero:true,
                                stepSize: stepSize,
                                fontColor: 'black'
                            }
                        }],
                        xAxes: [{
                            ticks: {
                                fontColor: 'black',
                                fontSize: 12,
                            }
                        }],
                        xLabel: [{
                            fontColor: 'black',
                            
                        }],
                        yLabel: [{
                            fontColor: 'black'
                        }]
                    }
                }
            });
        </script>

        <div class="buttons">
            <div class="next_analysis">
                <button onclick="window.location.href='admin_secondChart.php?start_date=<?php echo $start_date; ?>&end_date=<?php echo $end_date; ?>'">Next Analysis</button>
            </div>
        </div>
        

    </body>
</html>


<style>
    .chart-container {
        background-color: white;
        width: 70%;
        height: 70%;
        margin: 0 auto;
        border: 1px solid black;
    }
    .date_range {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .date_range h1 {
        text-align: center;
    }

    .date_range form {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .date_range .date {
        display: flex;
        justify-content: space-between;
    }

    .date_range .date .start_date {
        width: 45%;
    }

    .date_range .date .end_date {
        width: 45%;
    }

    .date_range input[type=submit] {
        margin: 0 auto;
        display: block;
    }

    .next_analysis {
        margin: 0 auto;
        width: 50%;
        padding: 10px;
    }

    .next_analysis button {
        margin: 0 auto;
        display: block;
        background-color: #4CAF50;
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

