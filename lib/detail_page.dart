import 'package:flutter/material.dart';
import 'cart.dart';
import 'quantity_dialog.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final ValueChanged<int> onAddToCart;

  const DetailPage({Key? key, required this.product, required this.onAddToCart}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int availableQuantity = 0;

  @override
  void initState() {
    super.initState();
    availableQuantity = widget.product['quantity'] as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(widget.product['image']),
            const SizedBox(height: 20.0),
            Text(
              widget.product['name'],
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.product['description'],
              style: const TextStyle(fontSize: 16.0, color: Colors.blue),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Price: ${widget.product['price']}',
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                Text(
                  'Quantity Available: $availableQuantity',
                  style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (availableQuantity > 0) {
                  _addToCart(context);
                } else {
                  _showOutOfStockDialog(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return QuantityDialog(
          product: widget.product,
          availableQuantity: availableQuantity,
          onQuantitySelected: (int quantity) {
            setState(() {
              // Don't update availableQuantity here
            });
            widget.onAddToCart(quantity);
          },
        );
      },
    );
  }

  void _showOutOfStockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Out of Stock'),
          content: const Text('Sorry, this product is out of stock.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
