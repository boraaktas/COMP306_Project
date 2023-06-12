<?php
    include "config.php";
    include "header.php";
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    }


    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }

    $now = date("Y-m-d H:i");
?>


<script>

    function check_date() {

        var start_date = document.getElementById("start_time").value;
        var end_date = document.getElementById("end_time").value;


        if (start_date > end_date) {
            alert("Please choose a reasonable date range.");
            return false;
        }

        return true;

    }

</script>


<form action="bookings.php" method="post">
  <br>
  <div class="filter-container">

  <select name="booking_type" class="study-room-selector">
      <option value="all">Type of Booking</option>
      <option value="join">Join</option>
      <option value="reservation">Reservation</option>
    </select>

  <select name="booking_status" class="study-room-selector">
      <option value="all">Status</option>
      <option value="Finished">Finished</option>
      <option value="Future">Future</option>
    </select>

    <div class="date-container">
      <div class="date-start-container">
        <label for="start_time">Start Time:</label>
        <input type="datetime-local" id="start_time" name="start_time" class="study-room-selector" value="<?php echo date("2023-05-01 00:00"); ?>">
      </div>

      <div class="date-end-container">
        <label for="end_time">End Time:</label>
        <input type="datetime-local" id="end_time" name="end_time" class="study-room-selector" value="<?php echo $now; ?>">
      </div>
    </div>

    <br>
    
    <input type="submit" value="Search" class="search-button" onclick="return check_date()">
    </div>
</form>
  


<style>

  .filter-container {
    text-align: center;
    padding: 10px;
    border-radius: 10px;
    background-color: grey;
    margin-right: 30px;
    margin-left: 30px;
  }

  .study-room-selector{
    padding: 10px;
    font-size: 15px;
    border: none;
    background-color: #f1f1f1;
    color: #555;
    border-radius: 10px;
    width: 180px;
    margin-bottom: 10px;
    color: black;
  }

  ::placeholder {
    color: black;
    font-size: 15px;
  }

  .search-button {
    padding: 12px 12px;
    font-size: 20px;
    border: none;
    background-color: #4CAF50;
    color: #fff;
    border-radius: 10px;
    cursor: pointer;
  }

  .search-button:hover {
    background-color: #45a049;
  }


  .date-container {
    display: flex;
    justify-content: center;
    align-items: center;

  }

  .date-start-container {
    margin-right: 10px;
  }

  .date-end-container {
    margin-left: 10px;
  }

  .date-start-container label {
    font-size: 20px;
    font-weight: bold;
  }

  .date-end-container label {
    font-size: 20px;
    font-weight: bold;
  }

  .date-start-container input {
    padding: 10px;
    font-size: 15px;
    border: none;
    background-color: #f1f1f1;
    color: #555;
    border-radius: 10px;
    width: 200px;
    margin-bottom: 10px;
    color: black;
  }

  .date-end-container input {
    padding: 10px;
    font-size: 15px;
    border: none;
    background-color: #f1f1f1;
    color: #555;
    border-radius: 10px;
    width: 200px;
    margin-bottom: 10px;
    color: black;
  }

</style>