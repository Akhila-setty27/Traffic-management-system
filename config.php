 <?php


$servername = "localhost";
$username = "root";
$password = "";


$conn = mysqli_connect($servername,$username,$password);
mysqli_select_db($conn,"demo2");
$link = $conn;
// if($conn)
// {
// echo "Successful";
// }
// else
// {
//     echo "Failed";

// }
?> 