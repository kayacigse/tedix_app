import 'package:flutter/material.dart';
import 'package:tedix/utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.grey,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkGrey,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2)
  );
}
