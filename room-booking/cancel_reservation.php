<?php 

    session_start();
    include('config.php'); 
    include('admin_header.php');

    if(isset($_POST['ku_id']) && isset($_POST['hour']) && isset($_POST['date'])) {
        $ku_id = $_POST['ku_id'];
        $hour = $_POST["hour"];
        $formattedHour = sprintf("%02d:00", $hour);
        $res_time = $date ." ". $formattedHour;

        //query to delete the reservations using keys ku_id and res_time
        $sql = "DELETE FROM RESERVATIONS WHERE ku_id='$ku_id' AND res_time='$res_time";

        if (mysqli_query($db, $sql)) {
            echo "Record deleted successfully";
          } else {
            echo "Error deleting record: " . mysqli_error($db);
          }
    }


 ?>

<script>

// function to check if the date is today or future
function checkDate() {
    // get the date from the input
    var date = document.getElementById("date").value;
    // get the current date
    var today = new Date();
    // convert the date to the same format as the input date
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); 
    var yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;

    // if the input date is before the current date, then show an alert and clear the input
    if (date < today) {
        alert("Please enter a valid date");
        document.getElementById("date").value = "";
    }
}

</script>

<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Document</title>
    </head>
    <body>
        <div class="sec">

            <h1>Cancel reservation below</h1>

            <form action="cancel_reservation.php" method="post">
                <input type="text" name="ku_id" placeholder="Students ID" />
                <input type="text" name="hour" placeholder="Hour" />
                <input type="date"  name="date" size="50", placeholder="Date" required onblur="checkDate()">
                <button type="submit">Cancel</button>
            </form>

        </div>
    </body>
</html>