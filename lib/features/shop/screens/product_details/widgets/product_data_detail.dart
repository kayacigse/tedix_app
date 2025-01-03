import 'package:flutter/material.dart';
import 'package:tedix/common/widget/texts/brand_title_text.dart';
import 'package:tedix/common/widget/texts/product_price_text.dart';
import 'package:tedix/utils/constants/enums.dart';
import '../../../../../common/widget/containers/rounded_container.dart';
import '../../../../../common/widget/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/sizes.dart';

//meta

class TProductDataDetail extends StatelessWidget {
  const TProductDataDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Positioned(
              top: 12,
              child: TRoundedContainer(
                radius: TSizes.lg,
                backgroundColor: TColors.accent,
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.xs),
                child: Text('Price', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
              ),
            ),
            const TProductPriceText(price: '1299.9'),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        const TProductTitleText(title: 'Iphone 16 Pro Max'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        Row(
          children: [
            TBrandTitleText(title: 'Apple', brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
