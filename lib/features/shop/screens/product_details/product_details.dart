import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tedix/common/widget/appbar/appbar.dart';
import 'package:tedix/common/widget/curved_edges/curved_edges_widget.dart';
import 'package:tedix/common/widget/texts/section_heading.dart';
import 'package:tedix/features/shop/screens/product_details/widgets/product_data_detail.dart';
import 'package:tedix/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:tedix/utils/constants/colors.dart';
import 'package:tedix/utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImage(),
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace,left: TSizes.defaultSpace,bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  TProductDataDetail(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.only(top: TSizes.spaceBtwSections),
                    child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('ADD CART')),),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(title: 'Description', showActionButton: false),
                  ReadMoreText(
                    'Titanium design, latest-generation, ceramic shield front, textured matte glass back. The iPhone 16 Pro Max display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.86 inches diagonally (actual viewable area is less).',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: 'Show Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

