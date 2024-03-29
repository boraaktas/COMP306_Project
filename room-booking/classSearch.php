<?php
  include "config.php";
  include "header.php"  
  
?>

<form action="classSearch-query.php" method="post">
  <br>
  <div class="filter-container">

    <select name="building" class="study-room-selector">
      <option value="all">Building</option>
      <option value="CASE">CASE</option>
      <option value="SNA">SNA</option>
      <option value="ENG">ENG</option>
      <option value="SOS">SOS</option>
      <option value="SCI">SCI</option>
      <option value="ELC">ELC</option>
    </select>

    <select name="floor" class="study-room-selector">
      <option value="all">Floor</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="A">A</option>
      <option value="Z">Z</option>
      <option value="B">B</option>
      <option value="B1">B1</option>
      <option value="B2">B2</option>
    </select>
    
    <input type="text" id="class_no" name="class_no", placeholder="Class No" class="study-room-selector">

    <select name="capacity" class="study-room-selector">
      <option value="all">Capacity</option>
      <option value="< 20">Less than 20</option>
      <option value="> 20 AND capacity <= 40">20 to 40</option>
      <option value="> 40 AND capacity <= 60">40 to 60</option>
      <option value="> 60">60 or more</option>
    </select>

    <select name="no_boards" class="study-room-selector">
      <option value="all">Boards</option>
      <option value=1>1</option>
      <option value=2>2</option>
      <option value=4>4</option>
    </select>

    <select name="allow_individual" class="study-room-selector">
      <option value="all">Study Type</option>
      <option value=1>Individual</option>
      <option value=0>Group</option>
    </select>

    <select name="has_window" class="study-room-selector">
      <option value="all">Window</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="has_Cam" class="study-room-selector">
      <option value="all">Camera</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>


    <select name="has_DocCam" class="study-room-selector">
      <option value="all">DocCamera</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="has_outlets" class="study-room-selector">
      <option value="all">Outlets</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="has_lectureCap" class="study-room-selector">
      <option value="all">Lecture Cap</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="has_touchScreen" class="study-room-selector">
      <option value="all">Touch Screen</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="connection_type" class="study-room-selector">
      <option value="all">Connection Type</option>
      <option value="HDMI">HDMI</option>
      <option value="Vga">Vga</option>
    </select>

    <select name="availability" class="study-room-selector">
      <option value="all">Current Availability</option>
      <option value="available">Available</option>
      <option value="non_available">Not Available</option>
    </select>

    <br>

    <input type="submit" value="Search" class="search-button">
    </div>
</form>
  


  <style>
  .filter-container {
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

</style>

