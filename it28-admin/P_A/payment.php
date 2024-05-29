<?php
require_once 'pa_config.php';

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $productName = $_POST['productName'];
    $price = $_POST['price'];
    $paymentMethod = $_POST['paymentMethod'];

    // Insert data into database
    $sql = "INSERT INTO payments (product_name, price, payment_method) VALUES ('$productName', '$price', '$paymentMethod')";

    if ($conn->query($sql) === TRUE) {
        // Redirect to address.php after successful payment recording
        header("Location: address.php");
        exit(); // Ensure that subsequent code is not executed after redirection
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close connection
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-image: url('https://wallpapercave.com/wp/wp8990728.jpg'); /* Replace 'your-background-image.jpg' with the path to your background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #d0bfff; /* Light purple border */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #ffffff;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="submit"] {
            width: auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
            margin-top: 20px;
            color: #555;
        }

        a {
            color: #ffffff ;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Make Payment</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <label for="productName">Product Name:</label><br>
            <input type="text" id="productName" name="productName"><br><br>
            <label for="price">Price:</label><br>
            <input type="number" id="price" name="price" step="0.01"><br><br>
            <label for="paymentMethod">Payment Method:</label><br>
            <select id="paymentMethod" name="paymentMethod">
                <option value="PayMaya">PayMaya</option>
                <option value="GCash">GCash</option>
                <option value="PayPal">PayPal</option>
            </select><br><br>
            <input type="submit" value="Submit">
        </form>
        <p style="text-align: center; margin-top: 20px;"><a href="address.php">Already submitted the payment? Enter your address here.</a></p>
    </div>
</body>
</html>
