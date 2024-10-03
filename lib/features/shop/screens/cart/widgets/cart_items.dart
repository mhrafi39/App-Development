import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/QuantityController.dart';
import '../../../../../controllers/cart_controllers.dart'; // Import the controller
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find(); // Use CartController instance

    return Obx(() {
      return ListView.separated(
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) {
          final cartItem = cartController.cartItems[index];
          return Column(
            children: [
              /// -- Cart Item
              TCartItem(
                productImage: cartItem.thumbnail, // Use thumbnail
                productTitle: cartItem.title, // Use title
                brandName: cartItem.brand, // Use brand
                color: cartItem.color, // Use color
                size: cartItem.size, // Use size
                price: cartItem.unitPrice, // Use unit price
                quantity: cartItem.quantity, // Use quantity
              ),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              /// Add Remove Button Row with total Price
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TProductQuantityWithAddRemoveButton(
                          quantityController: Get.put(QuantityController()), // Use QuantityController instance
                        ),
                      ],
                    ),
                    Obx(() {
                      final totalPrice = cartController.totalCartPrice;
                      return TProductPriceText(price: '${totalPrice.toStringAsFixed(2)}'); // Display total price
                    }),
                  ],
                ),
            ],
          );
        },
      );
    });
  }
}
