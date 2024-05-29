<?php
// Retrieve form data
$ps_id = $_POST['ps_id']; // New: Retrieve Ps_ID from the form
$flight_id = $_POST['flight_id'];
$name = $_POST['name'];
$address = $_POST['address'];
$age = $_POST['age'];
$sex = $_POST['sex'];
$contact = $_POST['contact'];

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "airline_dbms";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Insert data into database
$sql = "INSERT INTO Passengers (Ps_ID, Ps_Name, Address, Age, Sex, Contacts, Flight_ID) 
        VALUES ('$ps_id', '$name', '$address', $age, '$sex', '$contact', '$flight_id')";

if ($conn->query($sql) === TRUE) {
    echo "Booking successful!";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>