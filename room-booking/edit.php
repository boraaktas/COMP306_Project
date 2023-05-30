<?php
  if(!isset($_SESSION)) 
  { 
      session_start(); 
  } 
include "header.php";
include "config.php"
?>


<form action="edit.php" method="POST">
    <?php
        $current_id = $_SESSION['ku_id'];
        $sql = "SELECT * FROM users WHERE ku_id = '$current_id'";
        $gotResuslts = mysqli_query($db,$sql);
        

        if($gotResuslts ){
            if(mysqli_num_rows($gotResuslts)>0 ){
                while($row = mysqli_fetch_array($gotResuslts)){
                
    ?>
    <div class="container">
        <h2>Edit Profile</h2>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="UpdateUserName" class="form-control" value = "<?php echo $row['firstname']; ?>">
            </div>
            <div class="form-group">
                <label for="name">Surname:</label>
                <input type="text" surname="UpdateSurname" class="form-control" value = "<?php echo $row['lastname']; ?>">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" name="UpdateEmail" class="form-control" value = "<?php echo $row['mail']; ?>">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="text" name="UpdatePassword" class="form-control" value ="<?php echo $row['password']; ?>">
            </div>
             </div>
    <?php
                }
            }
        }
       
        $sql = "SELECT * FROM regular_users WHERE ku_id = '$current_id'";
        $gotResuslts = mysqli_query($db,$sql);

        if($gotResuslts){
            if(mysqli_num_rows($gotResuslts)>0 ){
                while($row = mysqli_fetch_array($gotResuslts)){
                    echo $row['ku_id'];
                
    ?>
   
</form>
    
    <form action="edit.php" method="POST">
            <div class="form-group">
                <label for = "academic_level">Academic Level:</label>
                <select name="academic_level" class="form-control" value ="<?php echo $row['academic_level']; ?>" >
                    <option value="" disabled selected>Select your academic level</option>
                    <option value="Freshman">Freshman</option>
                    <option value="Sophomore">Sophomore</option>
                    <option value="Junior">Junior</option>
                    <option value="Senior">Senior</option>
                    <option value="Masters">Masters</option>
                    <option value="PhD">PhD</option>
                </select>
            </div>
            <div class="form-group">
                <label for = "faculty">Faculty:</label>
                <select name="faculty" class="form-control" value = "<?php echo $row['faculty']; ?>" >
                    <option value="" disabled selected>Select your faculty</option>
                    <option value="CASE">CASE</option>
                    <option value="CS">CS</option>
                    <option value="CSSH">CSSH</option>
                    <option value="CE">CE</option>
                    <option value="SOM">SOM</option>
                    <option value="SON">SON</option>
                    <option value="LAW">LAW</option>
                </select>
            </div>

           
            <div class="form-group">
                <button type="submit">Update</button>
            </div>

    </div>
    <?php
                }
            }
        }

    ?>
</form>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #45a049;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>

