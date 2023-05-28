<?php
include "main.php";

?>
</head>
<body>
  <div class="container">
    <div class="form">
      <form action="reservation.php" method="POST">
        <label for="r_id">Room ID:</label><br>
        <input type="text" id="r_id" name="room_id" size="50"><br><br>

        <select class="nav_select" name="hour">
          <option value="" disabled selected>Select Time</option>
          <?php
          for ($hour = 0; $hour < 24; $hour++) {
            $time = sprintf('%02d:00 - %02d:59', $hour, $hour); // Format the time range
            echo '<option value="' . $hour . '">' . $time . '</option>';
          }
          ?>
        </select><br><br>

        <input type="submit" value="Submit">
      </form>
    </div>
  </div>
</body>
</html>

<?php
if (!empty($_POST['room_id']) && !empty($_POST['myear'])) {
  $room_id = $_POST['room_id'];
  $myear = $_POST['myear'];
  $sql = "INSERT INTO booking (room_id, myear) VALUES ('$room_id', '$myear')";
  if ($db->query($sql) === TRUE) {
    echo "New record created successfully";
    header("Location: main.php");
  } else {
    echo "Error: " . $sql . "<br>" . $db->error;
  }
}
?>
