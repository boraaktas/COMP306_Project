<?php 

    session_start();
    include('config.php'); 
    include('admin_header.php');

        
    $sql = "SELECT * FROM RESERVATIONS";
    $result = mysqli_query($db, $sql); 
    echo "<br>";
    echo "<table border='1'>";
    while ($row = mysqli_fetch_assoc($result)) { 
        echo "<tr>";
        foreach ($row as $field => $value) { 
            echo "<td>" . $value . "</td>"; 
        }
        echo "</tr>";
    }
    echo "</table>";

?>

<!DOCTYPE html>
<html>
    <body>
        <section class="sec">
            <header>
            
                <form id ="form" method="POST" >
                    <button class="button" onclick="redirectToPage('cancel_reservation')"> Cancel a reservation </button>  
                </form>  

            </header>
        </section>
    </body>
</html>

