import 'package:gstore_official/common/widgets/brands/brand_show_case.dart';
import 'package:gstore_official/common/widgets/shimmer/boxes_shimmer.dart';
import 'package:gstore_official/common/widgets/shimmer/list_title_shimmer.dart';
import 'package:gstore_official/features/shop/controllers/brand_controller.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:gstore_official/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gstore_official/features/shop/models/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              TListTitleShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (_, index) {
                final brand = brands[index];
                return FutureBuilder(
                    future: controller.getBrandProducts(
                        brandId: brand.id, limit: 3),
                    builder: (context, snapshot) {
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      final products = snapshot.data!;

                      return TBrandShowcase(
                          brand: brand,
                          images: products.map((e) => e.thumbnail).toList());
                    });
              });
        });
  }
}
