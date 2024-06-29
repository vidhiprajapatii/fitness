<?php
session_start();
include 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Fetch user profile data
$sql = "SELECT * FROM users WHERE user_id = $user_id";
$result = $conn->query($sql);
$user_profile = $result->fetch_assoc();

include 'templates/header.php'; // Include header template
?>

<!-- User Profile Display -->
<h2>User Profile</h2>

<p><strong>Username:</strong> <?php echo $user_profile['username']; ?></p>
<p><strong>Email:</strong> <?php echo $user_profile['email']; ?></p>
<p><strong>Age:</strong> <?php echo $user_profile['age']; ?></p>
<p><strong>Gender:</strong> <?php echo ucfirst($user_profile['gender']); ?></p>
<p><strong>Weight:</strong> <?php echo $user_profile['weight']; ?> kg</p>
<p><strong>Height:</strong> <?php echo $user_profile['height']; ?> cm</p>
<p><strong>Fitness Goals:</strong> <?php echo $user_profile['fitness_goals']; ?></p>
<p><strong>Health Conditions:</strong> <?php echo $user_profile['health_conditions']; ?></p>

<?php include 'templates/footer.php'; // Include footer template ?>
