<?php
session_start();
include 'config/database.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

include 'templates/header.php';
?>

<h2>Welcome, User!</h2>
<ul>
    <li><a href="user/workout_plans/select_plan.php">Select Workout Plan</a></li>
    <li><a href="user/nutrition_plans/select_plan.php">Select Nutrition Plan</a></li>
    <li><a href="user/activity_logs/log_activity.php">Log Activity</a></li>
    <li><a href="profile.php">Profile</a></li>
    <li><a href="logout.php">Logout</a></li>
</ul>

<?php include 'templates/footer.php'; ?>

