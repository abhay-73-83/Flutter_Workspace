import 'dart:io';

void main()
{
  Cart myCart = Cart();

  while (true)
  {
    print("Shopping Cart Menu:");
    print("1. Add Product");
    print("2. View Cart");
    print("3. Checkout");
    print("4. Exit");

    print("Enter your choice:");
    int choice = int.parse(stdin.readLineSync().toString());

    if (choice == 1)
    {
      print("Enter product name:");
      String name = stdin.readLineSync().toString();

      print("Enter product price:");
      double price = double.parse(stdin.readLineSync().toString());

      Product p = Product(name, price);
      myCart.addProduct(p);

      print("$name added to cart.");

    }
    else if (choice == 2)
    {
      myCart.viewCart();

    }
    else if (choice == 3)
    {
      Order order = Order(myCart);
      order.checkout();

    }
    else if (choice == 4)
    {
      print("Exiting program...");
      break;

    }
    else
    {
      print("Invalid choice.");
    }
  }
}

// Product class
class Product
{
  String name;
  double price;

  Product(this.name, this.price);
}

// Cart class
class Cart
{
  List<Product> products = [];

  void addProduct(Product p)
  {
    products.add(p);
  }

  void viewCart()
  {
    if (products.isEmpty)
    {
      print("Cart is empty.");
    }
    else
    {
      print("Products in cart:");
      for (var p in products)
      {
        print("${p.name} - \$${p.price}");
      }
    }
  }

  double getTotal()
  {
    double total = 0;
    for (var p in products)
    {
      total += p.price;
    }
    return total;
  }
}

// Order class
class Order
{
  Cart cart;

  Order(this.cart);

  void checkout()
  {
    double total = cart.getTotal();
    print("Total price: \$${total}");
    print("Order placed successfully!");
  }
}
