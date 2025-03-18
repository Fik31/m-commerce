import 'package:flutter/material.dart';
import 'cart.dart';

class InvoicePage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const InvoicePage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalCost = 0;

    // Calculate total cost
    for (var item in cartItems) {
      int quantity = item['quantity'] as int;
      totalCost += quantity * (item['product']['price'] as int);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thank you for your purchase!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Here is your invoice:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  int quantity = cartItems[index]['quantity'] as int;
                  int cost = quantity * (cartItems[index]['product']['price'] as int);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          cartItems[index]['product']['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Quantity: $quantity'),
                        trailing: Text('Total: $cost'),
                      ),
                      Divider(), // Divider for separating items
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Total Cost: $totalCost',
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Clear the cart after purchase
                Cart.clearCart();
                // Decrease available quantity only if product was added to cart
                for (var item in cartItems) {
                  if (item['product']['name'] == 'Baju') {
                    item['product']['quantity'] -= item['quantity'];
                  }
                }
                // Navigate back to the home page and remove all previous routes
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
