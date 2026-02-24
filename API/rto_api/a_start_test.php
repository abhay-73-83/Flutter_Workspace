<?php
// Show errors (REMOVE in production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'connect.php';

header('Content-Type: application/json');

// Check database connection
if (!$con) {
    echo json_encode([
        'success' => false,
        'message' => 'Database connection failed'
    ]);
    exit;
}

// Get POST values safely
$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
$test_type = isset($_POST['test_type']) ? trim($_POST['test_type']) : '';
$total_questions = isset($_POST['total_questions']) ? intval($_POST['total_questions']) : 0;

// Validate required fields
if ($user_id <= 0) {
    echo json_encode([
        'success' => false,
        'message' => 'Valid User ID required'
    ]);
    exit;
}

if (empty($test_type)) {
    echo json_encode([
        'success' => false,
        'message' => 'Test type required'
    ]);
    exit;
}

if ($total_questions <= 0) {
    echo json_encode([
        'success' => false,
        'message' => 'Total questions must be greater than 0'
    ]);
    exit;
}

// Prepare statement (SAFE)
$stmt = $con->prepare("INSERT INTO a_tests 
    (user_id, test_type, total_questions, total_correct, total_wrong, score) 
    VALUES (?, ?, ?, 0, 0, 0)");

if (!$stmt) {
    echo json_encode([
        'success' => false,
        'message' => 'Prepare failed: ' . $con->error
    ]);
    exit;
}

// Bind parameters
$stmt->bind_param("isi", $user_id, $test_type, $total_questions);

// Execute query
if ($stmt->execute()) {
    echo json_encode([
        'success' => true,
        'message' => 'Test started successfully',
        'test_id' => $con->insert_id
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Execute failed: ' . $stmt->error
    ]);
}

$stmt->close();
$con->close();
?>