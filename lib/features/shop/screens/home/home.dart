import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/curved_edges/curved_edges.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tedix/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tedix/layouts/grid_layout.dart';
import 'package:tedix/utils/constants/colors.dart';
import 'package:tedix/utils/constants/enums.dart';
import 'package:tedix/utils/device/device_utility.dart';
import '../../../../common/widget/containers/circular_container.dart';
import '../../../../common/widget/containers/primary_header_container.dart';
import '../../../../common/widget/containers/search_container.dart';
import '../../../../common/widget/curved_edges/curved_edges_widget.dart';
import '../../../../common/widget/texts/section_heading.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(title: 'Categories', showActionButton: false, textColor: Colors.white),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        THomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: 'Popular Products' , onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProducts()));}),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
