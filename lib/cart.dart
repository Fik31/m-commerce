class Cart {
  static final List<Map<String, dynamic>> _cartItems = [];

  static void addToCart(Map<String, dynamic> product, int quantity) {
    _cartItems.add({'product': product, 'quantity': quantity});
  }

  static List<Map<String, dynamic>> getCartItems() {
    return _cartItems;
  }

  static void clearCart() {
    _cartItems.clear();
  }
}
