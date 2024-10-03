import 'package:gstore_official/common/widgets/custom_shape/container/rounded_container.dart';
import 'package:gstore_official/utils/constants/colors.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:gstore_official/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget{
  const TSingleAddress({
    super.key,
    required this.selectedAddress,
});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress
      ? TColors.darkGrey
        : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
    child: Stack(
      children: [
        Positioned(
          right: 5,
          top: 0,
          child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
          color: selectedAddress
            ? dark
            ? TColors.light
            : TColors.dark : null),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mehedi Hasan',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: TSizes.sm / 2),
            const Text('(+880) 1627 776162', maxLines: 1, overflow: TextOverflow.ellipsis,),
            const SizedBox(height: TSizes.sm / 2),
            const Text('82356 Modhubag, Tejgaon, Dhaka, 87665, Bangladesh', softWrap: true,),
          ],
        )
      ],
    ),
    );
  }
}