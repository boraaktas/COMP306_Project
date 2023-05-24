<?php
include "config.php";
?>
<style>
  body {
    font-size: 20px;
    font-family: 'Open Sans', sans-serif;
    color: #00005C;
    background-color: #F0CAA3;
  }

  body.dark-mode {
    font-size: 20px;
    font-family: 'Open Sans', sans-serif;
    color: #F0CAA3;
    background-color: #77AADD;
  }
  .button-container {
    text-align: center;
    display: flex;
    justify-content: space-around;
  }
  .nav_select {
    text-align: center;
    font-size: 20px;
    appearance: none;
    border: none;
    outline: none;
    cursor: pointer;
  }
  .nav_button {
    text-align: center;
    font-size: 20px;
    appearance: none;
    border: none;
    outline: none;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  .nav_button:hover {
    background-color: #e0e0e0;
  }
  .nav_item {
    display: flex;
    align-items: center;
  }
  table {
    margin: 25px 0;
    width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  body .table {
    margin: 25px 0;
    width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  table.dark-mode {
    margin: 25px 0;
    width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    color: #F0CAA3;
    background-color: #77AADD;
  }
  body.dark-mode .table {
    margin: 25px 0;
    width: 100%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    color: #F0CAA3;
    background-color: #77AADD;
  }
  .halftable{
    float:left; 
    width: 49%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  body .halftable{
    float:left; 
    width: 49%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
  }
  .halftable.dark-mode{
    float:left; 
    width: 49%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    color: #F0CAA3;
    background-color: #77AADD;
  }

  body.dark-mode .halftable {
    float: left;
    width: 49%;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    color: #F0CAA3;
    background-color: #77AADD;
  }
  thead tr {
    background-color: #A555EC;
    text-align: left;
    border-bottom: 2px solid #00005C;
  }
  td, th {
    border: 2px solid #264653;
    text-align: left;
    padding: 8px;
  }
  tbody tr:hover {
    font-weight: bold;
    background-color: #4B56D2;
  }
</style>
<script>
  function redirectToPage(pageName) {
    var form = document.querySelector('form');
    form.action = pageName + ".php";
    form.submit();
  }
  function toggleDarkMode() {
    var allElements = document.querySelectorAll('*');
    for (var i = 0; i < allElements.length; i++) {
      allElements[i].classList.toggle('dark-mode');
    }
    if (allElements[0].classList.contains('dark-mode')) {
      setCookie('dark_mode', 'dark', 365);
    } else {
      setCookie('dark_mode', 'white', 365);
    }
  }
  function setCookie(name, value, days) {
    var expires = "";
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
  }

  function deleteCookie(name) {
    setCookie(name, '', -1);
  }

  window.addEventListener('load', function() {
    var darkModeCookie = getCookie('dark_mode');
    var allElements = document.querySelectorAll('*');
    if (darkModeCookie == 'dark') {
      for (var i = 0; i < allElements.length; i++) {
        allElements[i].classList.add('dark-mode');
      }
    }else {
      for (var i = 0; i < allElements.length; i++) {
        allElements[i].classList.add('dark-mode');
      }
    }
  });

  function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }
</script>

<div class="button-container">
  <input type="submit" class="nav_button" value="Home" onclick="redirectToPage('homepage')">
  <form id ="form" method="POST" >

  <select class="nav_select" name="Filter" onchange="redirectToPage(this.value)">
      <option value="" disabled selected>Filter</option>
      //value lar file isimleri olacak
      <option value="groupstudy">Group Study</option>
      <option value="indstudy">Individual Study</option>
      <option value="groupmeeting">Group Meeting</option>
    </select>

    <input type="submit" class="nav_button" value="Book/Join a Class" onclick="redirectToPage('book-join')">
    <input type="submit" class="nav_button" value="Show All" onclick="redirectToPage('showall')">

    <input type="button" class="nav_button" value="Toggle Dark Mode" onclick="toggleDarkMode()" >   
  </form>
</div>
<hr style="width:75%">
