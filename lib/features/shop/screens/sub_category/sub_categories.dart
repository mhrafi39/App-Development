import 'package:carousel_slider/carousel_slider.dart';
import 'package:gstore_official/common/widgets/appbar/appbar.dart';
import 'package:gstore_official/common/widgets/images/t_rounded_image.dart';
import 'package:gstore_official/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:gstore_official/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:gstore_official/common/widgets/texts/section_heading.dart';
import 'package:gstore_official/features/shop/controllers/banner_controller.dart';
import 'package:gstore_official/features/shop/controllers/category_controller.dart';
import 'package:gstore_official/features/shop/models/category_model.dart';
import 'package:gstore_official/features/shop/screens/all_products/all_products.dart';
import 'package:gstore_official/utils/constants/sizes.dart';
import 'package:gstore_official/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    final bannerController = Get.put(BannerController());
    return Scaffold(
      appBar: TAppbar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Slide Banner
              CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          bannerController.updatePageIndicator(index)),
                  items: bannerController.banners
                      .map((banners) => TRoundedImage(
                            imageUrl: banners.imageUrl,
                            isNetworkImage: true,
                            // onPressed: () => Get.toNamed(banner.targetScreen),
                          ))
                      .toList()),

              /// Space
              const SizedBox(
                width: TSizes.spaceBtwSections,
              ),

              /// Sub Category
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  TCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  TSectionHeading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          ))),
                                  const SizedBox(
                                    height: TSizes.spaceBtwItems / 2,
                                  ),
                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: TSizes.spaceBtwItems,
                                            ),
                                        itemBuilder: (context, index) =>
                                            TProductCardHorizontal(
                                                product: products[index])),
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
