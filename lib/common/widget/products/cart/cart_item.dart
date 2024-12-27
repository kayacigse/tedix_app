import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/brand_title_text.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: TColors.light,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TProductTitleText(title: 'Iphone 16 Pro Max',maxLines: 1),
            TBrandTitleText(title: 'Apple'),
          ],
        ),
      ],
    );
  }
}