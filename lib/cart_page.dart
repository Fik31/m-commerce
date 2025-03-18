import 'package:flutter/material.dart';
import 'cart.dart';
import 'invoice_page.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> catalog;

  const CartPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = Cart.getCartItems();
    int totalCost = 0;

    // Calculate total cost
    for (var item in cartItems) {
      int quantity = item['quantity'] as int;
      totalCost += quantity * (item['product']['price'] as int);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  int quantity = cartItems[index]['quantity'] as int;
                  int cost = quantity * (cartItems[index]['product']['price'] as int);

                  return Card(
                    color: Colors.blue[50],
                    child: ListTile(
                      title: Text(
                        cartItems[index]['product']['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      subtitle: Text('Quantity: $quantity', style: const TextStyle(color: Colors.blue)),
                      trailing: Text('Total: $cost', style: const TextStyle(color: Colors.blue)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Total Cost: $totalCost',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _handleBuy(context, cartItems); // Process purchase
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Buy',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleBuy(BuildContext context, List<Map<String, dynamic>> cartItems) {
    // Navigate to the invoice page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoicePage(cartItems: cartItems),
      ),
    );
  }
}
