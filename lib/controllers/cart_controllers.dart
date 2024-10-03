import 'package:get/get.dart';

class CartController extends GetxController {
  // Observable list of CartItem
  var cartItems = <CartItem>[].obs;

  // Add or update product in the cart
  void addProductToCart({
    required String productId,
    required String title,
    required String thumbnail,
    required String brand,
    required String color,
    required String size,
    required int quantity,
    required double unitPrice,
  }) {
    // Check if item already exists in the cart
    final existingItem = cartItems.firstWhereOrNull((item) => item.productId == productId);

    if (existingItem != null) {
      // Update existing item
      existingItem.quantity += quantity;
      existingItem.totalPrice = existingItem.quantity * unitPrice;
    } else {
      // Add new item to the cart
      cartItems.add(CartItem(
        productId: productId,
        title: title,
        thumbnail: thumbnail,
        brand: brand,
        color: color,
        size: size,
        quantity: quantity,
        unitPrice: unitPrice,
        totalPrice: quantity * unitPrice,
      ));
    }
  }

  // Get total price of all items in the cart
  double get totalCartPrice => cartItems.fold(0, (total, item) => total + item.totalPrice);
}

class CartItem {
  final String productId;
  final String title;
  final String thumbnail; // URL or path of the product image
  final String brand;
  final String color;
  final String size;
  int quantity;
  final double unitPrice;
  double totalPrice;

  CartItem({
    required this.productId,
    required this.title,
    required this.thumbnail,
    required this.brand,
    required this.color,
    required this.size,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });
}
