<?php
// Database information
$servername = "localhost";
$username = "dbyazan";
$password = "0000";
$dbname = "my_ecommerce_db";

// Create connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    if (isset($_GET['api']) && $_GET['api'] == 'true') {
        header('Content-Type: application/json');
        http_response_code(500);
        echo json_encode(["message" => "Connection failed: " . $conn->connect_error]);
    } else {
        echo "Connection failed: " . $conn->connect_error;
    }
    exit();
}

session_start();
if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true) {
    header("location: login.php");
    exit;
}

$user_name = $_SESSION["email"];
$user_email = $_SESSION["email"];

if (isset($_POST["logout"])) {
    session_destroy();
    header("Location: login.php");
    exit();
}

$search_query = '';
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['search'])) {
    $search_query = $conn->real_escape_string($_POST['search']);
} elseif (isset($_GET['search'])) {
    $search_query = $conn->real_escape_string($_GET['search']);
}

$sql = "SELECT * FROM products";
if ($search_query) {
    $sql .= " WHERE name LIKE '%$search_query%'";
}

$result = $conn->query($sql);

$products = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}

// Check if the request is an API call
if (isset($_GET['api']) && $_GET['api'] == 'true') {
    header('Content-Type: application/json');
    echo json_encode($products, JSON_PRETTY_PRINT);
    $conn->close();
    exit();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Search</title>
    <link href="https://cdn.jsdelivr.net/npm/boosted@5.1.3/dist/css/boosted.min.css" rel="stylesheet" integrity="sha384-Di/KMIVcO9Z2MJO3EsrZebWTNrgJTrzEDwAplhM5XnCFQ1aDhRNWrp6CWvVcn00c" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-4">
        <!-- Search form -->
        <form action="" method="post" class="mb-4">
            <div class="input-group">
                <input type="text" class="form-control" name="search" placeholder="Search for a product" value="<?php echo htmlspecialchars($search_query); ?>">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>

        <!-- Display search results -->
        <div class="row">
            <?php
            if (!empty($products)) {
                foreach ($products as $product) {
                    echo '<div class="col-md-4 mb-4">';
                    echo '<div class="card">';
                    echo '<img src="' . htmlspecialchars($product['img_url']) . '" class="card-img-top" alt="' . htmlspecialchars($product['name']) . '">';
                    echo '<div class="card-body">';
                    echo '<h5 class="card-title">' . htmlspecialchars($product['name']) . '</h5>';
                    echo '<p class="card-text">Brand: ' . htmlspecialchars($product['brand']) . '</p>';
                    echo '<p class="card-text">Price: ' . htmlspecialchars($product['price']) . '</p>';
                    echo '<p class="card-text">Rating: ' . htmlspecialchars($product['rate']) . ' stars</p>';
                    echo '</div>';
                    echo '</div>';
                    echo '</div>';
                }
            } else {
                echo '<p>No products found.</p>';
            }
            ?>
        </div>
        <form method="post" action="">
          <button type="submit" name="logout" class="btn btn-danger mt-3">Log Out</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/boosted@5.1.3/dist/js/boosted.bundle.min.js" integrity="sha384-5thbp4uNEqKgkl5m+rMBhqR+ZCs+3iAaLIghPWAgOv0VKvzGlYKR408MMbmCjmZF" crossorigin="anonymous"></script>
</body>
</html>
