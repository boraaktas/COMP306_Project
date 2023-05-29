<?php
    session_start();
    include "config.php";
    include "header.php";

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Check if the selected_option1 and selected_option2 fields are set in the $_POST array
        if (isset($_POST["building"]) && isset($_POST["floor"]) && isset($_POST["class_no"]) && isset($_POST["date"])) {

            // Retrieve the values from the $_POST array
            $building = $_POST["building"];
            $floor = $_POST["floor"];
            $class_no = $_POST["class_no"];
            $date = $_POST["date"];
  
            // check if there is an class for the selected building, floor, class_no in the database
            $sql = "SELECT * FROM classes WHERE building = '$building' AND floor = '$floor' AND class_no = '$class_no'";
            $result = $db->query($sql);

            if ($result->num_rows == 0) {
                echo '<script> alert("There is no class with this number in this building and floor"); </script>;';
            }
            else {
                header("Location: reservation_add.php?building=$building&floor=$floor&class_no=$class_no&date=$date");
            }
        
        }
    }

    if($_SERVER["REQUEST_METHOD"] === "POST"){

        $ku_id = $_SESSION['ku_id'];
        
        // Build the SQL query
       $sql = "INSERT INTO reservations (ku_id, building, floor, class_no, res_time, res_status, study_type)  values ('$ku_id', '$building' , '$floor' , '$class_no', '$hour', 'RESERVED', '$studyType')";

        $result = mysqli_query($db, $sql);
        
        if ($result) {
            echo "reservation added";
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


<form action="reservation.php" method="post">
  <br>
  <div class="classSelection-container">

    <select name="building" class="study-room-selector" required>
      <option value="CASE">CASE</option>
      <option value="SNA">SNA</option>
      <option value="SNA">SNA</option>
      <option value="SOS">SOS</option>
      <option value="SCI">SCI</option>
    </select>

    <select name="floor" class="study-room-selector" required>
      <option value="A">A</option>
      <option value="B">B</option>
      <option value="Z">Z</option>
      <option value="1">1</option>
      <option value="2">2</option>
    </select>
    
    <input type="text" id="class_no" name="class_no" size="50", placeholder="Class No" class="study-room-selector" required>

    <input type="date" id="date" name="date" size="50", placeholder="Date" class="study-room-selector" required onblur="checkDate()">

    <input type="submit" value="Show Availability" class="search-button">

  </div>

</form>


<style>
  .classSelection-container {
    text-align: center;
    margin: 0 auto;
    width: 100%;
    padding: 10px;
    border-radius: 10px;
    background-color: grey;
    box-sizing: border-box;
  }

  .study-room-selector{
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

</style>