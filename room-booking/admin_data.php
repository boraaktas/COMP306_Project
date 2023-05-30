<?php
    session_start();
    include "config.php";
    include "admin_header.php";

    if (!isset($_SESSION['ku_id'])) {
        header('Location: login.php');
    }
?>