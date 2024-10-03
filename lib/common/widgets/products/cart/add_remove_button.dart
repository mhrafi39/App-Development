import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/t_circular_icon.dart';
import 'QuantityController.dart'; // Make sure the path is correct

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  final QuantityController quantityController;

  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantityController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.light
              : TColors.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          onPressed: () {
            quantityController.decreaseQuantity();
          },
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Obx(() {
          return Text(
            '${quantityController.quantity.value}',
            style: Theme.of(context).textTheme.titleSmall,
          );
        }),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: () {
            quantityController.increaseQuantity();
          },
        ),
      ],
    );
  }
}
