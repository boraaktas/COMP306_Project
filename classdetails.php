<?php
include "main.php";
include "groupstudy.php";

// Retrieve the room ID from the query parameter
if (isset($_GET['roomID'])) {
  $roomID = $_GET['roomID'];

  // Perform any necessary data retrieval or processing based on the room ID

  // Example: Display the detailed information about the room
  echo "<h1>Room Details</h1>";
  echo "<p>Room ID: " . $roomID . "</p>";
  echo "<p>Other room details go here...</p>";
} else {
  // Handle the case where the room ID is not available
  echo "<p>No room information available.</p>";
}
?>