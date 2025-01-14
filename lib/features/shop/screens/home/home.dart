import 'package:gstore_official/common/widgets/layouts/grid_layout.dart';
import 'package:gstore_official/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:gstore_official/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:gstore_official/common/widgets/texts/section_heading.dart';
import 'package:gstore_official/features/shop/screens/all_products/all_products.dart';
import 'package:gstore_official/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:gstore_official/features/shop/screens/home/widgets/home_categories.dart';
import 'package:gstore_official/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/custom_shape/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shape/container/search_container.dart';
import '../../../../common/widgets/texts/action_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';
import '../blogs/blogs.dart';
import '../service/terms.dart';
import '../footer/home_footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  ///

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// App Bar
                  THomeAppbar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Search Container
                  TSearchContainer(
                    text: 'Search in Store',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Popular Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Heading
                        TActionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        /// Categories
                        THomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts(
                          title: 'Popular Products',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No Data Found',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    return TGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),

            /// Blog
            const Blogs(),

            // Services and Contact Information
            const ServiceAndContactInformation(),

            /// Policies
            const THomeFooter(),
          ],
        ),
      ),
    );
  }
}
