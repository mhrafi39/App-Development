import 'package:gstore_official/common/widgets/appbar/appbar.dart';
import 'package:gstore_official/common/widgets/brands/brand_card.dart';
import 'package:gstore_official/common/widgets/texts/section_heading.dart';
import 'package:gstore_official/features/shop/controllers/brand_controller.dart';
import 'package:gstore_official/features/shop/screens/brand/brand_products.dart';
import 'package:gstore_official/features/shop/screens/store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Brands
              Obx(
                () {
                  if (brandController.featuredBrands.isEmpty) {
                    const TBrandsShimmer();

                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    );

                    return Center(
                      child: Text(
                        "No Data Found!",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white),
                      ),
                    );
                  }

                  return TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
