<?php
include "main.php";
?>
<!DOCTYPE html>
<html>
<head>
<style>
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .form {
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .form label {
      color: #000;
    }

    .form input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .form select {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      color: #000;
      background-color: #fff;
    }

    .form input[type="submit"] {
      width: 100%;
      padding: 10px;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .form input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="form">
      <form action="book-join.php" method="POST">
        <label for="mail">Mail address:</label><br>
        <input type="text" id="mail" name="mail" size="50"><br><br>
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
if (!empty($_POST['mail']) && !empty($_POST['room_id']) && !empty($_POST['myear'])) {
  $mail = $_POST['mail'];
  $room_id = $_POST['room_id'];
  $myear = $_POST['myear'];
  $sql = "INSERT INTO booking (mail, room_id, myear) VALUES ('$mail', '$room_id', '$myear')";
  if ($db->query($sql) === TRUE) {
    echo "New record created successfully";
    header("Location: main.php");
  } else {
    echo "Error: " . $sql . "<br>" . $db->error;
  }
}
