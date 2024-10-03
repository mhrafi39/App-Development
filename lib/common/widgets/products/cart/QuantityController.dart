import 'package:get/get.dart';



class QuantityController extends GetxController {
  var quantity = 1.obs; // Reactive quantity
  final double unitPrice = 256.0; // Example unit price

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) { // Ensure quantity does not go below 1
      quantity.value--;
    }
  }

  double get totalPrice => quantity.value * unitPrice; // Calculate total price dynamically
}


