<?php
include "main.php";
?>
<!DOCTYPE html>
<html>
<head>
  <title>Centralized Style</title>
  <style>
    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }

    .form-group {
      margin: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <?php
    $classes = [1, 2];
    $days = [1, 2];

    // Display days as column headers
    echo '<div class="form-group">';
    echo '<div class="blank-cell"></div>'; // Empty cell at the top-left corner
    for ($day = 0; $day < 10; $day++) {
      echo '<div class="form-group day-header">' . $day . '</div>';
    }
    echo '</div>';

    // Display class numbers and buttons
    for ($class = 0; $class < 10; $class++) {
      echo '<div class="form-group">';
      echo '<div class="form-group class-number">' . $class . '</div>';
      for ($day = 0; $day < 10; $day++) {
        echo '
        <form class="form-group" action="classdetails.php" method="POST">
          <input type="hidden" name="class" value="' . $class . '">
          <input type="hidden" name="day" value="' . $day . '">
          <input type="submit" value="' . $day . $class . '">

          
        </form>
        ';
        //once the one of the buttons is clicked, it will go to a new page and display the detail information about the class 

      }



      echo '</div>';
    }

    if (!empty($_POST['class']) && !empty($_POST['day'])) {
      $class = $_POST['class'];
      $day = $_POST['day'];
      echo $class . $day;
    }
    ?>
  </div>
</body>
</html>
