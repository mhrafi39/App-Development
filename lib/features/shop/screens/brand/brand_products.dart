import 'package:gstore_official/common/widgets/appbar/appbar.dart';
import 'package:gstore_official/common/widgets/brands/brand_card.dart';
import 'package:gstore_official/common/widgets/products/sortable/sortable_product.dart';
import 'package:gstore_official/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:gstore_official/features/shop/controllers/brand_controller.dart';
import 'package:gstore_official/features/shop/models/brand_model.dart';
import 'package:gstore_official/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: TAppbar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    /// Handle Loader, No Record, OR Error Message
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(
                      products: brandProducts,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
