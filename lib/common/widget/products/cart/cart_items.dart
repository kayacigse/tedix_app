import 'package:flutter/material.dart';

import '../../texts/product_price_text.dart';
import 'cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 32),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          Row(
            children: [
              SizedBox(width: 60),
              TProductPriceText(price:'1299,9'),
            ],
          ),
        ],
      ),
    );
  }
}

