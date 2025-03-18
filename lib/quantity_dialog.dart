import 'package:flutter/material.dart';
import 'cart.dart';

class QuantityDialog extends StatefulWidget {
  final Map<String, dynamic> product;
  final int availableQuantity;
  final ValueChanged<int> onQuantitySelected;

  const QuantityDialog({
    Key? key,
    required this.product,
    required this.availableQuantity,
    required this.onQuantitySelected,
  }) : super(key: key);

  @override
  _QuantityDialogState createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Quantity'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              if (selectedQuantity > 1) {
                setState(() {
                  selectedQuantity--;
                });
              }
            },
          ),
          Text(
            '$selectedQuantity',
            style: const TextStyle(fontSize: 20.0),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (selectedQuantity < widget.availableQuantity) {
                setState(() {
                  selectedQuantity++;
                });
              }
            },
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add to Cart'),
          onPressed: () {
            widget.onQuantitySelected(selectedQuantity); // Send selected quantity back to DetailPage
            Cart.addToCart(widget.product, selectedQuantity);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
