import 'package:gstore_official/common/widgets/layouts/grid_layout.dart';
import 'package:gstore_official/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:gstore_official/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:gstore_official/common/widgets/texts/section_heading.dart';
import 'package:gstore_official/features/shop/controllers/category_controller.dart';
import 'package:gstore_official/features/shop/models/category_model.dart';
import 'package:gstore_official/features/shop/screens/all_products/all_products.dart';
import 'package:gstore_official/features/shop/screens/store/widgets/category_brands.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:gstore_official/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Column(
                children: [
                  // -- Brand
                  CategoryBrands(category: category),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
                    builder: (context, snapshot) {
                      final response =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot,
                              loader: const TVerticalProductShimmer());
                      if (response != null) return response;

                      final products = snapshot.data!;

                      return Column(
                        children: [
                          TSectionHeading(
                            title: category.name,
                            onPressed: () => Get.to(AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            )),
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          TGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => TProductCardVertical(
                                  product: products[index]))
                        ],
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
