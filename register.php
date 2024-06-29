<?php
session_start();
include 'config/database.php';



if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];
    $age = $_POST['age'];
    $gender = $_POST['gender'];
    $weight = $_POST['weight'];
    $height = $_POST['height'];
    $fitness_goals = $_POST['fitness_goals'];
    $health_conditions = $_POST['health_conditions'];

    $sql = "INSERT INTO users (username, password, email, age, gender, weight, height, fitness_goals, health_conditions)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssisddss", $username, $password, $email, $age, $gender, $weight, $height, $fitness_goals, $health_conditions);
    $stmt->execute();

    if ($stmt->affected_rows == 1) {
        $success_message = "Registration successful. Please login.";
    } else {
        $error_message = "Registration failed. Please try again.";
    }

    $stmt->close();
}

include 'templates/header.php'; // Include header template
?>
<style>body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 8px;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="number"],
select,
textarea {
    padding: 8px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    width: 100%;
}

button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

.success {
    color: green;
    font-weight: bold;
}

.error {
    color: red;
    font-weight: bold;
}

    </style>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- Registration Form -->
<form action="register.php" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    
    <label for="age">Age:</label>
    <input type="number" id="age" name="age" required><br><br>
    
    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="other">Other</option>
    </select><br><br>
    
    <label for="weight">Weight (kg):</label>
    <input type="number" id="weight" name="weight" step="any" required><br><br>
    
    <label for="height">Height (cm):</label>
    <input type="number" id="height" name="height" step="any" required><br><br>
    
    <label for="fitness_goals">Fitness Goals:</label><br>
    <textarea id="fitness_goals" name="fitness_goals" rows="4" cols="50" required></textarea><br><br>
    
    <label for="health_conditions">Health Conditions:</label><br>
    <textarea id="health_conditions" name="health_conditions" rows="4" cols="50"></textarea><br><br>
    
    <button type="submit">Register</button>
</form>

<?php
if (isset($success_message)) {
    echo "<p>$success_message</p>";
} elseif (isset($error_message)) {
    echo "<p>$error_message</p>";
}
?>

<?php include 'templates/footer.php'; // Include footer template ?>
