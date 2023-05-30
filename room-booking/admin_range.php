<?php
    session_start();
    include "config.php";
    include "admin_header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    $today = date("Y-m-d");
?>


<script>

    function check_date() {

        var start_date = document.getElementById("start").value;
        var end_date = document.getElementById("end").value;

        // check if there is a date range
        if (start_date == "" || end_date == "") {
            alert("Please choose a date range.");
            return false;
        }

        if (start_date > end_date) {
            alert("Please choose a reasonable date range.");
            return false;
        }

        return true;
    }

</script>


<!DOCTYPE html>
<html>
    <body>
        <section class="date_range">
            <h1>Choose Date Range</h1>
            <form action="admin_showAnalysis.php" method="POST">
                <div class=date>
                    <div class=start_date>
                        <label for="start">Start date:</label>
                        <input type="date" id="start" name="start_date" max="<?php echo $today; ?>">
                    </div>
                    <div class=end_date>
                        <label for="end">End date:</label>
                        <input type="date" id="end" name="end_date" value="<?php echo $today; ?>" max="<?php echo $today; ?>">
                    </div>
                </div>
                <input type="submit" value="Submit" onclick="return check_date()">
            </form>
        </section>
    </body>
</html>


<style>

    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .date_range {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 10px;
    }

    .date_range h1 {
        color: white;
        font-size: 70px;
        margin-bottom: 20px;

    }

    .date_range form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin-top: 10px;
    }

    .date_range form input {
        margin: 10px;
    }

    .date_range form input[type=submit] {
        background: #45a049; 
        color: #ffffff; 
        padding: 10px 20px;
        font-size: 20px;
        font-family: 'Poppins', sans-serif;
        cursor: pointer;
        margin-top: 10px;
        border-radius: 5px;
        margin-left: 80px;
    }

    .date_range form label {
        color: white;
        font-size: 20px;
    }

    .date_range form input[type=date] {
        padding: 10px;
        font-size: 15px;
        border: none;
        background-color: #f1f1f1;
        color: #555;
        border-radius: 10px;
        width: 150px;
        margin-bottom: 10px;
        color: black;
    }

    .date_range form div[class=date] {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

</style>

            