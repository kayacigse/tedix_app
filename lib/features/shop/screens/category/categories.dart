import 'package:flutter/material.dart';
import 'package:tedix/common/widget/products/products_cards/product_card_vertical.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/images/t_rounded_image.dart';
import '../../../../layouts/grid_layout.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('FOOD'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Column(
            children: [
              TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),

            ],
          ),
        ),
      ),
    );
  }
}