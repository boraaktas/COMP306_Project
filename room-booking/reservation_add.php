<?php

    include "config.php";
    include 'reservation.php';

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    // check url parameters
    
    if (isset($_GET["building"]) && isset($_GET["floor"]) && isset($_GET["class_no"]) && isset($_GET["date"])) {
        $building = $_GET["building"];
        $floor = $_GET["floor"];
        $class_no = $_GET["class_no"];
        $date = $_GET["date"];
        
        // create an array of hours after the current hour if the date is today or all hours if the date is future date 
        $hours = array();

        $capacity = array();
        $allowed_ind_study = array();
        $res_join_busy = array();


        $currentHour = date("H");
        if ($date == date("Y-m-d")) {
            for ($i = $currentHour + 1; $i < 24; $i++) {
                array_push($hours, $i);
            }
        }
        else {
            for ($i = 0; $i < 24; $i++) {
                array_push($hours, $i);
            }
        }


    }

?>


<script>

    function reserveOrJoin(hour) {

        var building = "<?php echo $building; ?>";
        var floor = "<?php echo $floor; ?>";
        var class_no = "<?php echo $class_no; ?>";
        var date = "<?php echo $date; ?>";
        var time = hour + ":00:00";



    }

</script>


<div class="hours-container">
    <table>
        <div class="hours-header">
            <th>Time</th>
            <th>Capacity</th>
            <th>Study Type</th>
            <th>Reserve</th>
        </div>
        <div class="hours-body">
            </tr>
                <?php
                    for ($i = 0; $i < count($hours); $i++) {
                        echo "<tr>";
                            echo "<td>$hours[$i]:00 - $hours[$i]:59</td>";
                            echo "<td>Cap array</td>";
                            echo "<td>Allowed Ind Study array</td>";
                        echo "<td><a href='reserve_individual.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$$hours[$i]' class='button' onclick='Reserve Individual($hours[$i])'>Reserve (Individual)</a>
                        <a href='reserve_group.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$$hours[$i]' class='button' onclick='Reserve Group($hours[$i])'>Reserve (Group)</a>
                        <a href='join.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$$hours[$i]' class='button' onclick='Join($hours[$i])'>Join</a>
                        </td>";
                        echo "</tr>";
                    }
                ?>
            </tr>
        </div>
    </table>
</div>


<style>

    .hours-container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 90%;
        margin: 0 auto;
    }

    .hours-container table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px;
        
    }

    
    table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px;
        
    }


    .hours-container th {
        text-align: center;
        padding: 8px;
        background-color: #009c05;
        color: white;
    }

    .hours-container td {
        text-align: center;
        padding: 8px;
        background-color: #d9d9d9;
        border-bottom: 1px solid #009c05;
    }

    .hours-container tr:hover {
        background-color: wheat;
    }

    .hours-body {
        height: 200px;
        overflow-y: scroll;
    }

    a.button {
        -webkit-appearance: button;
        -moz-appearance: button;
        appearance: button;

        text-decoration: none;
        color: initial;
        background-color: #009c05;

    }
    


</style>

