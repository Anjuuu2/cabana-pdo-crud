<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Add the script block here -->
    <style>
        .logo-background {
            background-image: url('https://wallpapercave.com/wp/wp9999090.jpg');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            width: 100%;
            height: 100vh;
            position: fixed;
            z-index: -1;
        }

      

        .top-background {
            background-image: url('https://wallpapercave.com/wp/wp7648695.jpg');
            background-size: cover;
            background-position: center;
            height: 600px; /* Adjust the height as needed */
            width: 100%;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            width: 80%;
            margin: -150px auto 0 auto; /* Adjust margin to overlap the top background */
            border: 1px solid #50404d; /* Light purple border */
            border-radius: 10px;
            margin-top: 50px; /* Add margin to move the product display down */
        }

        .card {
            position: relative;
            border: 2px solid #d0bfff; /* Light purple border */
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid #d0bfff;
        }

        .card-body {
            background: #dcdcdc; /* Gray background */
            padding: 20px;
            text-align: center;
        }

        .card-title {
            font-family: 'Arial', sans-serif;
            font-size: 1.25rem;
            font-weight: bold;
            color: #4b0082; /* Indigo color */
        }

        .card-text {
            font-family: 'Arial', sans-serif;
            font-size: 1rem;
            color: #4b0082;
        }

        .btn-success {
            background-color: #6a5acd; /* Slate blue color */
            border: none;
        }

        .btn-success:hover {
            background-color: #483d8b; /* Darker slate blue */
        }

        #cartContainer {
            position: fixed;
            top: 4em;
            right: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            z-index: 999;
        }
    </style>
</head>
<body>

    <div class="logo-background"></div>
    <div class="top-background"></div>
    <nav class="navbar navbar-expand-lg navbar-light bg-gray">
        <a class="navbar-brand" href="#">
            <img src="https://1000logos.net/wp-content/uploads/2021/08/Genshin-Impact-Logo-500x314.png" width="120" height="50" class="d-inline-block align-top" alt="">
        </a>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#"></a>
            </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
    </nav>
    <div id="productsDisplay" class="card-grid"></div>
    <div id="cartContainer"></div>

    <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Product Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="modalBody">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <a href="it28-admin/P_A/payment.php" class="btn btn-primary" id="buyButton">Buy</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        fetch('./products/products-api.php')
            .then(response => response.json())
            .then(data => {
                const booksContainer = document.getElementById('productsDisplay');
                data.forEach(product => {
                    const cardHTML = `
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="${product.img}">
                            <div class="card-body">
                                <h5 class="card-title">${product.title}</h5><br>Price: ₱${product.rrp}<br>
                                <p class="card-text">${product.description}.</p>
                                <p class="card-text"<br>Quantity: ${product.quantity}</p>
                                 <button class="btn btn-success" onclick="showProductModal('${product.title}', '${product.rrp}')">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            </div>
                    </div>
                    `;
                    booksContainer.innerHTML += cardHTML;
                });
            })
            .catch(error => console.error('Error:', error));

        function showProductModal(title, price) {
            document.getElementById('modalBody').innerHTML = `
                <p>Name: ${title}</p>
                <p>Price: ₱${price}</p>
            `;
            $('#productModal').modal('show');
        }

        let cart = {};

        function addToCart(productId) {
            if (cart[productId]) {
                cart[productId]++;
            } else {
                cart[productId] = 1;
            }
            displayCart();
        }

        function displayCart() {
            const cartContainer = document.getElementById('cartContainer');
            let cartHTML = '<h3>Cart</h3>';
            for (const [productId, quantity] of Object.entries(cart)) {
                cartHTML += `<p>Product ID: ${productId}, Quantity: ${quantity}</p>`;
            }
            cartContainer.innerHTML = cartHTML;
        }
        
        
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
