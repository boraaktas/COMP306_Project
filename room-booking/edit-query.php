<?php
  if(!isset($_SESSION)) 
  { 
      session_start(); 
  } 
include "config.php";
include "classSearch.php";


//get user information
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    