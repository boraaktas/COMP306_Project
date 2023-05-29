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

        $year = date("Y", strtotime($date));
        $month = date("m", strtotime($date));
        $day = date("d", strtotime($date));
        
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

        $allow_individual = false;
        $indv_reserved = false;
        $group_reserved = false;
        $condition_join = false;

        //get allow_individual of selected class to make reserve indv button disabled
        $check_allow_individual_query = "SELECT allow_individual FROM classes WHERE building = '$building' AND floor = '$floor' AND class_no = '$class_no'";
        $check_allow_individual_result = $db->query($check_allow_individual_query);

        $row_tmp = mysqli_fetch_assoc($check_allow_individual_result);
        
        $allow_individual_bool = $row_tmp["allow_individual"];

        print_r($allow_individual_bool);

        if ( $allow_individual_bool== '1') {
            $allow_individual = true;
        }

        //retrieves dates of individual reserved selected class
        $check_indv_reserved_query = "SELECT DATE_FORMAT(res_time, '%H') AS hour FROM classes INNER JOIN reservations WHERE YEAR(res_time) = '$year' AND MONTH(res_time) = '$month' AND DAY(res_time) = '$day' AND res_status = 'RESERVED' AND classes.building = '$building' AND classes.floor = '$floor' AND classes.class_no = '$class_no' AND classes.building=reservations.building AND classes.floor=reservations.floor AND classes.class_no=reservations.class_no AND study_type = 'Individual'";
        $check_indv_reserved_dates = $db->query($check_indv_reserved_query);

        if ($check_indv_reserved_dates) {
            // Create an array to store the hours
            $reserved_indv_hours = array();
            
            // Fetch rows from the result object
            while ($row = mysqli_fetch_assoc($check_indv_reserved_dates)) {
                // Access the hour value from the row
                $hour_tmp = $row['hour'];
                
                // Add the hour to the array
                $reserved_indv_hours[] = $hour_tmp;
            }
            
            // Free the result set
            mysqli_free_result($check_indv_reserved_dates);
        } else {
            // Query execution failed
            echo "Error: " . mysqli_error($db);
        }

        print_r($reserved_indv_hours);

         
        //retrieves dates of group reserved selected class
         $check_group_reserved_query = "SELECT DATE_FORMAT(res_time, '%H') AS hour FROM classes INNER JOIN reservations WHERE YEAR(res_time) = '$year' AND MONTH(res_time) = '$month' AND DAY(res_time) = '$day' AND res_status = 'RESERVED' AND classes.building = '$building' AND classes.floor = '$floor' AND classes.class_no = '$class_no' AND classes.building=reservations.building AND classes.floor=reservations.floor AND classes.class_no=reservations.class_no AND study_type = 'Group'";
         $check_group_reserved_dates = $db->query($check_group_reserved_query);
 
         if ($check_indv_reserved_dates) {
             // Create an array to store the hours
             $reserved_group_hours = array();
             
             // Fetch rows from the result object
             while ($row = mysqli_fetch_assoc($check_group_reserved_dates)) {
                 // Access the hour value from the row
                 $hour_tmp = $row['hour'];
                 
                 // Add the hour to the array
                 $reserved_group_hours[] = $hour_tmp;
             }
             
             // Free the result set
             mysqli_free_result($check_group_reserved_dates);
         } else {
             // Query execution failed
             echo "Error: " . mysqli_error($db);
         }
 
         print_r($reserved_group_hours);

        




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
                            echo "<td>";

                            if (in_array($hours[$i], $reserved_indv_hours)) {
                                $indv_reserved = true;
                            } else {
                                $indv_reserved = false;
                            }

                            if (in_array($hours[$i], $reserved_group_hours)) {
                                $group_reserved = true;
                            } else {
                                $group_reserved = false;
                            }

                            
                            // Condition 1 for disabling Reserve (Individual) button
                            if (! ($allow_individual && !$indv_reserved) ) {
                                echo "<button href='reserve_individual.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' disabled onclick='ReserveIndividual($hours[$i])'>Reserve (Individual)</button>";
                            } else {
                                echo "<a href='reserve_individual.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' onclick='ReserveIndividual($hours[$i])'>Reserve (Individual)</a>";
                            }
                            
                            // Condition 2 for disabling Reserve (Group) button
                            if ( $indv_reserved || $group_reserved) {
                                echo "<button href='reserve_group.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' disabled onclick='ReserveGroup($hours[$i])'>Reserve (Group)</button>";
                            } else {
                                echo "<a href='reserve_group.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' onclick='ReserveGroup($hours[$i])'>Reserve (Group)</a>";
                            }
                            
                            // Condition 3 for disabling Join button
                            if ( $indv_reserved ) {
                                echo "<button href='reserve_join.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' disabled onclick='Join($hours[$i])'>Join</button>";
                            } else {
                                echo "<a href='reserve_join.php?building=$building&floor=$floor&class_no=$class_no&date=$date&hour=$hours[$i]' class='button' onclick='Join($hours[$i])'>Join</a>";
                            }
                            
                            echo "</td>";
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

