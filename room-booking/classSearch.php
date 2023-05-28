<?php
  include "config.php";
  include "header.php"  
?>

<form action="process_findclass.php" method="post">
  <br>
  <div class="filter-container">

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
    
    <input type="text" id="class_no" name="class_no" size="50", placeholder="Class No" class="study-room-selector">

    <br>

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

    <br>

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
      <option value="all">Camera</option>
      <option value=1>Yes</option>
      <option value=0>No</option>
    </select>

    <select name="connection_type" class="study-room-selector">
      <option value="all">Connection Type</option>
      <option value="HDMI">HDMI</option>
      <option value="Vga">Vga</option>
    </select>

    <br>

    <input type="submit" value="Search" class="search-button">

  </div>
</form>


<style>
  .filter-container {
    text-align: center;
    margin: 0 auto;
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
    padding: 12px 24px;
    font-size: 20px;
    border: none;
    background-color: #4CAF50;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
  }

  .search-button:hover {
    background-color: #45a049;
  }


</style>
