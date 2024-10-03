import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gstore_official/utils/constants/colors.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../controllers/cart_controllers.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatefulWidget {
  const TBottomAddToCart({super.key, required this.unitPrice,required this.productId,required this.title,
    required this.brand,
    required this.thumbnail,
    required this.size,
    required this.color
  });

  final String productId; // Product ID
  final double unitPrice;
  final String title;
  final String thumbnail;
  final String brand;
  final String size;
  final String color;

  @override
  _TBottomAddToCartState createState() => _TBottomAddToCartState();
}

class _TBottomAddToCartState extends State<TBottomAddToCart> {
  final RxInt _quantity = 1.obs; // Local quantity state

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    final CartController cartController = Get.find(); // Get the CartController instance

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace,
        vertical: TSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (_quantity.value > 1) {
                    _quantity.value--;
                  }
                },
                icon: const Icon(
                  Iconsax.minus,
                  color: TColors.white,
                ),
                color: TColors.darkGrey,
                iconSize: 40,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Obx(() => Text(
                '${_quantity.value}',
                style: Theme.of(context).textTheme.titleSmall,
              )),
              const SizedBox(width: TSizes.spaceBtwItems),
              IconButton(
                onPressed: () {
                  _quantity.value++;
                },
                icon: const Icon(
                  Iconsax.add,
                  color: TColors.white,
                ),
                color: TColors.black,
                iconSize: 40,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Add to cart logic
              cartController.addProductToCart(
                productId: widget.productId,
                title: widget.title, // Provide actual title
                thumbnail: widget.thumbnail, // Provide actual thumbnail URL
                brand: widget.brand, // Provide actual brand
                color: widget.color, // Provide actual color
                size: widget.size, // Provide actual size
                quantity: _quantity.value,
                unitPrice: widget.unitPrice,
              );
              // Optionally, show a snack bar or toast
              Get.snackbar('Added to Cart', 'Product has been added to your cart');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
