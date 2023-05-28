<?php
include "main.php";

?>
</head>
<body>
  <div class="container">
    <div class="form">
      <form action="reservation.php" method="POST">
      <select name="building" class="study-room-selector">
        <option value="all">Building</option>
        <option value="CASE">CASE</option>
        <option value="SNA">SNA</option>
        <option value="SNA">SNA</option>
        <option value="SOS">SOS</option>
        <option value="SCI">SCI</option>
      </select>

      <select name="floor" class="study-room-selector">
        <option value="all">Floor</option>
        <option value="A">A</option>
        <option value="B">B</option>
        <option value="Z">Z</option>
        <option value="1">1</option>
        <option value="2">2</option>
      </select>

      <br>

      <label for="class_no">ClassNo:</label>
      
      <input type="text" id="class_no" name="class_no" size="50"><br><br>

        <select class="nav_select" name="hour">
          <option value="" disabled selected>Select Time</option>
          <?php
          for ($hour = 0; $hour < 24; $hour++) {
            $time = sprintf('%02d:00 - %02d:59', $hour, $hour); // Format the time range
            echo '<option value="' . $hour . '">' . $time . '</option>';
          }
          ?>
        </select><br><br>

        <select name="study_type" class="study-room-selector">
          <option value="all">Study Type</option>
          <option value="Individual">Individual</option>
          <option value="Group">Group</option>
        </select>

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
