import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  final String productImage;
  final String productTitle;
  final String brandName;
  final String color;
  final String size;
  final double price;
  final int quantity;

  const TCartItem({
    super.key,
    required this.productImage,
    required this.productTitle,
    required this.brandName,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        TRoundedImage(
          imageUrl: productImage,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        /// Title, Size, Price
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBrandTitleWithVerifiedIcon(title: brandName),
            Flexible(
              child: TProductTitleText(
                title: productTitle,
                maxLines: 1,
              ),
            ),
            /// Attributes
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '$color ', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '$size ', style: Theme.of(context).textTheme.bodyLarge),
            ])),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Price: \$${price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        )
      ],
    );
  }
}
