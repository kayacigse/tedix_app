import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';



class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: showBackground ? Color.fromRGBO(249, 249, 249, 100) : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color:Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon,color: Color.fromRGBO(79, 79, 79, 100)),
              const SizedBox(width: 16),
              Text(text, style: Theme.of(context).textTheme.bodySmall),

            ],
          ),

        ),
      ),
    );
  }
}