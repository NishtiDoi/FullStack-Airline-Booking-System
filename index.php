<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>

<body>
    <h2>Book a Flight</h2>
    <form action="book_flight.php" method="POST">
        <label for="flight_id">Select Flight ID:</label><br>
        <select name="flight_id" id="flight_id">
            <?php
            // PHP code to fetch flight IDs from the database and populate the dropdown
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

            $sql = "SELECT Flight_ID FROM Flight";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<option value='" . $row['Flight_ID'] . "'>" . $row['Flight_ID'] . "</option>";
                }
            } else {
                echo "0 results";
            }

            $conn->close();
            ?>
        </select><br><br>

        <label for="ps_id">Passenger ID:</label><br>
        <input type="text" id="ps_id" name="ps_id" required><br><br>

        <label for="name">Your Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" required><br><br>

        <label for="age">Age:</label><br>
        <input type="number" id="age" name="age" required><br><br>

        <label for="sex">Sex:</label><br>
        <input type="radio" id="male" name="sex" value="M" required>
        <label for="male">Male</label>
        <input type="radio" id="female" name="sex" value="F" required>
        <label for="female">Female</label><br><br>

        <label for="contact">Contact Number:</label><br>
        <input type="tel" id="contact" name="contact" required><br><br>

        <input type="submit" value="Book Flight">
    </form>
</body>

</html>