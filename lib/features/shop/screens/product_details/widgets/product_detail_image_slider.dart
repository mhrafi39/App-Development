
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gstore_official/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:gstore_official/features/shop/controllers/product/images_controller.dart';
import 'package:gstore_official/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product
  });

  final ProductModel product;


  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);


    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        // Assuming dark is not defined, default to light color
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Center(
                    child: Obx(
                        () {
                          final image = controller.selectedProductImage.value;
                          return GestureDetector(
                            onTap: () => controller.showEnlargedImage(image),
                            child: CachedNetworkImage(
                                imageUrl: image,
                                progressIndicatorBuilder: (_,__,downloadProgress) =>
                                    CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primary,),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(
                      () {

                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return TRoundedImage(
                          width: 80,
                          isNetworkImage: true,
                          imageUrl: images[index],
                          padding: const EdgeInsets.all(TSizes.sm),
                          backgroundColor: dark ? TColors.dark : TColors.white,
                          onPressed: () => controller.selectedProductImage.value = images[index],
                          border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                        );
                      }
                  ),
                ),
              ),
            ),

            // appbar icons
            TAppbar(
              showBackArrow: true,
              actions: [TFavouriteIcon(productId: product.id,)],
            )
          ],
        ),
      ),
    );
  }
}
